import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "active_journal" field.
  DocumentReference? _activeJournal;
  DocumentReference? get activeJournal => _activeJournal;
  bool hasActiveJournal() => _activeJournal != null;

  // "timezone" field.
  String? _timezone;
  String get timezone => _timezone ?? '';
  bool hasTimezone() => _timezone != null;

  // "is_ios" field.
  bool? _isIos;
  bool get isIos => _isIos ?? false;
  bool hasIsIos() => _isIos != null;

  // "is_android" field.
  bool? _isAndroid;
  bool get isAndroid => _isAndroid ?? false;
  bool hasIsAndroid() => _isAndroid != null;

  // "timezone_last_updated_at" field.
  DateTime? _timezoneLastUpdatedAt;
  DateTime? get timezoneLastUpdatedAt => _timezoneLastUpdatedAt;
  bool hasTimezoneLastUpdatedAt() => _timezoneLastUpdatedAt != null;

  // "latest_journal" field.
  DocumentReference? _latestJournal;
  DocumentReference? get latestJournal => _latestJournal;
  bool hasLatestJournal() => _latestJournal != null;

  // "language_code" field.
  String? _languageCode;
  String get languageCode => _languageCode ?? '';
  bool hasLanguageCode() => _languageCode != null;

  // "language_set_at" field.
  DateTime? _languageSetAt;
  DateTime? get languageSetAt => _languageSetAt;
  bool hasLanguageSetAt() => _languageSetAt != null;

  // "is_test_user" field.
  bool? _isTestUser;
  bool get isTestUser => _isTestUser ?? false;
  bool hasIsTestUser() => _isTestUser != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  bool hasNickname() => _nickname != null;

  // "reasons_for_joining" field.
  List<String>? _reasonsForJoining;
  List<String> get reasonsForJoining => _reasonsForJoining ?? const [];
  bool hasReasonsForJoining() => _reasonsForJoining != null;

  // "age_group" field.
  String? _ageGroup;
  String get ageGroup => _ageGroup ?? '';
  bool hasAgeGroup() => _ageGroup != null;

  // "last_onboarding_journal_entry" field.
  DocumentReference? _lastOnboardingJournalEntry;
  DocumentReference? get lastOnboardingJournalEntry =>
      _lastOnboardingJournalEntry;
  bool hasLastOnboardingJournalEntry() => _lastOnboardingJournalEntry != null;

  // "onboarding_is_completed" field.
  bool? _onboardingIsCompleted;
  bool get onboardingIsCompleted => _onboardingIsCompleted ?? false;
  bool hasOnboardingIsCompleted() => _onboardingIsCompleted != null;

  // "onboarding_step" field.
  String? _onboardingStep;
  String get onboardingStep => _onboardingStep ?? '';
  bool hasOnboardingStep() => _onboardingStep != null;

  // "request_feedback" field.
  bool? _requestFeedback;
  bool get requestFeedback => _requestFeedback ?? false;
  bool hasRequestFeedback() => _requestFeedback != null;

  // "last_visit" field.
  DateTime? _lastVisit;
  DateTime? get lastVisit => _lastVisit;
  bool hasLastVisit() => _lastVisit != null;

  // "notification_settings" field.
  NotificationSettingsStruct? _notificationSettings;
  NotificationSettingsStruct get notificationSettings =>
      _notificationSettings ?? NotificationSettingsStruct();
  bool hasNotificationSettings() => _notificationSettings != null;

  // "liked_quotations" field.
  List<DocumentReference>? _likedQuotations;
  List<DocumentReference> get likedQuotations => _likedQuotations ?? const [];
  bool hasLikedQuotations() => _likedQuotations != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _activeJournal = snapshotData['active_journal'] as DocumentReference?;
    _timezone = snapshotData['timezone'] as String?;
    _isIos = snapshotData['is_ios'] as bool?;
    _isAndroid = snapshotData['is_android'] as bool?;
    _timezoneLastUpdatedAt =
        snapshotData['timezone_last_updated_at'] as DateTime?;
    _latestJournal = snapshotData['latest_journal'] as DocumentReference?;
    _languageCode = snapshotData['language_code'] as String?;
    _languageSetAt = snapshotData['language_set_at'] as DateTime?;
    _isTestUser = snapshotData['is_test_user'] as bool?;
    _nickname = snapshotData['nickname'] as String?;
    _reasonsForJoining = getDataList(snapshotData['reasons_for_joining']);
    _ageGroup = snapshotData['age_group'] as String?;
    _lastOnboardingJournalEntry =
        snapshotData['last_onboarding_journal_entry'] as DocumentReference?;
    _onboardingIsCompleted = snapshotData['onboarding_is_completed'] as bool?;
    _onboardingStep = snapshotData['onboarding_step'] as String?;
    _requestFeedback = snapshotData['request_feedback'] as bool?;
    _lastVisit = snapshotData['last_visit'] as DateTime?;
    _notificationSettings =
        snapshotData['notification_settings'] is NotificationSettingsStruct
            ? snapshotData['notification_settings']
            : NotificationSettingsStruct.maybeFromMap(
                snapshotData['notification_settings']);
    _likedQuotations = getDataList(snapshotData['liked_quotations']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DocumentReference? activeJournal,
  String? timezone,
  bool? isIos,
  bool? isAndroid,
  DateTime? timezoneLastUpdatedAt,
  DocumentReference? latestJournal,
  String? languageCode,
  DateTime? languageSetAt,
  bool? isTestUser,
  String? nickname,
  String? ageGroup,
  DocumentReference? lastOnboardingJournalEntry,
  bool? onboardingIsCompleted,
  String? onboardingStep,
  bool? requestFeedback,
  DateTime? lastVisit,
  NotificationSettingsStruct? notificationSettings,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'active_journal': activeJournal,
      'timezone': timezone,
      'is_ios': isIos,
      'is_android': isAndroid,
      'timezone_last_updated_at': timezoneLastUpdatedAt,
      'latest_journal': latestJournal,
      'language_code': languageCode,
      'language_set_at': languageSetAt,
      'is_test_user': isTestUser,
      'nickname': nickname,
      'age_group': ageGroup,
      'last_onboarding_journal_entry': lastOnboardingJournalEntry,
      'onboarding_is_completed': onboardingIsCompleted,
      'onboarding_step': onboardingStep,
      'request_feedback': requestFeedback,
      'last_visit': lastVisit,
      'notification_settings': NotificationSettingsStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "notification_settings" field.
  addNotificationSettingsStructData(
      firestoreData, notificationSettings, 'notification_settings');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.activeJournal == e2?.activeJournal &&
        e1?.timezone == e2?.timezone &&
        e1?.isIos == e2?.isIos &&
        e1?.isAndroid == e2?.isAndroid &&
        e1?.timezoneLastUpdatedAt == e2?.timezoneLastUpdatedAt &&
        e1?.latestJournal == e2?.latestJournal &&
        e1?.languageCode == e2?.languageCode &&
        e1?.languageSetAt == e2?.languageSetAt &&
        e1?.isTestUser == e2?.isTestUser &&
        e1?.nickname == e2?.nickname &&
        listEquality.equals(e1?.reasonsForJoining, e2?.reasonsForJoining) &&
        e1?.ageGroup == e2?.ageGroup &&
        e1?.lastOnboardingJournalEntry == e2?.lastOnboardingJournalEntry &&
        e1?.onboardingIsCompleted == e2?.onboardingIsCompleted &&
        e1?.onboardingStep == e2?.onboardingStep &&
        e1?.requestFeedback == e2?.requestFeedback &&
        e1?.lastVisit == e2?.lastVisit &&
        e1?.notificationSettings == e2?.notificationSettings &&
        listEquality.equals(e1?.likedQuotations, e2?.likedQuotations);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.activeJournal,
        e?.timezone,
        e?.isIos,
        e?.isAndroid,
        e?.timezoneLastUpdatedAt,
        e?.latestJournal,
        e?.languageCode,
        e?.languageSetAt,
        e?.isTestUser,
        e?.nickname,
        e?.reasonsForJoining,
        e?.ageGroup,
        e?.lastOnboardingJournalEntry,
        e?.onboardingIsCompleted,
        e?.onboardingStep,
        e?.requestFeedback,
        e?.lastVisit,
        e?.notificationSettings,
        e?.likedQuotations
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
