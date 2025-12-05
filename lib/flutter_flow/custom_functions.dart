import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String getMonthlyPriceFromString(String yearlyPriceString) {
  try {
    final double yearlyPrice = double.parse(yearlyPriceString);
    final double monthlyPrice = yearlyPrice / 12;
    return monthlyPrice.toStringAsFixed(2);
  } catch (e) {
    return '0.00'; // Fallback if parsing fails
  }
}

List<String> stringToList(String item) {
  return [item];
}

List<String> listCategoryName(List<CategoryStruct> selectedCategories) {
  return selectedCategories.map((c) => c.title).toList();
}

List<QuotationsRecord> filteredQuotations(
  List<QuotationsRecord>? allQuotations,
  List<String> categories,
  bool isPay,
  List<String> freeCategories,
) {
  if (allQuotations == null || allQuotations.isEmpty) {
    return [];
  }

  if (isPay) {
    if (categories.isNotEmpty) {
      return allQuotations
          .where((q) => categories.contains(q.category))
          .toList();
    }

    return [...allQuotations];
  }

  final effectiveCategories = categories.isEmpty ? freeCategories : categories;

  return allQuotations
      .where((q) => effectiveCategories.contains(q.category))
      .toList();
}

List<String> allFreeCategories(List<CategoryStruct> allCategories) {
  final freeCategories = allCategories.where((c) => c.isPay == false).toList();

  return freeCategories.map((c) => c.title).toList();
}
