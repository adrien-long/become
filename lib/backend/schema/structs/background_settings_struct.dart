// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BackgroundSettingsStruct extends FFFirebaseStruct {
  BackgroundSettingsStruct({
    int? imageNumber,
    Color? color,
    bool? isPay,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imageNumber = imageNumber,
        _color = color,
        _isPay = isPay,
        super(firestoreUtilData);

  // "imageNumber" field.
  int? _imageNumber;
  int get imageNumber => _imageNumber ?? 0;
  set imageNumber(int? val) => _imageNumber = val;

  void incrementImageNumber(int amount) => imageNumber = imageNumber + amount;

  bool hasImageNumber() => _imageNumber != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "isPay" field.
  bool? _isPay;
  bool get isPay => _isPay ?? false;
  set isPay(bool? val) => _isPay = val;

  bool hasIsPay() => _isPay != null;

  static BackgroundSettingsStruct fromMap(Map<String, dynamic> data) =>
      BackgroundSettingsStruct(
        imageNumber: castToType<int>(data['imageNumber']),
        color: getSchemaColor(data['color']),
        isPay: data['isPay'] as bool?,
      );

  static BackgroundSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? BackgroundSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imageNumber': _imageNumber,
        'color': _color,
        'isPay': _isPay,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imageNumber': serializeParam(
          _imageNumber,
          ParamType.int,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'isPay': serializeParam(
          _isPay,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BackgroundSettingsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BackgroundSettingsStruct(
        imageNumber: deserializeParam(
          data['imageNumber'],
          ParamType.int,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        isPay: deserializeParam(
          data['isPay'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'BackgroundSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BackgroundSettingsStruct &&
        imageNumber == other.imageNumber &&
        color == other.color &&
        isPay == other.isPay;
  }

  @override
  int get hashCode => const ListEquality().hash([imageNumber, color, isPay]);
}

BackgroundSettingsStruct createBackgroundSettingsStruct({
  int? imageNumber,
  Color? color,
  bool? isPay,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BackgroundSettingsStruct(
      imageNumber: imageNumber,
      color: color,
      isPay: isPay,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BackgroundSettingsStruct? updateBackgroundSettingsStruct(
  BackgroundSettingsStruct? backgroundSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    backgroundSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBackgroundSettingsStructData(
  Map<String, dynamic> firestoreData,
  BackgroundSettingsStruct? backgroundSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (backgroundSettings == null) {
    return;
  }
  if (backgroundSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && backgroundSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final backgroundSettingsData =
      getBackgroundSettingsFirestoreData(backgroundSettings, forFieldValue);
  final nestedData =
      backgroundSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      backgroundSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBackgroundSettingsFirestoreData(
  BackgroundSettingsStruct? backgroundSettings, [
  bool forFieldValue = false,
]) {
  if (backgroundSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(backgroundSettings.toMap());

  // Add any Firestore field values
  backgroundSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBackgroundSettingsListFirestoreData(
  List<BackgroundSettingsStruct>? backgroundSettingss,
) =>
    backgroundSettingss
        ?.map((e) => getBackgroundSettingsFirestoreData(e, true))
        .toList() ??
    [];
