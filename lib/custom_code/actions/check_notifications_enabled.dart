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

import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Action name suggestion in FF: CheckNotificationsEnabled No arguments
/// needed.
///
/// Returns: bool — true if notifications are enabled/granted, false
/// otherwise.
Future<bool> checkNotificationsEnabled() async {
  if (kIsWeb) {
    // Web doesn't support this plugin; return false to default to "not enabled"
    return false;
  }

  final status = await Permission.notification.status;
  return status.isGranted;
}
