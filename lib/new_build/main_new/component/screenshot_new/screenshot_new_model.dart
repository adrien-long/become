import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/image_asset/image_asset_widget.dart';
import 'screenshot_new_widget.dart' show ScreenshotNewWidget;
import 'package:flutter/material.dart';

class ScreenshotNewModel extends FlutterFlowModel<ScreenshotNewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ImageAsset component.
  late ImageAssetModel imageAssetModel;

  @override
  void initState(BuildContext context) {
    imageAssetModel = createModel(context, () => ImageAssetModel());
  }

  @override
  void dispose() {
    imageAssetModel.dispose();
  }
}
