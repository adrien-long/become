const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const db = admin.firestore();
const fcm = admin.messaging();

const BATCH_SIZE = 500;
const NOTIFICATIONS_PAGE_SIZE = 1000;
const TOKENS_PER_USER_LIMIT = 100;

exports.sendScheduledNotifications = functions
  .region("europe-west3")
  .runWith({
    timeoutSeconds: 540,
    memory: "512MB",
  })
  .pubsub.schedule("*/5 * * * *")
  .timeZone("Europe/Central")
  .onRun(async (context) => {
    console.log("Starting scheduled push notifications job...");

    let processedCount = 0;
    let sentCount = 0;
    let errorCount = 0;

    let lastDoc = null;
    const pendingQueryBase = db
      .collection("custom_user_push_notifications")
      .where("scheduled_time", "<=", admin.firestore.Timestamp.now())
      .where("sent_at", "==", null)
      .orderBy("scheduled_time")
      .limit(NOTIFICATIONS_PAGE_SIZE);

    do {
      let query = pendingQueryBase;
      if (lastDoc) {
        query = query.startAfter(lastDoc);
      }

      const snapshot = await query.get();
      if (snapshot.empty) {
        console.log("No more pending notifications.");
        break;
      }

      lastDoc = snapshot.docs[snapshot.docs.length - 1];

      const notifications = snapshot.docs;

      const updateBatch = db.batch();
      let updateOperationCount = 0;

      for (const notifDoc of notifications) {
        const notifData = notifDoc.data();
        const userRefPath = notifData.user_refs;
        const userId = userRefPath.split("/").pop();

        try {
          const tokensSnapshot = await db
            .collection("users")
            .doc(userId)
            .collection("fcm_tokens")
            .limit(TOKENS_PER_USER_LIMIT)
            .get();

          if (tokensSnapshot.empty) {
            console.log(`No tokens for user ${userId}, marking as sent`);
          } else {
            const tokens = tokensSnapshot.docs
              .map((doc) => doc.data().fcm_token)
              .filter((token) => token && typeof token === "string");

            if (tokens.length > 0) {
              for (let i = 0; i < tokens.length; i += BATCH_SIZE) {
                const batchTokens = tokens.slice(i, i + BATCH_SIZE);

                const messages = batchTokens.map((token) => ({
                  token,
                  notification: {
                    title: notifData.notification_title,
                    body: notifData.notification_text,
                  },
                  data: {
                    initialPageName: notifData.initial_page_name || "",
                    parameterData: JSON.stringify({
                      quoteId: notifData.quote_id || "",
                      category: notifData.category || "",
                    }),
                  },
                  apns: {
                    payload: {
                      aps: { sound: "default" },
                    },
                  },
                  android: {
                    priority: "high",
                  },
                }));

                const response = await fcm.sendEach(messages, false);

                sentCount += response.successCount;

                response.responses.forEach((resp, idx) => {
                  if (!resp.success) {
                    const error = resp.error;
                    const failedToken = batchTokens[idx];
                    console.warn(
                      `Failed to send to ${failedToken}:`,
                      error?.message,
                    );
                  }
                });
              }
            }
          }

          const now = Date.now();
          updateBatch.set(notifDoc.ref, { sent_at: now }, { merge: true });
          updateOperationCount++;

          if (updateOperationCount >= 499) {
            await updateBatch.commit();
            updateBatch = db.batch();
            updateOperationCount = 0;
          }

          processedCount++;
        } catch (err) {
          console.error(
            `Error processing notification ${notifDoc.id} for user ${userId}:`,
            err,
          );
          errorCount++;
          updateBatch.set(
            notifDoc.ref,
            { sent_at: Date.now() },
            {
              merge: true,
            },
          );
          updateOperationCount++;
        }
      }

      if (updateOperationCount > 0) {
        await updateBatch.commit();
      }

      console.log(
        `Processed page: ${notifications.length} notifications | Total sent: ${sentCount}`,
      );
    } while (true);

    console.log(
      `Job complete. Processed: ${processedCount}, Sent: ${sentCount}, Errors: ${errorCount}`,
    );
  });
