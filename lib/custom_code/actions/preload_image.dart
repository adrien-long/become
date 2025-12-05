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

// BEGIN AUTOMATIC IMPORTS: DO NOT MODIFY
import 'package:flutter/widgets.dart';
// END AUTOMATIC IMPORTS; begin your custom code below 🎯

Future<void> preloadImage(
  BuildContext context, // ← MUST be first!
  String? imageUrl, // ↓ your other inputs go after
) async {
  if (imageUrl == null || imageUrl.trim().isEmpty) return;

  final provider = NetworkImage(imageUrl.trim());
  await precacheImage(provider, context);
}
