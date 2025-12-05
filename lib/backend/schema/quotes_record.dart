import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuotesRecord extends FirestoreRecord {
  QuotesRecord._(
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

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "is_favorited" field.
  bool? _isFavorited;
  bool get isFavorited => _isFavorited ?? false;
  bool hasIsFavorited() => _isFavorited != null;

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "prompt" field.
  DocumentReference? _prompt;
  DocumentReference? get prompt => _prompt;
  bool hasPrompt() => _prompt != null;

  // "prompt_content" field.
  String? _promptContent;
  String get promptContent => _promptContent ?? '';
  bool hasPromptContent() => _promptContent != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "is_approved" field.
  bool? _isApproved;
  bool get isApproved => _isApproved ?? false;
  bool hasIsApproved() => _isApproved != null;

  // "is_public" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "background_image" field.
  DocumentReference? _backgroundImage;
  DocumentReference? get backgroundImage => _backgroundImage;
  bool hasBackgroundImage() => _backgroundImage != null;

  // "content_submitted_for_approval" field.
  String? _contentSubmittedForApproval;
  String get contentSubmittedForApproval => _contentSubmittedForApproval ?? '';
  bool hasContentSubmittedForApproval() => _contentSubmittedForApproval != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  bool hasNickname() => _nickname != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "themes" field.
  String? _themes;
  String get themes => _themes ?? '';
  bool hasThemes() => _themes != null;

  // "language_code" field.
  String? _languageCode;
  String get languageCode => _languageCode ?? '';
  bool hasLanguageCode() => _languageCode != null;

  // "background_image_path" field.
  String? _backgroundImagePath;
  String get backgroundImagePath => _backgroundImagePath ?? '';
  bool hasBackgroundImagePath() => _backgroundImagePath != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _isFavorited = snapshotData['is_favorited'] as bool?;
    _createdBy = snapshotData['created_by'] as String?;
    _prompt = snapshotData['prompt'] as DocumentReference?;
    _promptContent = snapshotData['prompt_content'] as String?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _isApproved = snapshotData['is_approved'] as bool?;
    _isPublic = snapshotData['is_public'] as bool?;
    _likes = getDataList(snapshotData['likes']);
    _backgroundImage = snapshotData['background_image'] as DocumentReference?;
    _contentSubmittedForApproval =
        snapshotData['content_submitted_for_approval'] as String?;
    _nickname = snapshotData['nickname'] as String?;
    _author = snapshotData['author'] as String?;
    _source = snapshotData['source'] as String?;
    _url = snapshotData['url'] as String?;
    _themes = snapshotData['themes'] as String?;
    _languageCode = snapshotData['language_code'] as String?;
    _backgroundImagePath = snapshotData['background_image_path'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quotes');

  static Stream<QuotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuotesRecord.fromSnapshot(s));

  static Future<QuotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuotesRecord.fromSnapshot(s));

  static QuotesRecord fromSnapshot(DocumentSnapshot snapshot) => QuotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuotesRecordData({
  String? content,
  DateTime? createdAt,
  DocumentReference? user,
  bool? isFavorited,
  String? createdBy,
  DocumentReference? prompt,
  String? promptContent,
  bool? isDeleted,
  bool? isApproved,
  bool? isPublic,
  DocumentReference? backgroundImage,
  String? contentSubmittedForApproval,
  String? nickname,
  String? author,
  String? source,
  String? url,
  String? themes,
  String? languageCode,
  String? backgroundImagePath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'created_at': createdAt,
      'user': user,
      'is_favorited': isFavorited,
      'created_by': createdBy,
      'prompt': prompt,
      'prompt_content': promptContent,
      'is_deleted': isDeleted,
      'is_approved': isApproved,
      'is_public': isPublic,
      'background_image': backgroundImage,
      'content_submitted_for_approval': contentSubmittedForApproval,
      'nickname': nickname,
      'author': author,
      'source': source,
      'url': url,
      'themes': themes,
      'language_code': languageCode,
      'background_image_path': backgroundImagePath,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuotesRecordDocumentEquality implements Equality<QuotesRecord> {
  const QuotesRecordDocumentEquality();

  @override
  bool equals(QuotesRecord? e1, QuotesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.content == e2?.content &&
        e1?.createdAt == e2?.createdAt &&
        e1?.user == e2?.user &&
        e1?.isFavorited == e2?.isFavorited &&
        e1?.createdBy == e2?.createdBy &&
        e1?.prompt == e2?.prompt &&
        e1?.promptContent == e2?.promptContent &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.isApproved == e2?.isApproved &&
        e1?.isPublic == e2?.isPublic &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.backgroundImage == e2?.backgroundImage &&
        e1?.contentSubmittedForApproval == e2?.contentSubmittedForApproval &&
        e1?.nickname == e2?.nickname &&
        e1?.author == e2?.author &&
        e1?.source == e2?.source &&
        e1?.url == e2?.url &&
        e1?.themes == e2?.themes &&
        e1?.languageCode == e2?.languageCode &&
        e1?.backgroundImagePath == e2?.backgroundImagePath;
  }

  @override
  int hash(QuotesRecord? e) => const ListEquality().hash([
        e?.content,
        e?.createdAt,
        e?.user,
        e?.isFavorited,
        e?.createdBy,
        e?.prompt,
        e?.promptContent,
        e?.isDeleted,
        e?.isApproved,
        e?.isPublic,
        e?.likes,
        e?.backgroundImage,
        e?.contentSubmittedForApproval,
        e?.nickname,
        e?.author,
        e?.source,
        e?.url,
        e?.themes,
        e?.languageCode,
        e?.backgroundImagePath
      ]);

  @override
  bool isValidKey(Object? o) => o is QuotesRecord;
}
