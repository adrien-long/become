// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationSettingsStruct extends FFFirebaseStruct {
  NotificationSettingsStruct({
    DateTime? startTime,
    DateTime? endTime,
    int? messagePerDay,
    List<String>? selectedCategories,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _startTime = startTime,
        _endTime = endTime,
        _messagePerDay = messagePerDay,
        _selectedCategories = selectedCategories,
        super(firestoreUtilData);

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "messagePerDay" field.
  int? _messagePerDay;
  int get messagePerDay => _messagePerDay ?? 0;
  set messagePerDay(int? val) => _messagePerDay = val;

  void incrementMessagePerDay(int amount) =>
      messagePerDay = messagePerDay + amount;

  bool hasMessagePerDay() => _messagePerDay != null;

  // "selectedCategories" field.
  List<String>? _selectedCategories;
  List<String> get selectedCategories => _selectedCategories ?? const [];
  set selectedCategories(List<String>? val) => _selectedCategories = val;

  void updateSelectedCategories(Function(List<String>) updateFn) {
    updateFn(_selectedCategories ??= []);
  }

  bool hasSelectedCategories() => _selectedCategories != null;

  static NotificationSettingsStruct fromMap(Map<String, dynamic> data) =>
      NotificationSettingsStruct(
        startTime: data['startTime'] as DateTime?,
        endTime: data['endTime'] as DateTime?,
        messagePerDay: castToType<int>(data['messagePerDay']),
        selectedCategories: getDataList(data['selectedCategories']),
      );

  static NotificationSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'startTime': _startTime,
        'endTime': _endTime,
        'messagePerDay': _messagePerDay,
        'selectedCategories': _selectedCategories,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startTime': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.DateTime,
        ),
        'messagePerDay': serializeParam(
          _messagePerDay,
          ParamType.int,
        ),
        'selectedCategories': serializeParam(
          _selectedCategories,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static NotificationSettingsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationSettingsStruct(
        startTime: deserializeParam(
          data['startTime'],
          ParamType.DateTime,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.DateTime,
          false,
        ),
        messagePerDay: deserializeParam(
          data['messagePerDay'],
          ParamType.int,
          false,
        ),
        selectedCategories: deserializeParam<String>(
          data['selectedCategories'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'NotificationSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NotificationSettingsStruct &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        messagePerDay == other.messagePerDay &&
        listEquality.equals(selectedCategories, other.selectedCategories);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([startTime, endTime, messagePerDay, selectedCategories]);
}

NotificationSettingsStruct createNotificationSettingsStruct({
  DateTime? startTime,
  DateTime? endTime,
  int? messagePerDay,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationSettingsStruct(
      startTime: startTime,
      endTime: endTime,
      messagePerDay: messagePerDay,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationSettingsStruct? updateNotificationSettingsStruct(
  NotificationSettingsStruct? notificationSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notificationSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationSettingsStructData(
  Map<String, dynamic> firestoreData,
  NotificationSettingsStruct? notificationSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notificationSettings == null) {
    return;
  }
  if (notificationSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notificationSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationSettingsData =
      getNotificationSettingsFirestoreData(notificationSettings, forFieldValue);
  final nestedData =
      notificationSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      notificationSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationSettingsFirestoreData(
  NotificationSettingsStruct? notificationSettings, [
  bool forFieldValue = false,
]) {
  if (notificationSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notificationSettings.toMap());

  // Add any Firestore field values
  notificationSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationSettingsListFirestoreData(
  List<NotificationSettingsStruct>? notificationSettingss,
) =>
    notificationSettingss
        ?.map((e) => getNotificationSettingsFirestoreData(e, true))
        .toList() ??
    [];
