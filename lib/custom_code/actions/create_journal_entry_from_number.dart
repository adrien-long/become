// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ✅ Added

Future<DocumentReference?> createJournalEntryFromNumber(
  int lastQuestionNumber,
  DocumentReference activeJournalRef,
) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    print('📌 Starting createJournalEntryFromNumber');
    print('🔢 lastQuestionNumber received: $lastQuestionNumber');

    final int nextNumber = lastQuestionNumber + 1;
    print('➡️ Looking for question with onboarding_order = $nextNumber');

    final QuerySnapshot questionQuery = await firestore
        .collection('questions')
        .where('onboarding_order', isEqualTo: nextNumber)
        .limit(1)
        .get();

    print(
        '📚 Question query completed. Documents found: ${questionQuery.docs.length}');

    if (questionQuery.docs.isEmpty) {
      print('❌ No question found with onboarding_order = $nextNumber');
      return null;
    }

    final DocumentReference questionRef = questionQuery.docs.first.reference;
    print('✅ Found questionRef: ${questionRef.path}');

    if (activeJournalRef == null) {
      print('❌ activeJournalRef is null');
      return null;
    }

    // 🔽🔽🔽 ADDED: resolve user language and question text
    // Get current user's language_code (default to 'en' if unavailable)
    String userLang = 'en';
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final userSnap = await firestore.collection('users').doc(uid).get();
        userLang = (userSnap.data()?['language_code'] as String?) ?? 'en';
      }
      print('🌐 userLang resolved to: $userLang');
    } catch (e) {
      print('⚠️ Could not fetch user language, defaulting to en: $e');
    }

    // Load the question doc to access its multilingual "document" array
    final questionDocSnap = await questionRef.get();
    final Map<String, dynamic> questionData =
        (questionDocSnap.data() as Map<String, dynamic>?) ?? {};
    final List<dynamic> docArray =
        (questionData['document'] as List<dynamic>?) ?? [];

    // Helper to find content for a given language code
    String? contentForLang(List<dynamic> arr, String lang) {
      for (final item in arr) {
        if (item is Map<String, dynamic>) {
          final lc = item['language_code'] as String?;
          final ct = item['content'] as String?;
          if (lc != null && ct != null && lc == lang) return ct;
        }
      }
      return null;
    }

    // Best-effort resolution: userLang -> 'en' -> first available -> ''
    String questionText = contentForLang(docArray, userLang) ??
        contentForLang(docArray, 'en') ??
        (() {
          for (final item in docArray) {
            if (item is Map<String, dynamic>) {
              final ct = item['content'] as String?;
              if (ct != null && ct.isNotEmpty) return ct;
            }
          }
          return '';
        })();

    print('🗒️ Resolved question text: $questionText');
    // 🔼🔼🔼 END ADDED

    print('📝 Creating journal entry with:');
    print('- journalRef: ${activeJournalRef.path}');
    print('- questionRef: ${questionRef.path}');

    final DocumentReference journalEntryRef =
        await firestore.collection('journal_entries').add({
      'question_ref': questionRef,
      'journal': activeJournalRef,
      'created_at': FieldValue.serverTimestamp(),
      'question': questionText, // ✅ NEW field: localized question text
    });

    print('✅ Journal entry created: ${journalEntryRef.path}');
    return journalEntryRef;
  } catch (error, stackTrace) {
    print('🔥 Exception in createJournalEntryFromNumber: $error');
    print(stackTrace);
    return null;
  }
}
