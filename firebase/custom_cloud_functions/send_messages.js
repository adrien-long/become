const { onSchedule } = require("firebase-functions/v2/scheduler");
const { defineSecret } = require("firebase-functions/params");
const { getFirestore } = require("firebase-admin/firestore");
const OpenAI = require("openai");
const admin = require("firebase-admin");
const moment = require("moment-timezone");

const OPENAI_API_KEY = defineSecret("OPENAI_API_KEY");

// Aligned with custom times
const NOTIFICATION_TIMES = ["10:10", "14:14", "19:19"];

const TEST_NOTIFICATION_TIMES = [
  "08:00",
  "08:15",
  "08:30",
  "08:45",
  "09:00",
  "09:15",
  "09:30",
  "09:45",
  "10:00",
  "10:15",
  "10:30",
  "10:45",
  "11:00",
  "11:15",
  "11:30",
  "11:45",
  "12:00",
  "12:15",
  "12:30",
  "12:45",
  "13:00",
  "13:15",
  "13:30",
  "13:45",
  "14:00",
  "14:15",
  "14:30",
  "14:45",
  "15:00",
  "15:15",
  "15:30",
  "15:45",
  "16:00",
  "16:15",
  "16:30",
  "16:45",
  "17:00",
  "17:15",
  "17:30",
  "17:45",
  "18:00",
  "18:15",
  "18:30",
  "18:45",
  "19:00",
  "19:15",
  "19:30",
  "19:45",
  "20:00",
  "20:15",
  "20:30",
  "20:45",
  "21:00",
  "21:15",
  "21:30",
  "21:45",
  "22:00",
];

/** 🎨 Load wallpapers (filtered) once. */
async function loadAllWallpapers(db) {
  try {
    const snap = await db
      .collection("wallpapers")
      .where("font_color", "==", "#f9f8f5")
      .get();

    const items = [];
    for (const doc of snap.docs) {
      items.push({ ref: doc.ref });
    }

    console.log(
      `🎨 Found ${items.length} wallpapers with font_color = #f9f8f5`,
    );
    return items;
  } catch (err) {
    console.error("❌ Failed to load filtered wallpapers:", err);
    return [];
  }
}

function pickRandom(arr) {
  if (!Array.isArray(arr) || arr.length === 0) return null;
  const idx = Math.floor(Math.random() * arr.length);
  return arr[idx];
}

/** 🧱 Load production prompts and pick one with weights. */
async function pickWeightedProductionPrompt(db) {
  try {
    const snap = await db
      .collection("prompts")
      .where("is_production", "==", true)
      .get();

    if (snap.empty) {
      console.warn("⚠️ No production prompts found.");
      return null;
    }

    const items = snap.docs
      .map((d) => {
        const data = d.data() || {};
        const weight = Number(data.weight) > 0 ? Number(data.weight) : 1;
        const content = typeof data.content === "string" ? data.content : "";
        return { ref: d.ref, weight, content };
      })
      .filter((p) => p.content.trim().length > 0);

    if (items.length === 0) {
      console.warn(
        "⚠️ Production prompts exist but none have non-empty content.",
      );
      return null;
    }

    const total = items.reduce((sum, it) => sum + it.weight, 0);
    let r = Math.random() * total;
    for (const it of items) {
      if ((r -= it.weight) <= 0) return it;
    }
    return items[items.length - 1];
  } catch (err) {
    console.error("❌ Failed to load/pick production prompt:", err);
    return null;
  }
}

exports.sendMessages = onSchedule(
  {
    schedule: "*1 1 1 1 1", // ✅ every minute (* * * * *), rescheduled because functions is not used anymore
    secrets: [OPENAI_API_KEY],
    region: "europe-west1",
    timeoutSeconds: 540,
    memory: "1GB",
  },
  async () => {
    console.log("⏰ sendMessages triggered at", new Date().toISOString());

    const db = getFirestore();
    const client = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });

    // 🔒 Freeze invocation time once
    const invocationUtc = moment.utc();

    // ✅ 1) Pick ONE prompt
    const pickedPrompt = await pickWeightedProductionPrompt(db);
    if (!pickedPrompt) {
      console.warn("⚠️ No prompt selected. Aborting run.");
      return;
    }
    const selectedPromptRef = pickedPrompt.ref;
    const selectedPromptContent = pickedPrompt.content;
    console.log(`📝 Selected prompt ${selectedPromptRef.id} (weighted)`);

    // ✅ 2) Pick ONE background
    const wallpapers = await loadAllWallpapers(db);
    console.log(`🖼️ Loaded ${wallpapers.length} wallpapers.`);
    const pickedWallpaper = pickRandom(wallpapers);
    const selectedBackgroundRef = pickedWallpaper?.ref || null;
    console.log(
      `🖼️ Selected background ${selectedBackgroundRef ? selectedBackgroundRef.path : "(none)"}`,
    );

    // ✅ 3) Iterate users
    const usersSnapshot = await db.collection("users").get();

    for (const userDoc of usersSnapshot.docs) {
      const userData = userDoc.data();
      const userRef = userDoc.ref;

      // Premium check
      if (
        !userData.entitlements?.Premium?.expires_date ||
        new Date(userData.entitlements.Premium.expires_date) < new Date()
      ) {
        continue;
      }

      const userName = userData.display_name || "you";
      const userTimezone = userData.timezone || "UTC";
      const isTestUser = userData.is_test_user === true;

      const notificationTimes = isTestUser
        ? TEST_NOTIFICATION_TIMES
        : NOTIFICATION_TIMES;
      const nowLocal = invocationUtc.clone().tz(userTimezone);

      // ✅ Find the *target* time within a small window (≤30s) around now
      const dueTarget = notificationTimes
        .map((t) =>
          moment.tz(
            `${nowLocal.format("YYYY-MM-DD")} ${t}`,
            "YYYY-MM-DD HH:mm",
            userTimezone,
          ),
        )
        .find((target) => Math.abs(nowLocal.diff(target, "seconds")) <= 30);

      if (!dueTarget) continue;

      // 🧾 Idempotency: key by the *target* time to avoid 18:30 + 18:31 duplicates
      const slotKey = dueTarget.format("YYYY-MM-DD_HH:mm");
      const ledgerId = `${userDoc.id}_${slotKey}`;
      const ledgerRef = db.collection("send_ledger").doc(ledgerId);

      // 🔐 Atomic claim (transaction): create-if-not-exists, else skip
      const claimed = await db.runTransaction(async (tx) => {
        const snap = await tx.get(ledgerRef);
        if (snap.exists) return false;
        tx.create(ledgerRef, {
          user: userRef,
          slot: slotKey,
          created_at: admin.firestore.FieldValue.serverTimestamp(),
        });
        return true;
      });

      if (!claimed) {
        console.log(
          `↩️ Already claimed for ${userRef.id} @ ${slotKey}, skipping.`,
        );
        continue;
      }

      // 📒 Journal summary
      const journalSummary = await (async () => {
        try {
          const ref = userData.active_journal;
          if (!ref) return "";
          const doc = await ref.get();
          return doc.data()?.summary || "";
        } catch {
          return "";
        }
      })();

      const langCode = (userData.language_code || "en").toLowerCase();
      const langName = langCode === "fr" ? "French" : "English";

      const fullPrompt = [
        selectedPromptContent.trim(),
        "",
        "Context:",
        `• User name: ${userName}`,
        `• Local time: ${nowLocal.format("HH:mm")}`,
        `• User's Journal: ${journalSummary}`,
        "",
        "Output requirement:",
        "- Return ONLY the final message text for the user.",
        "- No preface, no JSON, no metadata, no markdown, no surrounding quotes.",
        "- Do not use dashes (-) of any form in your response.",
        "IMPORTANT: The final output language should be:",
        `${langName} (${langCode})`,
        "The message should be written in the user's language and not be a direct english translation.",
      ].join("\n");

      let contentText = "You are stronger than you think.";

      try {
        const resp = await client.responses.create({
          model: "gpt-4.1-2025-04-14",
          input: fullPrompt,
          temperature: 1,
          top_p: 1,
        });

        const maybeText = (resp?.output_text || "").trim();
        if (maybeText) {
          contentText = maybeText;
        } else {
          console.warn(
            `⚠️ Empty output_text for ${userRef.id}. Using fallback content.`,
          );
        }
      } catch (err) {
        console.error(`❌ OpenAI error for ${userRef.id}:`, err);
      }

      // 📲 Push notification
      try {
        await db.collection("ff_push_notifications").add({
          notification_title: "Become",
          notification_text: contentText,
          initial_page_name: "Quotes",
          notification_sound: "default",
          target_audience: "Individual",
          user_refs: `/${userRef.path}`,
          timestamp: admin.firestore.FieldValue.serverTimestamp(),
        });
        console.log(`📲 Notification created for ${userRef.id}`);
      } catch (err) {
        console.error(
          `❌ Failed to create notification for ${userRef.id}:`,
          err,
        );
      }

      // 💾 Save quote
      try {
        await db.collection("quotes").add({
          content: contentText,
          author: "",
          source: "",
          url: "",
          themes: "",
          created_at: new Date(),
          user: userRef,
          is_favorited: false,
          is_public: false,
          is_approved: false,
          is_deleted: false,
          created_by: "sendMessages",
          prompt_content: fullPrompt,
          prompt: selectedPromptRef,
          language_code: userData.language_code || "en",
          background_image: selectedBackgroundRef,
        });
        console.log(
          `✅ Quote saved for ${userRef.id} with prompt ${selectedPromptRef.path} and background_image ${
            selectedBackgroundRef ? selectedBackgroundRef.path : "(none)"
          }`,
        );
      } catch (err) {
        console.error(`❌ Failed to save quote for ${userRef.id}:`, err);
      }
    }

    console.log("✅ sendMessages execution completed.");
  },
);
