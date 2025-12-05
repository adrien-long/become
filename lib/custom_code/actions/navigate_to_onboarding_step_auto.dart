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
import 'package:go_router/go_router.dart';
import '/auth/firebase_auth/auth_util.dart'; // for currentUserReference

Future navigateToOnboardingStepAuto(BuildContext context) async {
  print('qweqweqweqweqw');
  final userRef = currentUserReference;
  if (userRef == null) return;

  try {
    final snap = await userRef.get();
    if (!snap.exists) return;

    final data = snap.data() as Map<String, dynamic>?;

    final String? routeName = (data?['onboarding_step'] as String?)?.trim();
    final DocumentReference? journalRef =
        data?['last_onboarding_journal_entry'] as DocumentReference?;

    if (routeName == null || routeName.isEmpty) {
      // Nothing recorded → do nothing or send to a safe default
      // context.goNamed('HomePage');
      return;
    }

    if (routeName == 'EditJournalEntry') {
      // Must have a journal ref to edit
      //   if (journalRef == null) {
      // Fallback to a safe page if we don't have the reference
      context.goNamed('QuotesNew');
      return;
    }

    // Pass params the way FlutterFlow pages expect them: queryParameters
    //    context.goNamed(
    //     'EditJournalEntry',
    //    queryParameters: {
    //      'isOnboarding': serializeParam(true, ParamType.bool),
    //      'journalEntry': serializeParam(
    //        journalRef,
    //       ParamType.DocumentReference,
    //     ),
    //    }.withoutNulls,
    //   );
    //   return;
// }

    // Any other recorded route
    context.goNamed(routeName);
  } catch (e) {
    // Fallback to a safe page if something goes wrong
    context.goNamed('QuotesNew');
  }
}
