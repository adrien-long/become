import '/backend/backend.dart';
import '/components/quotations_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/image_asset/image_asset_widget.dart';
import '/new_build/main_new/component/nav_buttons/nav_buttons_widget.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'quotes_new_widget.dart' show QuotesNewWidget;
import 'package:flutter/material.dart';

class QuotesNewModel extends FlutterFlowModel<QuotesNewWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in QuotesNew widget.
  QuotationsRecord? activeQuote;
  // Stores action output result for [Custom Action - checkNotificationsEnabled] action in QuotesNew widget.
  bool? isEnabled;
  // Model for ImageAsset component.
  late ImageAssetModel imageAssetModel;
  // Model for NavButtons component.
  late NavButtonsModel navButtonsModel;
  // Stores action output result for [Bottom Sheet - QuotesLikedSheet] action in NavButtons widget.
  int? quoteIndex;
  // Model for QuotationsView component.
  late QuotationsViewModel quotationsViewModel;

  /// Query cache managers for this widget.

  final _quotesListManager = StreamRequestManager<List<QuotationsRecord>>();
  Stream<List<QuotationsRecord>> quotesList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<QuotationsRecord>> Function() requestFn,
  }) =>
      _quotesListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearQuotesListCache() => _quotesListManager.clear();
  void clearQuotesListCacheKey(String? uniqueKey) =>
      _quotesListManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    imageAssetModel = createModel(context, () => ImageAssetModel());
    navButtonsModel = createModel(context, () => NavButtonsModel());
    quotationsViewModel = createModel(context, () => QuotationsViewModel());
  }

  @override
  void dispose() {
    imageAssetModel.dispose();
    navButtonsModel.dispose();
    quotationsViewModel.dispose();

    /// Dispose query cache managers for this widget.

    clearQuotesListCache();
  }
}
