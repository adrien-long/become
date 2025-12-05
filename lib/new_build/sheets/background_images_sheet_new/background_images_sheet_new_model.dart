import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/background_item/background_item_widget.dart';
import 'background_images_sheet_new_widget.dart'
    show BackgroundImagesSheetNewWidget;
import 'package:flutter/material.dart';

class BackgroundImagesSheetNewModel
    extends FlutterFlowModel<BackgroundImagesSheetNewWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for BackgroundItem dynamic component.
  late FlutterFlowDynamicModels<BackgroundItemModel> backgroundItemModels;

  @override
  void initState(BuildContext context) {
    backgroundItemModels =
        FlutterFlowDynamicModels(() => BackgroundItemModel());
  }

  @override
  void dispose() {
    backgroundItemModels.dispose();
  }
}
