import '/components/jornal_list_item/jornal_list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'journal_sheet_widget.dart' show JournalSheetWidget;
import 'package:flutter/material.dart';

class JournalSheetModel extends FlutterFlowModel<JournalSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for JornalListItem dynamic component.
  late FlutterFlowDynamicModels<JornalListItemModel> jornalListItemModels;

  @override
  void initState(BuildContext context) {
    jornalListItemModels =
        FlutterFlowDynamicModels(() => JornalListItemModel());
  }

  @override
  void dispose() {
    jornalListItemModels.dispose();
  }
}
