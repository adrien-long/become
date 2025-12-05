import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/intro/components/board_button/board_button_widget.dart';
import '/new_build/intro/components/load_with_timer/load_with_timer_widget.dart';
import '/new_build/intro/components/messages_item/messages_item_widget.dart';
import '/new_build/intro/components/next_button/next_button_widget.dart';
import '/new_build/intro/components/onboard_title/onboard_title_widget.dart';
import '/index.dart';
import 'intro_page_widget.dart' show IntroPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class IntroPageModel extends FlutterFlowModel<IntroPageWidget> {
  ///  Local state fields for this page.

  String? gender;

  String? yearsOld;

  String? whereHearAboutUs;

  String? whatUseBecomeFor;

  List<String> likedMessages = [];
  void addToLikedMessages(String item) => likedMessages.add(item);
  void removeFromLikedMessages(String item) => likedMessages.remove(item);
  void removeAtIndexFromLikedMessages(int index) =>
      likedMessages.removeAt(index);
  void insertAtIndexInLikedMessages(int index, String item) =>
      likedMessages.insert(index, item);
  void updateLikedMessagesAtIndex(int index, Function(String) updateFn) =>
      likedMessages[index] = updateFn(likedMessages[index]);

  String? stateOfYouMindset;

  List<String> nurtureYourGrowthAtTheMoment = [];
  void addToNurtureYourGrowthAtTheMoment(String item) =>
      nurtureYourGrowthAtTheMoment.add(item);
  void removeFromNurtureYourGrowthAtTheMoment(String item) =>
      nurtureYourGrowthAtTheMoment.remove(item);
  void removeAtIndexFromNurtureYourGrowthAtTheMoment(int index) =>
      nurtureYourGrowthAtTheMoment.removeAt(index);
  void insertAtIndexInNurtureYourGrowthAtTheMoment(int index, String item) =>
      nurtureYourGrowthAtTheMoment.insert(index, item);
  void updateNurtureYourGrowthAtTheMomentAtIndex(
          int index, Function(String) updateFn) =>
      nurtureYourGrowthAtTheMoment[index] =
          updateFn(nurtureYourGrowthAtTheMoment[index]);

  List<String> limitsYourGrowthTheMost = [];
  void addToLimitsYourGrowthTheMost(String item) =>
      limitsYourGrowthTheMost.add(item);
  void removeFromLimitsYourGrowthTheMost(String item) =>
      limitsYourGrowthTheMost.remove(item);
  void removeAtIndexFromLimitsYourGrowthTheMost(int index) =>
      limitsYourGrowthTheMost.removeAt(index);
  void insertAtIndexInLimitsYourGrowthTheMost(int index, String item) =>
      limitsYourGrowthTheMost.insert(index, item);
  void updateLimitsYourGrowthTheMostAtIndex(
          int index, Function(String) updateFn) =>
      limitsYourGrowthTheMost[index] = updateFn(limitsYourGrowthTheMost[index]);

  String? alignedWithThePersonYouWant;

  String? clearVisionOfTheLife;

  List<String> areasYourLifeLikeToImprove = [];
  void addToAreasYourLifeLikeToImprove(String item) =>
      areasYourLifeLikeToImprove.add(item);
  void removeFromAreasYourLifeLikeToImprove(String item) =>
      areasYourLifeLikeToImprove.remove(item);
  void removeAtIndexFromAreasYourLifeLikeToImprove(int index) =>
      areasYourLifeLikeToImprove.removeAt(index);
  void insertAtIndexInAreasYourLifeLikeToImprove(int index, String item) =>
      areasYourLifeLikeToImprove.insert(index, item);
  void updateAreasYourLifeLikeToImproveAtIndex(
          int index, Function(String) updateFn) =>
      areasYourLifeLikeToImprove[index] =
          updateFn(areasYourLifeLikeToImprove[index]);

  String? yourMotivationRecently;

  String? definesYouWouldLikeToBe;

  String? triedToBuildResilientMindset;

  String? godMindset;

  String? consistencyOrMotivation;

  String? mindsetOutcome;

  String? currentMindsetType;

  List<DocumentReference> examplesList = [];
  void addToExamplesList(DocumentReference item) => examplesList.add(item);
  void removeFromExamplesList(DocumentReference item) =>
      examplesList.remove(item);
  void removeAtIndexFromExamplesList(int index) => examplesList.removeAt(index);
  void insertAtIndexInExamplesList(int index, DocumentReference item) =>
      examplesList.insert(index, item);
  void updateExamplesListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      examplesList[index] = updateFn(examplesList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in IntroPage widget.
  List<QuotationsRecord>? activeQuote;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel1;
  // Stores action output result for [Backend Call - Create Document] action in NextButton widget.
  JournalRecord? journal;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel1;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel1;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel2;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel3;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel4;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel5;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel6;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel2;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel3;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel3;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel7;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel8;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel4;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel4;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel9;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel10;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel5;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel5;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel6;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel6;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel7;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel7;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Models for MessagesItem dynamic component.
  late FlutterFlowDynamicModels<MessagesItemModel> messagesItemModels;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel8;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel8;
  // Stores action output result for [Custom Action - getUsersCount] action in NextButton widget.
  int? countUsers;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel9;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel9;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel10;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel10;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel11;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel11;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel12;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel13;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel14;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel11;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel12;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel15;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel16;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel17;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel18;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel19;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel20;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel12;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel13;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel21;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel22;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel23;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel24;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel25;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel26;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel13;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel14;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel27;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel28;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel29;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel30;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel14;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel15;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel31;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel32;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel33;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel15;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel16;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel34;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel35;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel36;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel37;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel38;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel39;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel40;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel16;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel17;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel41;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel42;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel43;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel44;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel17;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel18;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel45;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel46;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel47;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel48;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel49;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel50;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel18;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel19;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel51;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel52;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel19;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel20;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel53;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel54;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel20;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel21;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel55;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel56;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel21;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel22;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel22;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel23;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel57;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel58;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel59;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel60;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel61;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel62;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel23;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel24;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel63;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel64;
  // Model for BoardButton component.
  late BoardButtonModel boardButtonModel65;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel24;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel25;
  // Model for loadWithTimer component.
  late LoadWithTimerModel loadWithTimerModel;
  // Model for OnboardTitle component.
  late OnboardTitleModel onboardTitleModel26;
  // Model for NextButton component.
  late NextButtonModel nextButtonModel25;

  @override
  void initState(BuildContext context) {
    nextButtonModel1 = createModel(context, () => NextButtonModel());
    onboardTitleModel1 = createModel(context, () => OnboardTitleModel());
    boardButtonModel1 = createModel(context, () => BoardButtonModel());
    boardButtonModel2 = createModel(context, () => BoardButtonModel());
    boardButtonModel3 = createModel(context, () => BoardButtonModel());
    boardButtonModel4 = createModel(context, () => BoardButtonModel());
    boardButtonModel5 = createModel(context, () => BoardButtonModel());
    boardButtonModel6 = createModel(context, () => BoardButtonModel());
    nextButtonModel2 = createModel(context, () => NextButtonModel());
    onboardTitleModel2 = createModel(context, () => OnboardTitleModel());
    nextButtonModel3 = createModel(context, () => NextButtonModel());
    onboardTitleModel3 = createModel(context, () => OnboardTitleModel());
    boardButtonModel7 = createModel(context, () => BoardButtonModel());
    boardButtonModel8 = createModel(context, () => BoardButtonModel());
    nextButtonModel4 = createModel(context, () => NextButtonModel());
    onboardTitleModel4 = createModel(context, () => OnboardTitleModel());
    boardButtonModel9 = createModel(context, () => BoardButtonModel());
    boardButtonModel10 = createModel(context, () => BoardButtonModel());
    nextButtonModel5 = createModel(context, () => NextButtonModel());
    onboardTitleModel5 = createModel(context, () => OnboardTitleModel());
    onboardTitleModel6 = createModel(context, () => OnboardTitleModel());
    nextButtonModel6 = createModel(context, () => NextButtonModel());
    onboardTitleModel7 = createModel(context, () => OnboardTitleModel());
    nextButtonModel7 = createModel(context, () => NextButtonModel());
    swipeableStackController = CardSwiperController();
    messagesItemModels = FlutterFlowDynamicModels(() => MessagesItemModel());
    onboardTitleModel8 = createModel(context, () => OnboardTitleModel());
    nextButtonModel8 = createModel(context, () => NextButtonModel());
    onboardTitleModel9 = createModel(context, () => OnboardTitleModel());
    nextButtonModel9 = createModel(context, () => NextButtonModel());
    onboardTitleModel10 = createModel(context, () => OnboardTitleModel());
    nextButtonModel10 = createModel(context, () => NextButtonModel());
    onboardTitleModel11 = createModel(context, () => OnboardTitleModel());
    boardButtonModel11 = createModel(context, () => BoardButtonModel());
    boardButtonModel12 = createModel(context, () => BoardButtonModel());
    boardButtonModel13 = createModel(context, () => BoardButtonModel());
    boardButtonModel14 = createModel(context, () => BoardButtonModel());
    nextButtonModel11 = createModel(context, () => NextButtonModel());
    onboardTitleModel12 = createModel(context, () => OnboardTitleModel());
    boardButtonModel15 = createModel(context, () => BoardButtonModel());
    boardButtonModel16 = createModel(context, () => BoardButtonModel());
    boardButtonModel17 = createModel(context, () => BoardButtonModel());
    boardButtonModel18 = createModel(context, () => BoardButtonModel());
    boardButtonModel19 = createModel(context, () => BoardButtonModel());
    boardButtonModel20 = createModel(context, () => BoardButtonModel());
    nextButtonModel12 = createModel(context, () => NextButtonModel());
    onboardTitleModel13 = createModel(context, () => OnboardTitleModel());
    boardButtonModel21 = createModel(context, () => BoardButtonModel());
    boardButtonModel22 = createModel(context, () => BoardButtonModel());
    boardButtonModel23 = createModel(context, () => BoardButtonModel());
    boardButtonModel24 = createModel(context, () => BoardButtonModel());
    boardButtonModel25 = createModel(context, () => BoardButtonModel());
    boardButtonModel26 = createModel(context, () => BoardButtonModel());
    nextButtonModel13 = createModel(context, () => NextButtonModel());
    onboardTitleModel14 = createModel(context, () => OnboardTitleModel());
    boardButtonModel27 = createModel(context, () => BoardButtonModel());
    boardButtonModel28 = createModel(context, () => BoardButtonModel());
    boardButtonModel29 = createModel(context, () => BoardButtonModel());
    boardButtonModel30 = createModel(context, () => BoardButtonModel());
    nextButtonModel14 = createModel(context, () => NextButtonModel());
    onboardTitleModel15 = createModel(context, () => OnboardTitleModel());
    boardButtonModel31 = createModel(context, () => BoardButtonModel());
    boardButtonModel32 = createModel(context, () => BoardButtonModel());
    boardButtonModel33 = createModel(context, () => BoardButtonModel());
    nextButtonModel15 = createModel(context, () => NextButtonModel());
    onboardTitleModel16 = createModel(context, () => OnboardTitleModel());
    boardButtonModel34 = createModel(context, () => BoardButtonModel());
    boardButtonModel35 = createModel(context, () => BoardButtonModel());
    boardButtonModel36 = createModel(context, () => BoardButtonModel());
    boardButtonModel37 = createModel(context, () => BoardButtonModel());
    boardButtonModel38 = createModel(context, () => BoardButtonModel());
    boardButtonModel39 = createModel(context, () => BoardButtonModel());
    boardButtonModel40 = createModel(context, () => BoardButtonModel());
    nextButtonModel16 = createModel(context, () => NextButtonModel());
    onboardTitleModel17 = createModel(context, () => OnboardTitleModel());
    boardButtonModel41 = createModel(context, () => BoardButtonModel());
    boardButtonModel42 = createModel(context, () => BoardButtonModel());
    boardButtonModel43 = createModel(context, () => BoardButtonModel());
    boardButtonModel44 = createModel(context, () => BoardButtonModel());
    nextButtonModel17 = createModel(context, () => NextButtonModel());
    onboardTitleModel18 = createModel(context, () => OnboardTitleModel());
    boardButtonModel45 = createModel(context, () => BoardButtonModel());
    boardButtonModel46 = createModel(context, () => BoardButtonModel());
    boardButtonModel47 = createModel(context, () => BoardButtonModel());
    boardButtonModel48 = createModel(context, () => BoardButtonModel());
    boardButtonModel49 = createModel(context, () => BoardButtonModel());
    boardButtonModel50 = createModel(context, () => BoardButtonModel());
    nextButtonModel18 = createModel(context, () => NextButtonModel());
    onboardTitleModel19 = createModel(context, () => OnboardTitleModel());
    boardButtonModel51 = createModel(context, () => BoardButtonModel());
    boardButtonModel52 = createModel(context, () => BoardButtonModel());
    nextButtonModel19 = createModel(context, () => NextButtonModel());
    onboardTitleModel20 = createModel(context, () => OnboardTitleModel());
    boardButtonModel53 = createModel(context, () => BoardButtonModel());
    boardButtonModel54 = createModel(context, () => BoardButtonModel());
    nextButtonModel20 = createModel(context, () => NextButtonModel());
    onboardTitleModel21 = createModel(context, () => OnboardTitleModel());
    boardButtonModel55 = createModel(context, () => BoardButtonModel());
    boardButtonModel56 = createModel(context, () => BoardButtonModel());
    nextButtonModel21 = createModel(context, () => NextButtonModel());
    onboardTitleModel22 = createModel(context, () => OnboardTitleModel());
    nextButtonModel22 = createModel(context, () => NextButtonModel());
    onboardTitleModel23 = createModel(context, () => OnboardTitleModel());
    boardButtonModel57 = createModel(context, () => BoardButtonModel());
    boardButtonModel58 = createModel(context, () => BoardButtonModel());
    boardButtonModel59 = createModel(context, () => BoardButtonModel());
    boardButtonModel60 = createModel(context, () => BoardButtonModel());
    boardButtonModel61 = createModel(context, () => BoardButtonModel());
    boardButtonModel62 = createModel(context, () => BoardButtonModel());
    nextButtonModel23 = createModel(context, () => NextButtonModel());
    onboardTitleModel24 = createModel(context, () => OnboardTitleModel());
    boardButtonModel63 = createModel(context, () => BoardButtonModel());
    boardButtonModel64 = createModel(context, () => BoardButtonModel());
    boardButtonModel65 = createModel(context, () => BoardButtonModel());
    nextButtonModel24 = createModel(context, () => NextButtonModel());
    onboardTitleModel25 = createModel(context, () => OnboardTitleModel());
    loadWithTimerModel = createModel(context, () => LoadWithTimerModel());
    onboardTitleModel26 = createModel(context, () => OnboardTitleModel());
    nextButtonModel25 = createModel(context, () => NextButtonModel());
  }

  @override
  void dispose() {
    nextButtonModel1.dispose();
    onboardTitleModel1.dispose();
    boardButtonModel1.dispose();
    boardButtonModel2.dispose();
    boardButtonModel3.dispose();
    boardButtonModel4.dispose();
    boardButtonModel5.dispose();
    boardButtonModel6.dispose();
    nextButtonModel2.dispose();
    onboardTitleModel2.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    nextButtonModel3.dispose();
    onboardTitleModel3.dispose();
    boardButtonModel7.dispose();
    boardButtonModel8.dispose();
    nextButtonModel4.dispose();
    onboardTitleModel4.dispose();
    boardButtonModel9.dispose();
    boardButtonModel10.dispose();
    nextButtonModel5.dispose();
    onboardTitleModel5.dispose();
    onboardTitleModel6.dispose();
    nextButtonModel6.dispose();
    onboardTitleModel7.dispose();
    nextButtonModel7.dispose();
    messagesItemModels.dispose();
    onboardTitleModel8.dispose();
    nextButtonModel8.dispose();
    onboardTitleModel9.dispose();
    nextButtonModel9.dispose();
    onboardTitleModel10.dispose();
    nextButtonModel10.dispose();
    onboardTitleModel11.dispose();
    boardButtonModel11.dispose();
    boardButtonModel12.dispose();
    boardButtonModel13.dispose();
    boardButtonModel14.dispose();
    nextButtonModel11.dispose();
    onboardTitleModel12.dispose();
    boardButtonModel15.dispose();
    boardButtonModel16.dispose();
    boardButtonModel17.dispose();
    boardButtonModel18.dispose();
    boardButtonModel19.dispose();
    boardButtonModel20.dispose();
    nextButtonModel12.dispose();
    onboardTitleModel13.dispose();
    boardButtonModel21.dispose();
    boardButtonModel22.dispose();
    boardButtonModel23.dispose();
    boardButtonModel24.dispose();
    boardButtonModel25.dispose();
    boardButtonModel26.dispose();
    nextButtonModel13.dispose();
    onboardTitleModel14.dispose();
    boardButtonModel27.dispose();
    boardButtonModel28.dispose();
    boardButtonModel29.dispose();
    boardButtonModel30.dispose();
    nextButtonModel14.dispose();
    onboardTitleModel15.dispose();
    boardButtonModel31.dispose();
    boardButtonModel32.dispose();
    boardButtonModel33.dispose();
    nextButtonModel15.dispose();
    onboardTitleModel16.dispose();
    boardButtonModel34.dispose();
    boardButtonModel35.dispose();
    boardButtonModel36.dispose();
    boardButtonModel37.dispose();
    boardButtonModel38.dispose();
    boardButtonModel39.dispose();
    boardButtonModel40.dispose();
    nextButtonModel16.dispose();
    onboardTitleModel17.dispose();
    boardButtonModel41.dispose();
    boardButtonModel42.dispose();
    boardButtonModel43.dispose();
    boardButtonModel44.dispose();
    nextButtonModel17.dispose();
    onboardTitleModel18.dispose();
    boardButtonModel45.dispose();
    boardButtonModel46.dispose();
    boardButtonModel47.dispose();
    boardButtonModel48.dispose();
    boardButtonModel49.dispose();
    boardButtonModel50.dispose();
    nextButtonModel18.dispose();
    onboardTitleModel19.dispose();
    boardButtonModel51.dispose();
    boardButtonModel52.dispose();
    nextButtonModel19.dispose();
    onboardTitleModel20.dispose();
    boardButtonModel53.dispose();
    boardButtonModel54.dispose();
    nextButtonModel20.dispose();
    onboardTitleModel21.dispose();
    boardButtonModel55.dispose();
    boardButtonModel56.dispose();
    nextButtonModel21.dispose();
    onboardTitleModel22.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    nextButtonModel22.dispose();
    onboardTitleModel23.dispose();
    boardButtonModel57.dispose();
    boardButtonModel58.dispose();
    boardButtonModel59.dispose();
    boardButtonModel60.dispose();
    boardButtonModel61.dispose();
    boardButtonModel62.dispose();
    nextButtonModel23.dispose();
    onboardTitleModel24.dispose();
    boardButtonModel63.dispose();
    boardButtonModel64.dispose();
    boardButtonModel65.dispose();
    nextButtonModel24.dispose();
    onboardTitleModel25.dispose();
    loadWithTimerModel.dispose();
    onboardTitleModel26.dispose();
    nextButtonModel25.dispose();
  }
}
