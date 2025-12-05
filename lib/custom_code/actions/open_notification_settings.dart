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

import 'package:app_settings/app_settings.dart';

Future openNotificationSettings() async {
  // This will open the notification settings screen for your app
  try {
    await AppSettings.openAppSettings(type: AppSettingsType.notification);
  } catch (e) {
    debugPrint("Error opening notification settings: $e");
  }
}
