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

// Custom import
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateUserTimezoneIfChanged(DocumentReference userRef) async {
  // 1️⃣ Get current device timezone
  final String currentTz = await FlutterTimezone.getLocalTimezone();

  // 2️⃣ Read the user document snapshot
  final DocumentSnapshot snapshot = await userRef.get();

  // 3️⃣ Safely convert snapshot data to a map
  final data = snapshot.data() as Map<String, dynamic>?;

  // 4️⃣ Check if 'timezone' exists and retrieve it; otherwise, treat as null
  final String? savedTz = (data != null && data.containsKey('timezone'))
      ? data['timezone'] as String?
      : null;

  // 5️⃣ Only update if there's no saved timezone or it's different
  if (savedTz == null || savedTz != currentTz) {
    await userRef.update({
      'timezone': currentTz,
      'timezone_last_updated_at': FieldValue.serverTimestamp(),
    });
  }

  // 6️⃣ Done
  return;
}
