import '/components/history_list_item/history_list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quotes_liked_sheet_widget.dart' show QuotesLikedSheetWidget;
import 'package:flutter/material.dart';

class QuotesLikedSheetModel extends FlutterFlowModel<QuotesLikedSheetWidget> {
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
