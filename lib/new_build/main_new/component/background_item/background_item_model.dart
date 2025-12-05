import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/image_asset/image_asset_widget.dart';
import 'background_item_widget.dart' show BackgroundItemWidget;
import 'package:flutter/material.dart';

class BackgroundItemModel extends FlutterFlowModel<BackgroundItemWidget> {
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
