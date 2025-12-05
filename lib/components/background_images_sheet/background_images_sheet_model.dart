import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'background_images_sheet_widget.dart' show BackgroundImagesSheetWidget;
import 'package:flutter/material.dart';

class BackgroundImagesSheetModel
    extends FlutterFlowModel<BackgroundImagesSheetWidget> {
  ///  Local state fields for this component.

  DocumentReference? selectedImage;

  BackgroundSettingsStruct? selected;
  void updateSelectedStruct(Function(BackgroundSettingsStruct) updateFn) {
    updateFn(selected ??= BackgroundSettingsStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
