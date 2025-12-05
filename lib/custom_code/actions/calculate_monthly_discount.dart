// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:purchases_flutter/purchases_flutter.dart';

Future<String> calculateMonthlyDiscount() async {
  try {
    final offerings = await Purchases.getOfferings();
    final monthlyPackage = offerings.current?.monthly;
    final annualPackage = offerings.current?.annual;

    if (monthlyPackage == null || annualPackage == null) return 'N/A';

    final monthlyPrice = monthlyPackage.storeProduct.price;
    final yearlyPrice = annualPackage.storeProduct.price;
    final effectiveMonthlyFromYearly = yearlyPrice / 12;

    if (monthlyPrice == 0) return 'N/A'; // avoid division by zero

    final discountPercent =
        ((monthlyPrice - effectiveMonthlyFromYearly) / monthlyPrice) * 100;
    final roundedDiscount = discountPercent.round();

    return 'Save $roundedDiscount%';
  } catch (e) {
    print('⚠️ Error calculating discount: $e');
    return 'N/A';
  }
}
