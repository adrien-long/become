import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'intro_f_widget.dart' show IntroFWidget;
import 'package:flutter/material.dart';

class IntroFModel extends FlutterFlowModel<IntroFWidget> {
  ///  Local state fields for this page.

  List<String> selectedFields = [];
  void addToSelectedFields(String item) => selectedFields.add(item);
  void removeFromSelectedFields(String item) => selectedFields.remove(item);
  void removeAtIndexFromSelectedFields(int index) =>
      selectedFields.removeAt(index);
  void insertAtIndexInSelectedFields(int index, String item) =>
      selectedFields.insert(index, item);
  void updateSelectedFieldsAtIndex(int index, Function(String) updateFn) =>
      selectedFields[index] = updateFn(selectedFields[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
