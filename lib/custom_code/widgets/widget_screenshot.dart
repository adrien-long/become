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

import 'index.dart'; // Imports other custom widgets

/* Add these to pubspec.yaml:
screenshot: ^2.1.0
*/
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';

class WidgetScreenshot extends StatefulWidget {
  const WidgetScreenshot({
    Key? key,
    this.width,
    this.height,
    required this.screenshotChild,
    this.onScreenshotCaptured,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget Function()? screenshotChild;
  final Future Function(FFUploadedFile screenshot)? onScreenshotCaptured;

  @override
  _WidgetScreenshotState createState() => _WidgetScreenshotState();
}

class _WidgetScreenshotState extends State<WidgetScreenshot> {
  final screenshotController = ScreenshotController();

  Future captureScreenshot() async {
    try {
      final Uint8List? capturedImage = await screenshotController.capture();

      if (capturedImage != null && widget.onScreenshotCaptured != null) {
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final screenshotFile = FFUploadedFile(
          name: 'screenshot_$timestamp.png',
          bytes: capturedImage,
        );

        await widget.onScreenshotCaptured!(screenshotFile);
      }
    } catch (e) {
      print('Error capturing screenshot: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Screenshot Container
        Container(
          width: widget.width,
          height: widget.height,
          child: Screenshot(
            controller: screenshotController,
            child: widget.screenshotChild?.call() ?? Container(),
          ),
        ),

        // Share Button Positioned at Bottom-Center with Custom Styling
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.10, // ~10% from bottom
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: captureScreenshot,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryText,
                    width: 0.5, // Thin border
                  ),
                ),
                child: Text(
                  'Share',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyLargeFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
