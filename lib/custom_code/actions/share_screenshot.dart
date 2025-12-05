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

import 'dart:typed_data';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> shareScreenshot(FFUploadedFile imageBytes) async {
  try {
    if (imageBytes.bytes == null) {
      print('Error: imageBytes is null');
      return;
    }

    final Uint8List bytes = imageBytes.bytes!;

    // Save temp file
    final tempDir = await getTemporaryDirectory();
    final fileName = (imageBytes.name?.isNotEmpty ?? false)
        ? imageBytes.name!
        : 'screenshot.png';

    final filePath = '${tempDir.path}/$fileName';
    final file = File(filePath);
    await file.writeAsBytes(bytes, flush: true);

    // Safe default sharePositionOrigin for iOS 26+
    final rect = const Rect.fromLTWH(0, 0, 1, 1);

    await Share.shareXFiles(
      [XFile(filePath)],
      sharePositionOrigin: rect,
    );
  } catch (e) {
    print('Error sharing screenshot: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
