import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuoteThemesRecord extends FirestoreRecord {
  QuoteThemesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "example" field.
  String? _example;
  String get example => _example ?? '';
  bool hasExample() => _example != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _example = snapshotData['example'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quote_themes');

  static Stream<QuoteThemesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuoteThemesRecord.fromSnapshot(s));

  static Future<QuoteThemesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuoteThemesRecord.fromSnapshot(s));

  static QuoteThemesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuoteThemesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuoteThemesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuoteThemesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuoteThemesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuoteThemesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuoteThemesRecordData({
  String? name,
  String? description,
  String? example,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'example': example,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuoteThemesRecordDocumentEquality implements Equality<QuoteThemesRecord> {
  const QuoteThemesRecordDocumentEquality();

  @override
  bool equals(QuoteThemesRecord? e1, QuoteThemesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.example == e2?.example;
  }

  @override
  int hash(QuoteThemesRecord? e) =>
      const ListEquality().hash([e?.name, e?.description, e?.example]);

  @override
  bool isValidKey(Object? o) => o is QuoteThemesRecord;
}
