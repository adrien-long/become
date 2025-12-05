import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_sheet_widget.dart' show FeedbackSheetWidget;
import 'package:flutter/material.dart';

class FeedbackSheetModel extends FlutterFlowModel<FeedbackSheetWidget> {
  ///  Local state fields for this component.

  bool isRated = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
