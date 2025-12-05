import '/components/history_list_item/history_list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quotes_list_sheet_widget.dart' show QuotesListSheetWidget;
import 'package:flutter/material.dart';

class QuotesListSheetModel extends FlutterFlowModel<QuotesListSheetWidget> {
  ///  Local state fields for this component.

  bool? favoritesFilterValue;

  bool favoriteToggle = false;

  ///  State fields for stateful widgets in this component.

  // Models for HistoryListItem dynamic component.
  late FlutterFlowDynamicModels<HistoryListItemModel> historyListItemModels;

  @override
  void initState(BuildContext context) {
    historyListItemModels =
        FlutterFlowDynamicModels(() => HistoryListItemModel());
  }

  @override
  void dispose() {
    historyListItemModels.dispose();
  }
}
