// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';

class CreateScreenshot extends StatefulWidget {
  const CreateScreenshot({
    Key? key,
    this.width,
    this.height,
    required this.childBuilder,
    this.onScreenshotCaptured,
    this.autoCapture = false,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget Function() childBuilder;
  final Future Function(FFUploadedFile screenshot)? onScreenshotCaptured;
  final bool autoCapture;

  @override
  State<CreateScreenshot> createState() => _CreateScreenshotState();
}

class _CreateScreenshotState extends State<CreateScreenshot> {
  final ScreenshotController _controller = ScreenshotController();

  Future<void> _capture() async {
    try {
      final bytes = await _controller.capture();
      if (bytes != null && widget.onScreenshotCaptured != null) {
        final screenshotFile = FFUploadedFile(
          name: 'screenshot_${DateTime.now().millisecondsSinceEpoch}.png',
          bytes: bytes,
        );
        await widget.onScreenshotCaptured!(screenshotFile);
      }
    } catch (e) {
      print('Error capturing screenshot: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.autoCapture) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _capture());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Screenshot(
        controller: _controller,
        child: widget.childBuilder(),
      ),
    );
  }
}
