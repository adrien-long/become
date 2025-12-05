import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/heart_toggle/heart_toggle_widget.dart';
import 'quotations_view_widget.dart' show QuotationsViewWidget;
import 'package:flutter/material.dart';

class QuotationsViewModel extends FlutterFlowModel<QuotationsViewWidget> {
  ///  Local state fields for this component.

  DocumentReference? ref;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for HeartToggle component.
  late HeartToggleModel heartToggleModel;

  @override
  void initState(BuildContext context) {
    heartToggleModel = createModel(context, () => HeartToggleModel());
  }

  @override
  void dispose() {
    heartToggleModel.dispose();
  }
}
