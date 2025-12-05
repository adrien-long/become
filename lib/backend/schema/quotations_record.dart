import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuotationsRecord extends FirestoreRecord {
  QuotationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "language_code" field.
  String? _languageCode;
  String get languageCode => _languageCode ?? '';
  bool hasLanguageCode() => _languageCode != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _source = snapshotData['source'] as String?;
    _category = snapshotData['category'] as String?;
    _languageCode = snapshotData['language_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quotations');

  static Stream<QuotationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuotationsRecord.fromSnapshot(s));

  static Future<QuotationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuotationsRecord.fromSnapshot(s));

  static QuotationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuotationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuotationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuotationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuotationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuotationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuotationsRecordData({
  String? content,
  DateTime? createdAt,
  String? source,
  String? category,
  String? languageCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'created_at': createdAt,
      'source': source,
      'category': category,
      'language_code': languageCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuotationsRecordDocumentEquality implements Equality<QuotationsRecord> {
  const QuotationsRecordDocumentEquality();

  @override
  bool equals(QuotationsRecord? e1, QuotationsRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.createdAt == e2?.createdAt &&
        e1?.source == e2?.source &&
        e1?.category == e2?.category &&
        e1?.languageCode == e2?.languageCode;
  }

  @override
  int hash(QuotationsRecord? e) => const ListEquality().hash(
      [e?.content, e?.createdAt, e?.source, e?.category, e?.languageCode]);

  @override
  bool isValidKey(Object? o) => o is QuotationsRecord;
}
