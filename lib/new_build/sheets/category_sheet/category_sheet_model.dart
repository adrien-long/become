import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/category_button/category_button_widget.dart';
import 'category_sheet_widget.dart' show CategorySheetWidget;
import 'package:flutter/material.dart';

class CategorySheetModel extends FlutterFlowModel<CategorySheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for CategoryButton dynamic component.
  late FlutterFlowDynamicModels<CategoryButtonModel> categoryButtonModels;

  @override
  void initState(BuildContext context) {
    categoryButtonModels =
        FlutterFlowDynamicModels(() => CategoryButtonModel());
  }

  @override
  void dispose() {
    categoryButtonModels.dispose();
  }
}
