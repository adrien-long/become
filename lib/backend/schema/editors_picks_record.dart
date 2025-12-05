import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EditorsPicksRecord extends FirestoreRecord {
  EditorsPicksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "content_english" field.
  String? _contentEnglish;
  String get contentEnglish => _contentEnglish ?? '';
  bool hasContentEnglish() => _contentEnglish != null;

  // "content_french" field.
  String? _contentFrench;
  String get contentFrench => _contentFrench ?? '';
  bool hasContentFrench() => _contentFrench != null;

  // "is_published" field.
  bool? _isPublished;
  bool get isPublished => _isPublished ?? false;
  bool hasIsPublished() => _isPublished != null;

  void _initializeFields() {
    _author = snapshotData['author'] as String?;
    _contentEnglish = snapshotData['content_english'] as String?;
    _contentFrench = snapshotData['content_french'] as String?;
    _isPublished = snapshotData['is_published'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('editors_picks');

  static Stream<EditorsPicksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EditorsPicksRecord.fromSnapshot(s));

  static Future<EditorsPicksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EditorsPicksRecord.fromSnapshot(s));

  static EditorsPicksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EditorsPicksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EditorsPicksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EditorsPicksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EditorsPicksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EditorsPicksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEditorsPicksRecordData({
  String? author,
  String? contentEnglish,
  String? contentFrench,
  bool? isPublished,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author': author,
      'content_english': contentEnglish,
      'content_french': contentFrench,
      'is_published': isPublished,
    }.withoutNulls,
  );

  return firestoreData;
}

class EditorsPicksRecordDocumentEquality
    implements Equality<EditorsPicksRecord> {
  const EditorsPicksRecordDocumentEquality();

  @override
  bool equals(EditorsPicksRecord? e1, EditorsPicksRecord? e2) {
    return e1?.author == e2?.author &&
        e1?.contentEnglish == e2?.contentEnglish &&
        e1?.contentFrench == e2?.contentFrench &&
        e1?.isPublished == e2?.isPublished;
  }

  @override
  int hash(EditorsPicksRecord? e) => const ListEquality()
      .hash([e?.author, e?.contentEnglish, e?.contentFrench, e?.isPublished]);

  @override
  bool isValidKey(Object? o) => o is EditorsPicksRecord;
}
