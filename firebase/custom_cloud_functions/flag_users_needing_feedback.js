const { onSchedule } = require("firebase-functions/v2/scheduler");
const { getFirestore } = require("firebase-admin/firestore");
const admin = require("firebase-admin");
const moment = require("moment-timezone");

/** 🔧 Change this value to adjust how many days we look back */
const DAYS_WITHOUT_FEEDBACK = 14;

/**
 * Runs daily. Flags users who haven't left feedback in the last X days.
 * Sets users.request_feedback = true for those users.
 */
exports.flagUsersNeedingFeedback = onSchedule(
  {
    // Run every day at XX:XX UTC (change if you prefer)
    schedule: "30 12 * * *",
    // region: "europe-west1",
    // timeoutSeconds: 540,
    // memory: "512MiB",
  },
  async () => {
    const db = getFirestore();
    const cutoff = moment
      .utc()
      .subtract(DAYS_WITHOUT_FEEDBACK, "days")
      .toDate();

    console.log(
      `🔎 Checking feedbacks since ${cutoff.toISOString()} (last ${DAYS_WITHOUT_FEEDBACK} days)`,
    );

    // 1) Load all feedbacks from the last X days and collect user refs
    const recentFeedbackSnap = await db
      .collection("feedbacks")
      .where("created_at", ">=", cutoff)
      .get();

    const usersWithRecentFeedback = new Set();
    for (const doc of recentFeedbackSnap.docs) {
      const data = doc.data() || {};
      const createdBy = data.created_by; // DocumentReference to users/{id}
      if (createdBy && typeof createdBy.path === "string") {
        usersWithRecentFeedback.add(createdBy.path);
      }
    }

    console.log(
      `🧾 Found ${recentFeedbackSnap.size} feedback(s) in last ${DAYS_WITHOUT_FEEDBACK} days from ${usersWithRecentFeedback.size} unique user(s).`,
    );

    // 2) Iterate all users and collect those who need to be flagged
    const usersSnap = await db.collection("users").get();
    console.log(`👥 Loaded ${usersSnap.size} users.`);

    const toFlag = [];
    for (const userDoc of usersSnap.docs) {
      const userPath = userDoc.ref.path;
      if (!usersWithRecentFeedback.has(userPath)) {
        toFlag.push(userDoc.ref);
      }
    }

    console.log(
      `🚩 Users needing request_feedback=true (no feedback in ${DAYS_WITHOUT_FEEDBACK} days): ${toFlag.length}`,
    );

    // 3) Batch updates in chunks (max 500 writes per batch; we use 400 for margin)
    const CHUNK = 400;
    let updated = 0;

    for (let i = 0; i < toFlag.length; i += CHUNK) {
      const batch = db.batch();
      const slice = toFlag.slice(i, i + CHUNK);

      for (const userRef of slice) {
        batch.set(
          userRef,
          {
            request_feedback: true,
            request_feedback_updated_at:
              admin.firestore.FieldValue.serverTimestamp(),
          },
          { merge: true },
        );
      }

      await batch.commit();
      updated += slice.length;
      console.log(
        `✅ Committed batch: ${slice.length} users (total updated: ${updated})`,
      );
    }

    console.log(`🎉 Done. Flagged ${updated} user(s) to request feedback.`);
  },
);
