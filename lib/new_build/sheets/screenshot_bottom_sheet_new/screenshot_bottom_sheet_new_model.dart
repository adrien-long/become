import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/options_button/options_button_widget.dart';
import 'screenshot_bottom_sheet_new_widget.dart'
    show ScreenshotBottomSheetNewWidget;
import 'package:flutter/material.dart';

class ScreenshotBottomSheetNewModel
    extends FlutterFlowModel<ScreenshotBottomSheetNewWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? imageBytes;

  String? messageText;

  ///  State fields for stateful widgets in this component.

  // Model for OptionsButton component.
  late OptionsButtonModel optionsButtonModel1;
  // Model for OptionsButton component.
  late OptionsButtonModel optionsButtonModel2;
  // Model for OptionsButton component.
  late OptionsButtonModel optionsButtonModel3;

  @override
  void initState(BuildContext context) {
    optionsButtonModel1 = createModel(context, () => OptionsButtonModel());
    optionsButtonModel2 = createModel(context, () => OptionsButtonModel());
    optionsButtonModel3 = createModel(context, () => OptionsButtonModel());
  }

  @override
  void dispose() {
    optionsButtonModel1.dispose();
    optionsButtonModel2.dispose();
    optionsButtonModel3.dispose();
  }
}
