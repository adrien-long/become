const { onSchedule } = require("firebase-functions/v2/scheduler");
const { getFirestore } = require("firebase-admin/firestore");
const admin = require("firebase-admin"); // for FieldValue

// --- Helpers ---

// Load wallpapers whose font_color is "white" or "#f9f8f5" (fallback to old filter)
async function loadWhiteWallpapers(db) {
  try {
    // Prefer using 'in' to cover both values if supported
    const snap = await db
      .collection("wallpapers")
      .where("font_color", "in", ["white", "#f9f8f5"])
      .get();

    if (!snap.empty) {
      console.log(
        `🎨 Found ${snap.size} wallpapers with white-ish font color.`,
      );
      return snap.docs.map((d) => d.ref);
    }

    // Fallback: legacy filter only (#f9f8f5)
    const legacy = await db
      .collection("wallpapers")
      .where("font_color", "==", "#f9f8f5")
      .get();

    console.log(`🎨 Fallback found ${legacy.size} wallpapers with #f9f8f5.`);
    return legacy.docs.map((d) => d.ref);
  } catch (err) {
    console.error("❌ Failed to load white wallpapers:", err);
    return [];
  }
}

function pickRandomRef(arr) {
  if (!Array.isArray(arr) || arr.length === 0) return null;
  const idx = Math.floor(Math.random() * arr.length);
  return arr[idx];
}

// Fetch ONE editors_pick where is_published != true (false or missing)
async function fetchOneUnpublishedEditorsPick(db) {
  // 1) Try is_published == false
  let snap = await db
    .collection("editors_picks")
    .where("is_published", "==", false)
    .orderBy("__name__")
    .limit(1)
    .get();
  if (!snap.empty) return snap.docs[0];

  // 2) Try is_published == null (matches explicit null; missing handled later)
  snap = await db
    .collection("editors_picks")
    .where("is_published", "==", null)
    .orderBy("__name__")
    .limit(1)
    .get();
  if (!snap.empty) return snap.docs[0];

  // 3) Small scan & client-side filter as a last resort (missing field)
  snap = await db
    .collection("editors_picks")
    .orderBy("__name__")
    .limit(50)
    .get();
  const candidate = snap.docs.find((d) => d.get("is_published") !== true);
  return candidate || null;
}

// --- Scheduled publisher ---

// Runs every day at 09:00 Europe/Paris
exports.publishEditorsPickDaily = onSchedule(
  {
    schedule: "0 9 * * *",
    timeZone: "Europe/Paris",
    // Optional:
    // region: "europe-west1",
    // timeoutSeconds: 300,
    // memory: "512MiB",
  },
  async () => {
    const db = getFirestore();

    // Select ONE unpublished editors_pick
    const pickDoc = await fetchOneUnpublishedEditorsPick(db);
    if (!pickDoc) {
      console.log(
        "🛌 No editors_picks pending (is_published != true). Nothing to publish today.",
      );
      return;
    }
    const pickRef = pickDoc.ref;

    // Load white-ish wallpapers once and pick one randomly
    const whiteWallpapers = await loadWhiteWallpapers(db);
    const selectedBackgroundRef = pickRandomRef(whiteWallpapers);
    console.log(
      `🖼️ Selected background: ${selectedBackgroundRef ? selectedBackgroundRef.path : "(none)"}`,
    );

    // Pre-create quote refs (so we can reference them inside the transaction)
    const quotesCol = db.collection("quotes");
    const enQuoteRef = quotesCol.doc();
    const frQuoteRef = quotesCol.doc();

    await db.runTransaction(async (tx) => {
      const fresh = await tx.get(pickRef);
      if (!fresh.exists)
        throw new Error("Selected editors_picks doc disappeared.");

      const data = fresh.data() || {};
      if (data.is_published === true) {
        console.log(
          `↩️ editors_picks/${pickRef.id} already published. Skipping.`,
        );
        return;
      }

      const author = (data.author || "").trim();
      const contentEn = (data.content_english || "").trim();
      const contentFr = (data.content_french || "").trim();

      if (!contentEn && !contentFr) {
        console.warn(
          `⚠️ editors_picks/${pickRef.id} has no EN/FR content — leaving as unpublished so it can be fixed.`,
        );
        return;
      }

      // If we have a selected background, fetch its 'image' path inside the transaction
      let selectedBackgroundPath = null;
      if (selectedBackgroundRef) {
        const bgDoc = await tx.get(selectedBackgroundRef);
        if (bgDoc.exists) {
          const img = bgDoc.get("image");
          if (typeof img === "string" && img.trim().length > 0) {
            selectedBackgroundPath = img.trim();
          }
        }
      }

      if (selectedBackgroundRef) {
        console.log(
          `🧵 Using background ref ${selectedBackgroundRef.path} with path "${selectedBackgroundPath || "(empty)"}"`,
        );
      }

      const now = new Date();
      const baseQuote = {
        author: author || "",
        source: "",
        url: "",
        themes: "",
        created_at: now,
        is_favorited: false,
        is_public: true,
        is_approved: true,
        is_deleted: false,
        created_by: "editors_picks",
        editors_pick: pickRef, // backref to the source pick
        background_image: selectedBackgroundRef || null, // DocRef
        background_image_path: selectedBackgroundPath || null, // String path from wallpapers.image
      };

      const publishedQuoteRefs = [];

      if (contentEn) {
        tx.set(enQuoteRef, {
          ...baseQuote,
          content: contentEn,
          language_code: "en",
        });
        publishedQuoteRefs.push(enQuoteRef);
      }

      if (contentFr) {
        tx.set(frQuoteRef, {
          ...baseQuote,
          content: contentFr,
          language_code: "fr",
        });
        publishedQuoteRefs.push(frQuoteRef);
      }

      // Mark as published ✅
      tx.update(pickRef, {
        is_published: true,
        published_at: admin.firestore.FieldValue.serverTimestamp(),
        published_quote_refs: publishedQuoteRefs, // array of DocRefs
      });
    });

    console.log(
      `🎉 Published editors_picks/${pickRef.id} with background ${
        selectedBackgroundRef ? selectedBackgroundRef.path : "(none)"
      }`,
    );
  },
);
