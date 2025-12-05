// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TranslateStruct extends FFFirebaseStruct {
  TranslateStruct({
    String? languageCode,
    String? content,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _languageCode = languageCode,
        _content = content,
        super(firestoreUtilData);

  // "language_code" field.
  String? _languageCode;
  String get languageCode => _languageCode ?? '';
  set languageCode(String? val) => _languageCode = val;

  bool hasLanguageCode() => _languageCode != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  static TranslateStruct fromMap(Map<String, dynamic> data) => TranslateStruct(
        languageCode: data['language_code'] as String?,
        content: data['content'] as String?,
      );

  static TranslateStruct? maybeFromMap(dynamic data) => data is Map
      ? TranslateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'language_code': _languageCode,
        'content': _content,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'language_code': serializeParam(
          _languageCode,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
      }.withoutNulls;

  static TranslateStruct fromSerializableMap(Map<String, dynamic> data) =>
      TranslateStruct(
        languageCode: deserializeParam(
          data['language_code'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TranslateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TranslateStruct &&
        languageCode == other.languageCode &&
        content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash([languageCode, content]);
}

TranslateStruct createTranslateStruct({
  String? languageCode,
  String? content,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TranslateStruct(
      languageCode: languageCode,
      content: content,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TranslateStruct? updateTranslateStruct(
  TranslateStruct? translate, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    translate
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTranslateStructData(
  Map<String, dynamic> firestoreData,
  TranslateStruct? translate,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (translate == null) {
    return;
  }
  if (translate.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && translate.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final translateData = getTranslateFirestoreData(translate, forFieldValue);
  final nestedData = translateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = translate.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTranslateFirestoreData(
  TranslateStruct? translate, [
  bool forFieldValue = false,
]) {
  if (translate == null) {
    return {};
  }
  final firestoreData = mapToFirestore(translate.toMap());

  // Add any Firestore field values
  translate.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTranslateListFirestoreData(
  List<TranslateStruct>? translates,
) =>
    translates?.map((e) => getTranslateFirestoreData(e, true)).toList() ?? [];
