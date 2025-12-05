import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PushNotificationsRecord extends FirestoreRecord {
  PushNotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "received_by" field.
  DocumentReference? _receivedBy;
  DocumentReference? get receivedBy => _receivedBy;
  bool hasReceivedBy() => _receivedBy != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _receivedBy = snapshotData['received_by'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _body = snapshotData['body'] as String?;
    _title = snapshotData['title'] as String?;
    _createdBy = snapshotData['created_by'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('push_notifications');

  static Stream<PushNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PushNotificationsRecord.fromSnapshot(s));

  static Future<PushNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PushNotificationsRecord.fromSnapshot(s));

  static PushNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PushNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PushNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PushNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PushNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PushNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPushNotificationsRecordData({
  DocumentReference? receivedBy,
  DateTime? createdAt,
  String? body,
  String? title,
  String? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'received_by': receivedBy,
      'created_at': createdAt,
      'body': body,
      'title': title,
      'created_by': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class PushNotificationsRecordDocumentEquality
    implements Equality<PushNotificationsRecord> {
  const PushNotificationsRecordDocumentEquality();

  @override
  bool equals(PushNotificationsRecord? e1, PushNotificationsRecord? e2) {
    return e1?.receivedBy == e2?.receivedBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.body == e2?.body &&
        e1?.title == e2?.title &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(PushNotificationsRecord? e) => const ListEquality()
      .hash([e?.receivedBy, e?.createdAt, e?.body, e?.title, e?.createdBy]);

  @override
  bool isValidKey(Object? o) => o is PushNotificationsRecord;
}
