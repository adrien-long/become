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
import 'package:intl/intl.dart'; // ✅ needed for Intl.getCurrentLocale
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'dart:ui' as ui; // ✅ fallback for locale when Intl fails

Future<void> storeUserDeviceInfo(DocumentReference userRef) async {
  print('🟡 [storeUserDeviceInfo] start');
  try {
    if (userRef == null) {
      print('🔴 [storeUserDeviceInfo] userRef is null — abort');
      return;
    }
    print('📄 [storeUserDeviceInfo] userRef: ${userRef.path}');

    // --- Resolve language code ---
    String languageCode = '';
    try {
      final intlLocale = Intl.getCurrentLocale(); // e.g., "en_US" or "fr-FR"
      print('🌐 [storeUserDeviceInfo] Intl.getCurrentLocale(): $intlLocale');
      if (intlLocale.isNotEmpty) {
        // Normalize to 2-letter code when possible
        final parts = intlLocale.split(RegExp(r'[_-]'));
        languageCode =
            (parts.isNotEmpty ? parts.first : intlLocale).toLowerCase();
      }
    } catch (e) {
      print('⚠️ [storeUserDeviceInfo] Intl.getCurrentLocale() failed: $e');
    }

    // Fallback using dart:ui if needed
    if (languageCode.isEmpty) {
      final uiLocale =
          ui.PlatformDispatcher.instance.locale; // e.g., Locale('en','US')
      languageCode =
          (uiLocale.languageCode.isNotEmpty ? uiLocale.languageCode : 'en')
              .toLowerCase();
      print('🌐 [storeUserDeviceInfo] Fallback ui.locale -> $languageCode');
    }

    // --- Detect platform (safe for web; no dart:io import) ---
    final bool isWeb = kIsWeb;
    final bool isIOS = !isWeb && defaultTargetPlatform == TargetPlatform.iOS;
    final bool isAndroid =
        !isWeb && defaultTargetPlatform == TargetPlatform.android;

    print(
        '💻 [storeUserDeviceInfo] Platform -> isWeb:$isWeb, isIOS:$isIOS, isAndroid:$isAndroid');

    // --- Write to Firestore ---
    final payload = {
      'language_code': languageCode,
      'language_set_at': FieldValue.serverTimestamp(),
      'is_web': isWeb,
      'is_ios': isIOS,
      'is_android': isAndroid,
    };
    print('✍️  [storeUserDeviceInfo] Updating user with: $payload');

    // Use set(merge:true) so it works even if doc doesn’t exist yet
    await userRef.set(payload, SetOptions(merge: true));

    print('✅ [storeUserDeviceInfo] Success');
  } catch (e, st) {
    print('🔴 [storeUserDeviceInfo] Error: $e');
    print(st);
  } finally {
    print('🟢 [storeUserDeviceInfo] end');
  }
}
