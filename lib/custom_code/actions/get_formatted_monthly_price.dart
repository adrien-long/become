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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:intl/intl.dart';

Future<String> getFormattedMonthlyPrice() async {
  try {
    final offerings = await Purchases.getOfferings();
    final annualPackage = offerings.current?.annual;
    if (annualPackage == null) return 'N/A';

    final product = annualPackage.storeProduct;
    final yearlyPrice = product.price; // double
    final currencyCode = product.currencyCode;

    // Get device locale, e.g., "fr-FR" or "en-US"
    final localeTag =
        WidgetsBinding.instance.platformDispatcher.locale.toLanguageTag();

    // Calculate monthly price
    final monthlyPrice = yearlyPrice / 12;

    // Format price using the device locale + currency code
    final formatter = NumberFormat.simpleCurrency(
      locale: localeTag,
      name: currencyCode,
    );

    return formatter.format(monthlyPrice);
  } catch (e) {
    print('⚠️ Error: $e');
    return 'N/A';
  }
}
