import '/components/jornal_list_item/jornal_list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'journal_widget.dart' show JournalWidget;
import 'package:flutter/material.dart';

class JournalModel extends FlutterFlowModel<JournalWidget> {
  ///  State fields for stateful widgets in this page.

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
