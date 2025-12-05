import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A set of questions with their answers
class JournalRecord extends FirestoreRecord {
  JournalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "is_public" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _isPublic = snapshotData['is_public'] as bool?;
    _summary = snapshotData['summary'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('journal');

  static Stream<JournalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JournalRecord.fromSnapshot(s));

  static Future<JournalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JournalRecord.fromSnapshot(s));

  static JournalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JournalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JournalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JournalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JournalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JournalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJournalRecordData({
  DateTime? createdAt,
  DocumentReference? user,
  bool? isPublic,
  String? summary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user': user,
      'is_public': isPublic,
      'summary': summary,
    }.withoutNulls,
  );

  return firestoreData;
}

class JournalRecordDocumentEquality implements Equality<JournalRecord> {
  const JournalRecordDocumentEquality();

  @override
  bool equals(JournalRecord? e1, JournalRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.user == e2?.user &&
        e1?.isPublic == e2?.isPublic &&
        e1?.summary == e2?.summary;
  }

  @override
  int hash(JournalRecord? e) => const ListEquality()
      .hash([e?.createdAt, e?.user, e?.isPublic, e?.summary]);

  @override
  bool isValidKey(Object? o) => o is JournalRecord;
}
