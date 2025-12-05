import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/intro/components/next_button/next_button_widget.dart';
import '/index.dart';
import 'notification_settings_widget.dart' show NotificationSettingsWidget;
import 'package:flutter/material.dart';

class NotificationSettingsModel
    extends FlutterFlowModel<NotificationSettingsWidget> {
  ///  Local state fields for this page.

  NotificationSettingsStruct? settings;
  void updateSettingsStruct(Function(NotificationSettingsStruct) updateFn) {
    updateFn(settings ??= NotificationSettingsStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in NotificationSettings widget.
  UsersRecord? currentUser;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel;

  @override
  void initState(BuildContext context) {
    nextButtonModel = createModel(context, () => NextButtonModel());
  }

  @override
  void dispose() {
    nextButtonModel.dispose();
  }
}
