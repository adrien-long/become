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

import 'package:home_widget/home_widget.dart';

Future updateHomeWidget(List<QuotationsRecord> quotations) async {
  await HomeWidget.setAppGroupId('group.com.mycompany.become.widgetgroup');

  List<String> list = quotations.map((q) => q.content).toList();

  await HomeWidget.saveWidgetData<String>(
    'textList',
    jsonEncode(list),
  );

  await HomeWidget.updateWidget(
    iOSName: 'BecomeWidget',
    androidName: 'BecomeWidgetProvider',
  );
}
