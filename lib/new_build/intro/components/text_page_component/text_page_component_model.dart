import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/intro/components/next_button/next_button_widget.dart';
import 'text_page_component_widget.dart' show TextPageComponentWidget;
import 'package:flutter/material.dart';

class TextPageComponentModel extends FlutterFlowModel<TextPageComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NextButton component.
  late NextButtonModel nextButtonModel;

  @override
  void initState(BuildContext context) {
    nextButtonModel = createModel(context, () => NextButtonModel());
  }

  @override
  void dispose() {
    nextButtonModel.dispose();
  }
}
