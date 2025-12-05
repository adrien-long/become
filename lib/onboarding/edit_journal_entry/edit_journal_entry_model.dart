import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_journal_entry_widget.dart' show EditJournalEntryWidget;
import 'package:flutter/material.dart';

class EditJournalEntryModel extends FlutterFlowModel<EditJournalEntryWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - createJournalEntryFromNumber] action in Button widget.
  DocumentReference? newJournalEntry;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
