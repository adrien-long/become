import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "onboarding_order" field.
  int? _onboardingOrder;
  int get onboardingOrder => _onboardingOrder ?? 0;
  bool hasOnboardingOrder() => _onboardingOrder != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  bool hasSlug() => _slug != null;

  // "helper_text" field.
  String? _helperText;
  String get helperText => _helperText ?? '';
  bool hasHelperText() => _helperText != null;

  // "description" field.
  List<TranslateStruct>? _description;
  List<TranslateStruct> get description => _description ?? const [];
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _onboardingOrder = castToType<int>(snapshotData['onboarding_order']);
    _slug = snapshotData['slug'] as String?;
    _helperText = snapshotData['helper_text'] as String?;
    _description = getStructList(
      snapshotData['description'],
      TranslateStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questions');

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  String? content,
  int? onboardingOrder,
  String? slug,
  String? helperText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'onboarding_order': onboardingOrder,
      'slug': slug,
      'helper_text': helperText,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.content == e2?.content &&
        e1?.onboardingOrder == e2?.onboardingOrder &&
        e1?.slug == e2?.slug &&
        e1?.helperText == e2?.helperText &&
        listEquality.equals(e1?.description, e2?.description);
  }

  @override
  int hash(QuestionsRecord? e) => const ListEquality().hash(
      [e?.content, e?.onboardingOrder, e?.slug, e?.helperText, e?.description]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
