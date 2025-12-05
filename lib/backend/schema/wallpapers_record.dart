import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WallpapersRecord extends FirestoreRecord {
  WallpapersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "font_color" field.
  Color? _fontColor;
  Color? get fontColor => _fontColor;
  bool hasFontColor() => _fontColor != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _imageUrl = snapshotData['image_url'] as String?;
    _fontColor = getSchemaColor(snapshotData['font_color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wallpapers');

  static Stream<WallpapersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WallpapersRecord.fromSnapshot(s));

  static Future<WallpapersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WallpapersRecord.fromSnapshot(s));

  static WallpapersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WallpapersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WallpapersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WallpapersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WallpapersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WallpapersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWallpapersRecordData({
  String? image,
  int? order,
  String? imageUrl,
  Color? fontColor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'order': order,
      'image_url': imageUrl,
      'font_color': fontColor,
    }.withoutNulls,
  );

  return firestoreData;
}

class WallpapersRecordDocumentEquality implements Equality<WallpapersRecord> {
  const WallpapersRecordDocumentEquality();

  @override
  bool equals(WallpapersRecord? e1, WallpapersRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.order == e2?.order &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.fontColor == e2?.fontColor;
  }

  @override
  int hash(WallpapersRecord? e) => const ListEquality()
      .hash([e?.image, e?.order, e?.imageUrl, e?.fontColor]);

  @override
  bool isValidKey(Object? o) => o is WallpapersRecord;
}
