import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromptsRecord extends FirestoreRecord {
  PromptsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  bool hasVersion() => _version != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "is_production" field.
  bool? _isProduction;
  bool get isProduction => _isProduction ?? false;
  bool hasIsProduction() => _isProduction != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "is_staging" field.
  bool? _isStaging;
  bool get isStaging => _isStaging ?? false;
  bool hasIsStaging() => _isStaging != null;

  void _initializeFields() {
    _version = castToType<int>(snapshotData['version']);
    _content = snapshotData['content'] as String?;
    _isProduction = snapshotData['is_production'] as bool?;
    _weight = castToType<int>(snapshotData['weight']);
    _title = snapshotData['title'] as String?;
    _isStaging = snapshotData['is_staging'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prompts');

  static Stream<PromptsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromptsRecord.fromSnapshot(s));

  static Future<PromptsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromptsRecord.fromSnapshot(s));

  static PromptsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromptsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromptsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromptsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromptsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromptsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromptsRecordData({
  int? version,
  String? content,
  bool? isProduction,
  int? weight,
  String? title,
  bool? isStaging,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'version': version,
      'content': content,
      'is_production': isProduction,
      'weight': weight,
      'title': title,
      'is_staging': isStaging,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromptsRecordDocumentEquality implements Equality<PromptsRecord> {
  const PromptsRecordDocumentEquality();

  @override
  bool equals(PromptsRecord? e1, PromptsRecord? e2) {
    return e1?.version == e2?.version &&
        e1?.content == e2?.content &&
        e1?.isProduction == e2?.isProduction &&
        e1?.weight == e2?.weight &&
        e1?.title == e2?.title &&
        e1?.isStaging == e2?.isStaging;
  }

  @override
  int hash(PromptsRecord? e) => const ListEquality().hash([
        e?.version,
        e?.content,
        e?.isProduction,
        e?.weight,
        e?.title,
        e?.isStaging
      ]);

  @override
  bool isValidKey(Object? o) => o is PromptsRecord;
}
