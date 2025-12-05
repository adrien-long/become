import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnboardingQuestionsRecord extends FirestoreRecord {
  OnboardingQuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answer_list" field.
  List<String>? _answerList;
  List<String> get answerList => _answerList ?? const [];
  bool hasAnswerList() => _answerList != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _question = snapshotData['question'] as String?;
    _answerList = getDataList(snapshotData['answer_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('onboarding_questions');

  static Stream<OnboardingQuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OnboardingQuestionsRecord.fromSnapshot(s));

  static Future<OnboardingQuestionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OnboardingQuestionsRecord.fromSnapshot(s));

  static OnboardingQuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OnboardingQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OnboardingQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OnboardingQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OnboardingQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OnboardingQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOnboardingQuestionsRecordData({
  DocumentReference? user,
  String? question,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'question': question,
    }.withoutNulls,
  );

  return firestoreData;
}

class OnboardingQuestionsRecordDocumentEquality
    implements Equality<OnboardingQuestionsRecord> {
  const OnboardingQuestionsRecordDocumentEquality();

  @override
  bool equals(OnboardingQuestionsRecord? e1, OnboardingQuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.question == e2?.question &&
        listEquality.equals(e1?.answerList, e2?.answerList);
  }

  @override
  int hash(OnboardingQuestionsRecord? e) =>
      const ListEquality().hash([e?.user, e?.question, e?.answerList]);

  @override
  bool isValidKey(Object? o) => o is OnboardingQuestionsRecord;
}
