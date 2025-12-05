import '/flutter_flow/flutter_flow_util.dart';
import 'submit_quote_sheet_widget.dart' show SubmitQuoteSheetWidget;
import 'package:flutter/material.dart';

class SubmitQuoteSheetModel extends FlutterFlowModel<SubmitQuoteSheetWidget> {
  ///  Local state fields for this component.

  DocumentReference? selectedImageVariable;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Bottom Sheet - BackgroundImagesSheet] action in Container widget.
  DocumentReference? selectedImage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
