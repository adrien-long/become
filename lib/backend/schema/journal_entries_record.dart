import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JournalEntriesRecord extends FirestoreRecord {
  JournalEntriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "journal" field.
  DocumentReference? _journal;
  DocumentReference? get journal => _journal;
  bool hasJournal() => _journal != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "question_ref" field.
  DocumentReference? _questionRef;
  DocumentReference? get questionRef => _questionRef;
  bool hasQuestionRef() => _questionRef != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _journal = snapshotData['journal'] as DocumentReference?;
    _question = snapshotData['question'] as String?;
    _answer = snapshotData['answer'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _questionRef = snapshotData['question_ref'] as DocumentReference?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('journal_entries');

  static Stream<JournalEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JournalEntriesRecord.fromSnapshot(s));

  static Future<JournalEntriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JournalEntriesRecord.fromSnapshot(s));

  static JournalEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JournalEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JournalEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JournalEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JournalEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JournalEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJournalEntriesRecordData({
  DocumentReference? journal,
  String? question,
  String? answer,
  int? order,
  DateTime? createdAt,
  DocumentReference? questionRef,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'journal': journal,
      'question': question,
      'answer': answer,
      'order': order,
      'created_at': createdAt,
      'question_ref': questionRef,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class JournalEntriesRecordDocumentEquality
    implements Equality<JournalEntriesRecord> {
  const JournalEntriesRecordDocumentEquality();

  @override
  bool equals(JournalEntriesRecord? e1, JournalEntriesRecord? e2) {
    return e1?.journal == e2?.journal &&
        e1?.question == e2?.question &&
        e1?.answer == e2?.answer &&
        e1?.order == e2?.order &&
        e1?.createdAt == e2?.createdAt &&
        e1?.questionRef == e2?.questionRef &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(JournalEntriesRecord? e) => const ListEquality().hash([
        e?.journal,
        e?.question,
        e?.answer,
        e?.order,
        e?.createdAt,
        e?.questionRef,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is JournalEntriesRecord;
}
