// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CategoryStruct extends FFFirebaseStruct {
  CategoryStruct({
    String? title,
    bool? isPay,
    String? emoji,
    String? subtitle,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _isPay = isPay,
        _emoji = emoji,
        _subtitle = subtitle,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "isPay" field.
  bool? _isPay;
  bool get isPay => _isPay ?? false;
  set isPay(bool? val) => _isPay = val;

  bool hasIsPay() => _isPay != null;

  // "emoji" field.
  String? _emoji;
  String get emoji => _emoji ?? '';
  set emoji(String? val) => _emoji = val;

  bool hasEmoji() => _emoji != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  set subtitle(String? val) => _subtitle = val;

  bool hasSubtitle() => _subtitle != null;

  static CategoryStruct fromMap(Map<String, dynamic> data) => CategoryStruct(
        title: data['title'] as String?,
        isPay: data['isPay'] as bool?,
        emoji: data['emoji'] as String?,
        subtitle: data['subtitle'] as String?,
      );

  static CategoryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CategoryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'isPay': _isPay,
        'emoji': _emoji,
        'subtitle': _subtitle,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'isPay': serializeParam(
          _isPay,
          ParamType.bool,
        ),
        'emoji': serializeParam(
          _emoji,
          ParamType.String,
        ),
        'subtitle': serializeParam(
          _subtitle,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoryStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        isPay: deserializeParam(
          data['isPay'],
          ParamType.bool,
          false,
        ),
        emoji: deserializeParam(
          data['emoji'],
          ParamType.String,
          false,
        ),
        subtitle: deserializeParam(
          data['subtitle'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoryStruct &&
        title == other.title &&
        isPay == other.isPay &&
        emoji == other.emoji &&
        subtitle == other.subtitle;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, isPay, emoji, subtitle]);
}

CategoryStruct createCategoryStruct({
  String? title,
  bool? isPay,
  String? emoji,
  String? subtitle,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoryStruct(
      title: title,
      isPay: isPay,
      emoji: emoji,
      subtitle: subtitle,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoryStruct? updateCategoryStruct(
  CategoryStruct? category, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    category
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoryStructData(
  Map<String, dynamic> firestoreData,
  CategoryStruct? category,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (category == null) {
    return;
  }
  if (category.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && category.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoryData = getCategoryFirestoreData(category, forFieldValue);
  final nestedData = categoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = category.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoryFirestoreData(
  CategoryStruct? category, [
  bool forFieldValue = false,
]) {
  if (category == null) {
    return {};
  }
  final firestoreData = mapToFirestore(category.toMap());

  // Add any Firestore field values
  category.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoryListFirestoreData(
  List<CategoryStruct>? categorys,
) =>
    categorys?.map((e) => getCategoryFirestoreData(e, true)).toList() ?? [];
