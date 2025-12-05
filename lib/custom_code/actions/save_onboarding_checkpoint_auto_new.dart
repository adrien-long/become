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

import '/auth/firebase_auth/auth_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future saveOnboardingCheckpointAutoNew(
  int pageIndex,
) async {
  final userRef = currentUserReference;
  if (userRef == null) return;

  final steps = FFAppConstants.OnboardPageNames.toList();

  String routeName = 'Step_${pageIndex + 1}';
  if (pageIndex >= 0 && pageIndex < steps.length) {
    routeName = steps[pageIndex];
  }

  final updateData = <String, dynamic>{
    'onboarding_step': routeName,
  };

  try {
    await userRef.update(updateData);
  } catch (e) {
    await userRef.set(updateData, SetOptions(merge: true));
  }
}
