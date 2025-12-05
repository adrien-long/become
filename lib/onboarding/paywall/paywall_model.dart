import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/intro/components/next_button/next_button_widget.dart';
import '/index.dart';
import 'paywall_widget.dart' show PaywallWidget;
import 'package:flutter/material.dart';

class PaywallModel extends FlutterFlowModel<PaywallWidget> {
  ///  Local state fields for this page.

  String? offerSelected = '\$rc_annual';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFormattedMonthlyPrice] action in Paywall widget.
  String? formattedMonthlyPrice;
  // Stores action output result for [Custom Action - calculateMonthlyDiscount] action in Paywall widget.
  String? formattedDiscountAmount;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel;
  // Stores action output result for [RevenueCat - Purchase] action in NextButton widget.
  bool? didPurchase;

  @override
  void initState(BuildContext context) {
    nextButtonModel = createModel(context, () => NextButtonModel());
  }

  @override
  void dispose() {
    nextButtonModel.dispose();
  }
}
