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
import '/auth/firebase_auth/auth_util.dart';
import 'package:go_router/go_router.dart';

Future saveOnboardingCheckpointAuto(BuildContext context) async {
  final userRef = currentUserReference;
  if (userRef == null) return;

  // Get router state
  final state = GoRouterState.of(context);

  // 1) Route name (preferred), else derive from matchedLocation
  String? routeName = state.name?.trim();
  if (routeName == null || routeName.isEmpty) {
    final loc = state.matchedLocation; // e.g. "/Intro1" or "/edit"
    var derived = loc.startsWith('/') ? loc.substring(1) : loc;
    if (derived.contains('/')) {
      // if nested like "onboarding/Intro1", keep last segment
      derived = derived.split('/').last;
    }
    routeName = derived.trim();
  }
  if (routeName.isEmpty) return;

  // 2) Try to read a DocumentReference passed via extras
  DocumentReference? journalEntryRef;
  final extra = state.extra;
  if (extra is Map && extra['journalEntry'] is DocumentReference) {
    journalEntryRef = extra['journalEntry'] as DocumentReference;
  }

  // 3) Update payload
  final updateData = <String, dynamic>{
    'onboarding_step': routeName,
    if (journalEntryRef != null)
      'last_onboarding_journal_entry': journalEntryRef,
  };

  // 4) Save
  try {
    await userRef.update(updateData);
  } catch (e) {
    // Optional: create if missing
    // await userRef.set(updateData, SetOptions(merge: true));
  }
}
