import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'quotes_widget.dart' show QuotesWidget;
import 'package:flutter/material.dart';

class QuotesModel extends FlutterFlowModel<QuotesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Quotes widget.
  QuotesRecord? activeQuote;
  // Stores action output result for [Custom Action - checkNotificationsEnabled] action in Quotes widget.
  bool? isEnabled;
  // Stores action output result for [Bottom Sheet - QuotesListSheet] action in Icon widget.
  int? quoteIndex;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Bottom Sheet - BackgroundImagesSheet] action in Icon widget.
  DocumentReference? selectedImage;

  /// Query cache managers for this widget.

  final _quotesListManager = StreamRequestManager<List<QuotesRecord>>();
  Stream<List<QuotesRecord>> quotesList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<QuotesRecord>> Function() requestFn,
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
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearQuotesListCache();
  }
}
