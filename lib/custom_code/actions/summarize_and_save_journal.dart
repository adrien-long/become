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

Future<String> summarizeAndSaveJournal(DocumentReference userRef) async {
  try {
    print('Fetching user document...');
    final userDoc = await userRef.get();
    final data = userDoc.data() as Map<String, dynamic>?;
    final dynamic activeJournalRaw = data?['active_journal'];

    if (activeJournalRaw == null || activeJournalRaw is! DocumentReference) {
      print('No active journal found.');
      throw Exception('User has no active journal.');
    }

    final DocumentReference activeJournalRef = activeJournalRaw;
    print('Active journal reference: ${activeJournalRef.path}');

    final journalEntriesQuery = await FirebaseFirestore.instance
        .collection('journal_entries')
        .where('journal', isEqualTo: activeJournalRef)
        .get();

    print('Found ${journalEntriesQuery.docs.length} journal entries.');

    if (journalEntriesQuery.docs.isEmpty) {
      await activeJournalRef.update({'summary': ''});
      print('No journal entries found. Saved empty summary.');
      return 'No journal entries found.';
    }

    final List<String> lines = [];

    for (var entryDoc in journalEntriesQuery.docs) {
      final entryData = entryDoc.data();
      final String? answer = entryData['answer'];
      final dynamic questionRefRaw = entryData['question_ref'];

      print('Entry found. Answer: $answer');

      if (answer == null || answer.trim().isEmpty) {
        print('Skipped: Empty answer');
        continue;
      }

      if (questionRefRaw == null || questionRefRaw is! DocumentReference) {
        print('Skipped: Invalid questionRef');
        continue;
      }

      final questionRef = questionRefRaw;
      final questionDoc = await questionRef.get();

      if (!questionDoc.exists) {
        print('Skipped: Question doc does not exist');
        continue;
      }

      final questionData = questionDoc.data() as Map<String, dynamic>?;
      final String? question = questionData?['content'];

      if (question == null || question.trim().isEmpty) {
        print('Skipped: Question text is empty');
        continue;
      }

      print('Adding to summary: $question: $answer');
      lines.add('$question: $answer');
    }

    final String summary = lines.join('\n');
    print('Final summary to be saved:\n$summary');

    await activeJournalRef.update({'summary': summary});
    print('Summary successfully saved.');

    return summary;
  } catch (e, stacktrace) {
    print('Error summarizing journal: $e\n$stacktrace');
    return 'Error: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
