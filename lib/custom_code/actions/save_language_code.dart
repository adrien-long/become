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
import '/auth/firebase_auth/auth_util.dart'; // gives you currentUserReference
import '/flutter_flow/flutter_flow_util.dart'; // gives you FFLocalizations

Future<void> saveLanguageCode(BuildContext context) async {
  try {
    final langCode = FFLocalizations.of(context).languageCode;
    if (currentUserReference != null && langCode.isNotEmpty) {
      await currentUserReference!.update({
        'language_code': langCode,
      });
      print('✅ Language code saved: $langCode');
    }
  } catch (e) {
    print('❌ Failed to save language code: $e');
  }
}
