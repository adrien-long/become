import '/components/screenshot/screenshot_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'screenshot_bottom_sheet_widget.dart' show ScreenshotBottomSheetWidget;
import 'package:flutter/material.dart';

class ScreenshotBottomSheetModel
    extends FlutterFlowModel<ScreenshotBottomSheetWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? imageBytes;

  ///  State fields for stateful widgets in this component.

  // Model for screenshot component.
  late ScreenshotModel screenshotModel;

  @override
  void initState(BuildContext context) {
    screenshotModel = createModel(context, () => ScreenshotModel());
  }

  @override
  void dispose() {
    screenshotModel.dispose();
  }
}
