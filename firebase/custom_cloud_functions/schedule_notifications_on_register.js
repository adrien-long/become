const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

const db = admin.firestore();

function getScheduledTimes(settings) {
  const qty = Math.max(1, settings?.messagePerDay ?? 3);
  const getMinutesSinceMidnight = (timestamp, d) => {
    if (!timestamp) {
      return d;
    }
    const date = timestamp.toDate();
    return date.getHours() * 60 + date.getMinutes();
  };
  const formatTime = (totalMinutes) => {
    const h = Math.floor(totalMinutes / 60)
      .toString()
      .padStart(2, "0");
    const m = (totalMinutes % 60).toString().padStart(2, "0");
    return `${h}:${m}`;
  };
  const roundToNearest5 = (minutes) => Math.round(minutes / 5) * 5;
  const startMinutes = getMinutesSinceMidnight(
    settings?.startTime,
    600 /*10:00*/,
  );
  const endMinutes = getMinutesSinceMidnight(settings?.endTime, 1080 /*18:00*/);
  const isOvernight = endMinutes < startMinutes;
  const totalMinutes = isOvernight
    ? 24 * 60 - startMinutes + endMinutes
    : endMinutes - startMinutes;
  const maxPossibleQty = Math.floor(totalMinutes / 5) + 1;
  const actualQty = Math.min(qty, maxPossibleQty);
  if (actualQty <= 1) {
    return [formatTime(roundToNearest5(startMinutes))];
  }
  const step = totalMinutes / (actualQty - 1);
  const result = [];
  for (let i = 0; i < actualQty; i++) {
    const minutesOffset = step * i;
    let candidateMinutes = startMinutes + minutesOffset;
    if (isOvernight && candidateMinutes >= 24 * 60) {
      candidateMinutes -= 24 * 60;
    }
    candidateMinutes = roundToNearest5(candidateMinutes);
    if (candidateMinutes >= 24 * 60) candidateMinutes -= 24 * 60;
    if (candidateMinutes < 0) candidateMinutes += 24 * 60;
    const timeStr = formatTime(candidateMinutes);
    if (!result.includes(timeStr)) {
      result.push(timeStr);
    }
  }
  const roundedEnd = roundToNearest5(endMinutes);
  if (Math.abs(roundedEnd - endMinutes) <= 2) {
    const endStr = formatTime(roundedEnd);
    if (!result.includes(endStr) && result.length < qty) {
      result.push(endStr);
    }
  }
  return result;
}

function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}

exports.scheduleNotificationsOnRegister = functions.firestore
  .document("users/{userId}")
  .onCreate(async (snap, context) => {
    console.log("New user added, scheduling notifications...");
    const userId = context.params.userId;
    const userData = snap.data();
    const userRef = snap.ref;

    const quotesSnapshot = await db.collection("quotations").get();
    const quotes = quotesSnapshot.docs.map((doc) => ({
      id: doc.id,
      ...doc.data(),
    }));

    if (quotes.length === 0) {
      console.log("No quotes found!");
      return;
    }

    const settings = userData.notification_settings || {};
    const messagesPerDay = settings.messagePerDay || 3;
    const schedulingTimes = getScheduledTimes(settings);
    const quoteCategories = settings.selectedCategories || ["Grow Mode"];
    let availableQuotes = quotes.filter((q) =>
      quoteCategories.includes(q.category),
    );

    if (availableQuotes.length === 0) {
      console.log(`No available quotes for user ${userId}`);
      return;
    }

    availableQuotes = shuffleArray([...availableQuotes]);

    const uniqueQuotesToday = availableQuotes.slice(0, messagesPerDay);
    const finalQuoteList = [];
    for (let i = 0; i < messagesPerDay; i++) {
      finalQuoteList.push(uniqueQuotesToday[i % uniqueQuotesToday.length]);
    }

    const userTimezone = userData.timezone || "UTC";
    const { DateTime } = require("luxon");

    let batch = db.batch();
    let operationCount = 0;

    for (const timeStr of schedulingTimes) {
      try {
        const [hours, minutes] = timeStr.split(":").map(Number);
        const scheduledDateTime = DateTime.now().setZone(userTimezone).set({
          hour: hours,
          minute: minutes,
          second: 0,
          millisecond: 0,
        });

        if (scheduledDateTime < DateTime.now().setZone(userTimezone)) {
          console.log(
            `Skipping past time ${timeStr} for user ${userId} in ${userTimezone}`,
          );
          continue;
        }

        const randomQuote =
          availableQuotes[Math.floor(Math.random() * availableQuotes.length)];

        const notificationRef = db
          .collection("custom_user_push_notifications")
          .doc();
        const notification = {
          notification_title: "Become",
          notification_text: randomQuote.content,
          initial_page_name: "Quotes",
          notification_sound: "default",
          target_audience: "Individual",
          user_refs: `/${userRef.path}`,
          timestamp: admin.firestore.FieldValue.serverTimestamp(),
          scheduled_time: admin.firestore.Timestamp.fromDate(
            scheduledDateTime.toJSDate(),
          ),
          sender: userRef,
          quote_id: randomQuote.id,
          category: randomQuote.category,
          sent_at: null,
        };

        batch.set(notificationRef, notification);
        operationCount++;

        if (operationCount >= BATCH_LIMIT) {
          await batch.commit();
          console.log(`Committed batch of ${operationCount} notifications`);
          batch = db.batch();
          operationCount = 0;
        }

        console.log(
          `Scheduled "${scheduledDateTime.toRFC2822()}" notification for user ${userId} in ${userTimezone}`,
        );
      } catch (err) {
        console.error(`Failed for user ${userId} at ${timeStr}:`, err.message);
      }
    }

    if (operationCount > 0) {
      await batch.commit();
      console.log(`Final batch committed: ${operationCount} notifications`);
    }

    console.log(`Completed scheduling for new user ${userId}`);
  });
