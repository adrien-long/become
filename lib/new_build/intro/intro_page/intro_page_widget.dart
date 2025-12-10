import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/intro/components/board_button/board_button_widget.dart';
import '/new_build/intro/components/load_with_timer/load_with_timer_widget.dart';
import '/new_build/intro/components/messages_item/messages_item_widget.dart';
import '/new_build/intro/components/next_button/next_button_widget.dart';
import '/new_build/intro/components/onboard_title/onboard_title_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'intro_page_model.dart';
export 'intro_page_model.dart';

class IntroPageWidget extends StatefulWidget {
  const IntroPageWidget({
    super.key,
    this.onboardIndex,
  });

  final int? onboardIndex;

  static String routeName = 'IntroPage';
  static String routePath = '/introPage';

  @override
  State<IntroPageWidget> createState() => _IntroPageWidgetState();
}

class _IntroPageWidgetState extends State<IntroPageWidget>
    with TickerProviderStateMixin {
  late IntroPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setAppLanguage(context, 'en');
      _model.activeQuote = await queryQuotationsRecordOnce(
        queryBuilder: (quotationsRecord) =>
            quotationsRecord.whereIn('category', ['Grow Mode']),
      );
      _model.examplesList = _model.activeQuote!
          .map((e) => e.reference)
          .toList()
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
      if (!((widget.onboardIndex != null) && (widget.onboardIndex != 0))) {
        await _model.pageViewController?.animateToPage(
          widget.onboardIndex!,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<QuotationsRecord>>(
      stream: queryQuotationsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<QuotationsRecord> introPageQuotationsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 500.0,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        onPageChanged: (_) async {
                          await actions.saveOnboardingCheckpointAutoNew(
                            _model.pageViewCurrentIndex,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'jv0985bh' /* be
come */
                                        ,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Grift',
                                            color: FlutterFlowTheme.of(context)
                                                .second,
                                            fontSize: 80.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            lineHeight: 0.6,
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation1']!),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'es7ha1wg' /* Adopt a life-changing
 mindset */
                                      ,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Grift',
                                          color: FlutterFlowTheme.of(context)
                                              .second,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation2']!),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.asset(
                                      'assets/images/undraw_breaking-barriers_4leg_1.svg',
                                      width: 300.0,
                                      height: 300.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.nextButtonModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NextButtonWidget(
                                      title: 'Start',
                                      onTab: () async {
                                        GoRouter.of(context).prepareAuthEvent();
                                        final user = await authManager
                                            .signInAnonymously(context);
                                        if (user == null) {
                                          return;
                                        }

                                        var journalRecordReference =
                                            JournalRecord.collection.doc();
                                        await journalRecordReference.set({
                                          ...createJournalRecordData(
                                            user: currentUserReference,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'created_at':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        _model.journal =
                                            JournalRecord.getDocumentFromData({
                                          ...createJournalRecordData(
                                            user: currentUserReference,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'created_at': DateTime.now(),
                                            },
                                          ),
                                        }, journalRecordReference);

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          activeJournal:
                                              _model.journal?.reference,
                                          languageCode:
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                        ));

                                        await QuotesRecord.collection
                                            .doc()
                                            .set({
                                          ...createQuotesRecordData(
                                            content:
                                                'You are stronger than you think',
                                            user: currentUserReference,
                                            isFavorited: false,
                                            createdBy: 'intro_quote',
                                            isPublic: false,
                                            isApproved: false,
                                            isDeleted: false,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'created_at':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        await _model.pageViewController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title: 'Where did you hear about us?',
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      wrapWithModel(
                                        model: _model.boardButtonModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: BoardButtonWidget(
                                          isSelected: _model.whereHearAboutUs ==
                                              'instagram',
                                          buttonText: 'Instagram',
                                          textSize: 20,
                                          onSelect: () async {
                                            _model.whereHearAboutUs =
                                                'instagram';
                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.boardButtonModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: BoardButtonWidget(
                                          isSelected: _model.whereHearAboutUs ==
                                              'tik_tok',
                                          buttonText: 'Tik Tok ',
                                          textSize: 20,
                                          onSelect: () async {
                                            _model.whereHearAboutUs = 'tik_tok';
                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.boardButtonModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: BoardButtonWidget(
                                          isSelected: _model.whereHearAboutUs ==
                                              'friend_or_family',
                                          buttonText: 'Friend or Family ',
                                          textSize: 20,
                                          onSelect: () async {
                                            _model.whereHearAboutUs =
                                                'friend_or_family';
                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.boardButtonModel4,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: BoardButtonWidget(
                                          isSelected: _model.whereHearAboutUs ==
                                              'apple_store',
                                          buttonText: 'Apple Store ',
                                          textSize: 20,
                                          onSelect: () async {
                                            _model.whereHearAboutUs =
                                                'apple_store';
                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.boardButtonModel5,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: BoardButtonWidget(
                                          isSelected: _model.whereHearAboutUs ==
                                              'google_play_store',
                                          buttonText: 'Google Play Store ',
                                          textSize: 20,
                                          onSelect: () async {
                                            _model.whereHearAboutUs =
                                                'google_play_store';
                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.boardButtonModel6,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: BoardButtonWidget(
                                          isSelected: _model.whereHearAboutUs ==
                                              'other',
                                          buttonText: 'Other ',
                                          textSize: 20,
                                          onSelect: () async {
                                            _model.whereHearAboutUs = 'other';
                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 20.0)),
                                  ),
                                  wrapWithModel(
                                    model: _model.nextButtonModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NextButtonWidget(
                                      title: 'Continue',
                                      onTab: () async {
                                        await OnboardingQuestionsRecord
                                            .collection
                                            .doc()
                                            .set({
                                          ...createOnboardingQuestionsRecordData(
                                            user: currentUserReference,
                                            question: 'where_hear_about _us',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'answer_list':
                                                  functions.stringToList(
                                                      _model.whereHearAboutUs!),
                                            },
                                          ),
                                        });
                                        await _model.pageViewController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 60.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.onboardTitleModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: OnboardTitleWidget(
                                          title: 'What`s your name?',
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _model.textController1,
                                    focusNode: _model.textFieldFocusNode1,
                                    autofocus: false,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'pc6vkhy0' /* Type here... */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Grift',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .second,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      filled: true,
                                      fillColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Grift',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                        ),
                                    textAlign: TextAlign.center,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    enableInteractiveSelection: true,
                                    validator: _model.textController1Validator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.words),
                                          );
                                        }),
                                    ],
                                  ),
                                  wrapWithModel(
                                    model: _model.nextButtonModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NextButtonWidget(
                                      title: 'Continue',
                                      onTab: () async {
                                        await actions.hideKeyboardAction(
                                          context,
                                        );

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          displayName:
                                              _model.textController1.text,
                                        ));
                                        await _model.pageViewController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 60.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => wrapWithModel(
                                      model: _model.onboardTitleModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'Welcome ${currentUserDisplayName}, ${(String var1) {
                                          return var1 = '\n \n';
                                        }('')}What do you want Become to help you with?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel7,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.mindsetOutcome ==
                                            'Feel_happy_and_aligned_with_myself',
                                        buttonText:
                                            'Feel happy and aligned with myself',
                                        textSize: 16,
                                        onSelect: () async {
                                          _model.mindsetOutcome =
                                              'Feel_happy_and_aligned_with_myself';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel8,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.mindsetOutcome ==
                                            'Achieve_goals_more_consistently',
                                        buttonText:
                                            'Achieve goals more consistently',
                                        textSize: 16,
                                        onSelect: () async {
                                          _model.mindsetOutcome =
                                              'Achieve_goals_more_consistently';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel4,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'What_outcome_of_having_a_great_mindset_resonates_the_most_with_you?  What outcome of having a great mindset resonates the most with you?  What outcome of having a great mindset resonates the most with yoWhat outcome of having a great mindset resonates the most with you?',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list':
                                                functions.stringToList(
                                                    _model.mindsetOutcome!),
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 60.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.onboardTitleModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OnboardTitleWidget(
                                      title:
                                          ' Let’s check your current mindset type. ${(String var1) {
                                        return var1 = '\n \n';
                                      }('')}When you’re not good at something, what’s your first thought:',
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel9,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.currentMindsetType ==
                                            '\"How_can_I_learn_this?\"',
                                        buttonText: '\"How can I learn this?\"',
                                        textSize: 16,
                                        onSelect: () async {
                                          _model.currentMindsetType =
                                              '\"How_can_I_learn_this?\"';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel10,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.currentMindsetType ==
                                            '\"Maybe_I’m_just_not_the_type_for_this.\"',
                                        buttonText:
                                            '\"Maybe I’m just not the type for this.\"',
                                        textSize: 16,
                                        onSelect: () async {
                                          _model.currentMindsetType =
                                              '\"Maybe_I’m_just_not_the_type_for_this.\"';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel5,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      if (_model.currentMindsetType != null &&
                                          _model.currentMindsetType != '') {
                                        await OnboardingQuestionsRecord
                                            .collection
                                            .doc()
                                            .set({
                                          ...createOnboardingQuestionsRecordData(
                                            user: currentUserReference,
                                            question:
                                                ' Let’s_check_your_current_mindset_type',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'answer_list':
                                                  functions.stringToList(_model
                                                      .currentMindsetType!),
                                            },
                                          ),
                                        });
                                        await _model.pageViewController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.currentMindsetType ==
                                                '\"How_can_I_learn_this?\"') {
                                              return wrapWithModel(
                                                model:
                                                    _model.onboardTitleModel5,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: OnboardTitleWidget(
                                                  title:
                                                      'Awesome. ${(String var1) {
                                                    return var1 = '\n \n';
                                                  }('')}You’re already operating with a Growth Mindset.We’ll help you turn it into a real engine for progress.',
                                                  center: true,
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                child: wrapWithModel(
                                                  model:
                                                      _model.onboardTitleModel6,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: OnboardTitleWidget(
                                                    title:
                                                        'This is a Fixed Mindset — and that’s exactly where the shift begins${(String var1) {
                                                      return var1 = '\n \n';
                                                    }('')}We’ll help you replace limiting beliefs with habits of effort, learning, and possibility',
                                                    center: true,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel6,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: wrapWithModel(
                                    model: _model.onboardTitleModel7,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OnboardTitleWidget(
                                      title:
                                          'To start, select 3 messages that resonate the most with you. ',
                                      center: true,
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel7,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Next',
                                    onTab: () async {
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 60.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 250.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: LinearPercentIndicator(
                                    percent: valueOrDefault<double>(
                                      valueOrDefault<int>(
                                            _model.likedMessages.length,
                                            0,
                                          ) /
                                          3,
                                      0.1,
                                    ),
                                    width: 250.0,
                                    lineHeight: 12.0,
                                    animation: true,
                                    animateFromLastPercent: true,
                                    progressColor:
                                        FlutterFlowTheme.of(context).second,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    barRadius: Radius.circular(8.0),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite_border_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).second,
                                        size: 20.0,
                                      ),
                                      Text(
                                        '${valueOrDefault<String>(
                                          _model.likedMessages.length
                                              .toString(),
                                          '0',
                                        )}/3 ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Grift',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .second,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final listMessages = functions
                                          .filteredQuotations(
                                              introPageQuotationsRecordList
                                                  .toList(),
                                              functions
                                                  .listCategoryName(FFAppState()
                                                      .selectedCategories
                                                      .toList())
                                                  .toList(),
                                              revenue_cat.activeEntitlementIds
                                                      .length !=
                                                  0,
                                              functions
                                                  .allFreeCategories(
                                                      FFAppState()
                                                          .Categories
                                                          .toList())
                                                  .toList())
                                          .toList();

                                      return FlutterFlowSwipeableStack(
                                        onSwipeFn: (index) {},
                                        onLeftSwipe: (index) {},
                                        onRightSwipe: (index) {},
                                        onUpSwipe: (index) {},
                                        onDownSwipe: (index) {},
                                        itemBuilder:
                                            (context, listMessagesIndex) {
                                          final listMessagesItem =
                                              listMessages[listMessagesIndex];
                                          return wrapWithModel(
                                            model: _model.messagesItemModels
                                                .getModel(
                                              listMessagesIndex.toString(),
                                              listMessagesIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: MessagesItemWidget(
                                              key: Key(
                                                'Keyq9f_${listMessagesIndex.toString()}',
                                              ),
                                              title: listMessagesItem.content,
                                              onNext: () async {
                                                _model.swipeableStackController
                                                    .swipeTop();
                                              },
                                              onLike: () async {
                                                _model.addToLikedMessages(
                                                    listMessagesItem.content);
                                                safeSetState(() {});
                                                if (_model
                                                        .likedMessages.length ==
                                                    3) {
                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                } else {
                                                  _model
                                                      .swipeableStackController
                                                      .swipeBottom();
                                                }
                                              },
                                            ),
                                          );
                                        },
                                        itemCount: listMessages.length,
                                        controller:
                                            _model.swipeableStackController,
                                        loop: true,
                                        cardDisplayCount: 1,
                                        scale: 1.0,
                                        allowedSwipeDirection:
                                            AllowedSwipeDirection.only(
                                                up: true),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: AuthUserStreamWidget(
                                    builder: (context) => wrapWithModel(
                                      model: _model.onboardTitleModel8,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'Congrats,  ${currentUserDisplayName}${(String var1) {
                                          return var1 = '\n \n';
                                        }('')}You’re on your way to becoming the person you want to be. ${(String var1) {
                                          return var1 = '\n \n';
                                        }('')}Become will help you build the right mindset for it.',
                                        center: true,
                                      ),
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel8,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      _model.countUsers =
                                          await actions.getUsersCount();
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: wrapWithModel(
                                    model: _model.onboardTitleModel9,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OnboardTitleWidget(
                                      title:
                                          'Welcome to the community!${(String var1) {
                                        return var1 = '\n \n';
                                      }('')}You’re the Becomer n° ${_model.countUsers != null ? _model.countUsers?.toString() : '1'}',
                                      center: true,
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel9,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 60.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.onboardTitleModel10,
                                    updateCallback: () => safeSetState(() {}),
                                    child: OnboardTitleWidget(
                                      title:
                                          'We just have a few questions to get to know you better before we can start.',
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel10,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel11,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'How would you qualify the state of your mindset at the moment?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel11,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.stateOfYouMindset ==
                                            'i_have_a_strong_and_resilient_mindset',
                                        buttonText:
                                            'I have a strong and resilient mindset',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.stateOfYouMindset =
                                              'i_have_a_strong_and_resilient_mindset';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel12,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.stateOfYouMindset ==
                                            'it’s_pretty_good_but_could_be_better',
                                        buttonText:
                                            'It’s pretty good but could be better',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.stateOfYouMindset =
                                              'it’s_pretty_good_but_could_be_better';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel13,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.stateOfYouMindset ==
                                            'it_can_be_on_and_off',
                                        buttonText: 'It can be on and off',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.stateOfYouMindset =
                                              'it_can_be_on_and_off';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel14,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.stateOfYouMindset ==
                                            'i_lose_hope_very_quickly',
                                        buttonText: 'I lose hope very quickly',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.stateOfYouMindset =
                                              'i_lose_hope_very_quickly';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel11,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'state_you_mindset_at_the_moment',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list':
                                                functions.stringToList(
                                                    _model.stateOfYouMindset!),
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel12,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'How do you nurture your growth at the moment?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel15,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .nurtureYourGrowthAtTheMoment
                                            .contains(
                                                'reading_books_or_articles'),
                                        buttonText: 'Reading books or articles',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model
                                                  .nurtureYourGrowthAtTheMoment
                                                  .contains(
                                                      'reading_books_or_articles') ==
                                              true) {
                                            _model
                                                .removeFromNurtureYourGrowthAtTheMoment(
                                                    'reading_books_or_articles');
                                            safeSetState(() {});
                                          } else {
                                            _model
                                                .addToNurtureYourGrowthAtTheMoment(
                                                    'reading_books_or_articles');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel16,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .nurtureYourGrowthAtTheMoment
                                            .contains('watch_videos'),
                                        buttonText: 'Watch videos',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model
                                                  .nurtureYourGrowthAtTheMoment
                                                  .contains('watch_videos') ==
                                              true) {
                                            _model
                                                .removeFromNurtureYourGrowthAtTheMoment(
                                                    'watch_videos');
                                            safeSetState(() {});
                                          } else {
                                            _model
                                                .addToNurtureYourGrowthAtTheMoment(
                                                    'watch_videos');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel17,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .nurtureYourGrowthAtTheMoment
                                            .contains('meditation'),
                                        buttonText: 'Meditation',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model
                                                  .nurtureYourGrowthAtTheMoment
                                                  .contains('meditation') ==
                                              true) {
                                            _model
                                                .removeFromNurtureYourGrowthAtTheMoment(
                                                    'meditation');
                                            safeSetState(() {});
                                          } else {
                                            _model
                                                .addToNurtureYourGrowthAtTheMoment(
                                                    'meditation');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel18,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .nurtureYourGrowthAtTheMoment
                                            .contains('coaching_or_therapy'),
                                        buttonText: 'Coaching or therapy',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model
                                                  .nurtureYourGrowthAtTheMoment
                                                  .contains(
                                                      'coaching_or_therapy') ==
                                              true) {
                                            _model
                                                .removeFromNurtureYourGrowthAtTheMoment(
                                                    'coaching_or_therapy');
                                            safeSetState(() {});
                                          } else {
                                            _model
                                                .addToNurtureYourGrowthAtTheMoment(
                                                    'coaching_or_therapy');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel19,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .nurtureYourGrowthAtTheMoment
                                            .contains('use_other_apps'),
                                        buttonText: 'Use other apps',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model
                                                  .nurtureYourGrowthAtTheMoment
                                                  .contains('use_other_apps') ==
                                              true) {
                                            _model
                                                .removeFromNurtureYourGrowthAtTheMoment(
                                                    'use_other_apps');
                                            safeSetState(() {});
                                          } else {
                                            _model
                                                .addToNurtureYourGrowthAtTheMoment(
                                                    'use_other_apps');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel20,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .nurtureYourGrowthAtTheMoment
                                            .contains('i_don’t_do_anything'),
                                        buttonText: 'I don’t do anything',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model
                                                  .nurtureYourGrowthAtTheMoment
                                                  .contains(
                                                      'i_don’t_do_anything') ==
                                              true) {
                                            _model
                                                .removeFromNurtureYourGrowthAtTheMoment(
                                                    'i_don’t_do_anything');
                                            safeSetState(() {});
                                          } else {
                                            _model
                                                .addToNurtureYourGrowthAtTheMoment(
                                                    'i_don’t_do_anything');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel12,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'How_do_you_nurture_your_growth_at_the_moment?',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list': _model
                                                .nurtureYourGrowthAtTheMoment,
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel13,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'What limits your growth the most?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel21,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .limitsYourGrowthTheMost
                                            .contains(
                                                'lack_of_self-confidence'),
                                        buttonText: 'Lack of self-confidence',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model.limitsYourGrowthTheMost
                                                  .contains(
                                                      'lack_of_self-confidence') ==
                                              true) {
                                            _model
                                                .removeFromLimitsYourGrowthTheMost(
                                                    'lack_of_self-confidence');
                                            safeSetState(() {});
                                          } else {
                                            _model.addToLimitsYourGrowthTheMost(
                                                'lack_of_self-confidence');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel22,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .limitsYourGrowthTheMost
                                            .contains('lack_of_motivation'),
                                        buttonText: 'Lack of motivation',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model.limitsYourGrowthTheMost
                                                  .contains(
                                                      'lack_of_motivation') ==
                                              true) {
                                            _model
                                                .removeFromLimitsYourGrowthTheMost(
                                                    'lack_of_motivation');
                                            safeSetState(() {});
                                          } else {
                                            _model.addToLimitsYourGrowthTheMost(
                                                'lack_of_motivation');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel23,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .limitsYourGrowthTheMost
                                            .contains(
                                                'inconsistence_in_efforts'),
                                        buttonText: 'Inconsistence in efforts',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model.limitsYourGrowthTheMost
                                                  .contains(
                                                      'inconsistence_in_efforts') ==
                                              true) {
                                            _model
                                                .removeFromLimitsYourGrowthTheMost(
                                                    'inconsistence_in_efforts');
                                            safeSetState(() {});
                                          } else {
                                            _model.addToLimitsYourGrowthTheMost(
                                                'inconsistence_in_efforts');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel24,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .limitsYourGrowthTheMost
                                            .contains(
                                                'i_put_others_in_priority'),
                                        buttonText: 'I put others in priority',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model.limitsYourGrowthTheMost
                                                  .contains(
                                                      'i_put_others_in_priority') ==
                                              true) {
                                            _model
                                                .removeFromLimitsYourGrowthTheMost(
                                                    'i_put_others_in_priority');
                                            safeSetState(() {});
                                          } else {
                                            _model.addToLimitsYourGrowthTheMost(
                                                'i_put_others_in_priority');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel25,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .limitsYourGrowthTheMost
                                            .contains('i_don’t_have_time'),
                                        buttonText: 'I don’t have time',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model.limitsYourGrowthTheMost
                                                  .contains(
                                                      'i_don’t_have_time') ==
                                              true) {
                                            _model
                                                .removeFromLimitsYourGrowthTheMost(
                                                    'i_don’t_have_time');
                                            safeSetState(() {});
                                          } else {
                                            _model.addToLimitsYourGrowthTheMost(
                                                'i_don’t_have_time');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel26,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                            .limitsYourGrowthTheMost
                                            .contains('nothing'),
                                        buttonText: 'Nothing',
                                        textSize: 20,
                                        onSelect: () async {
                                          if (_model.limitsYourGrowthTheMost
                                                  .contains('nothing') ==
                                              true) {
                                            _model
                                                .removeFromLimitsYourGrowthTheMost(
                                                    'nothing');
                                            safeSetState(() {});
                                          } else {
                                            _model.addToLimitsYourGrowthTheMost(
                                                'nothing');
                                            safeSetState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel13,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'What_limits_your_growth_the_most?',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list':
                                                _model.limitsYourGrowthTheMost,
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel14,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'Do you feel aligned with the person you want to be?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel27,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                                .alignedWithThePersonYouWant ==
                                            'yes_completely',
                                        buttonText: 'Yes completely',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.alignedWithThePersonYouWant =
                                              'yes_completely';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel28,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                                .alignedWithThePersonYouWant ==
                                            'to_some_extent',
                                        buttonText: 'To some extent',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.alignedWithThePersonYouWant =
                                              'to_some_extent';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel29,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                                .alignedWithThePersonYouWant ==
                                            'not_really',
                                        buttonText: 'Not really',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.alignedWithThePersonYouWant =
                                              'not_really';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel30,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                                .alignedWithThePersonYouWant ==
                                            'not_at_all',
                                        buttonText: 'Not at all',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.alignedWithThePersonYouWant =
                                              'not_at_all';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel14,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'Do_you_feel_aligned_with_the_person_you_want_to_be?',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list':
                                                functions.stringToList(_model
                                                    .alignedWithThePersonYouWant!),
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel15,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'Do you have a clear vision of the life you want?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel31,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.clearVisionOfTheLife ==
                                                'absolutely',
                                        buttonText: 'Absolutely',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.clearVisionOfTheLife =
                                              'absolutely';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel32,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.clearVisionOfTheLife ==
                                                'kind_of',
                                        buttonText: 'Kind of',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.clearVisionOfTheLife =
                                              'kind_of';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel33,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.clearVisionOfTheLife ==
                                                'not_really',
                                        buttonText: 'Not really',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.clearVisionOfTheLife =
                                              'not_really';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel15,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'Do_you_have_a_clear_vision_of_the_life_you_want?',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list':
                                                functions.stringToList(_model
                                                    .clearVisionOfTheLife!),
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel16,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'What are the areas of your life where you would like to improve?',
                                      ),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      wrapWithModel(
                                        model: _model.boardButtonModel34,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: BoardButtonWidget(
                                          isSelected: _model
                                              .areasYourLifeLikeToImprove
                                              .contains('family'),
                                          buttonText: 'Family',
                                          textSize: 20,
                                          onSelect: () async {
                                            if (_model
                                                    .areasYourLifeLikeToImprove
                                                    .contains('family') ==
                                                true) {
                                              _model
                                                  .removeFromAreasYourLifeLikeToImprove(
                                                      'family');
                                              safeSetState(() {});
                                            } else {
                                              _model
                                                  .addToAreasYourLifeLikeToImprove(
                                                      'family');
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.boardButtonModel35,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: BoardButtonWidget(
                                          isSelected: _model
                                              .areasYourLifeLikeToImprove
                                              .contains('relationships'),
                                          buttonText: 'Relationships',
                                          textSize: 20,
                                          onSelect: () async {
                                            if (_model
                                                    .areasYourLifeLikeToImprove
                                                    .contains('friends') ==
                                                true) {
                                              _model
                                                  .removeFromAreasYourLifeLikeToImprove(
                                                      'relationships');
                                              safeSetState(() {});
                                            } else {
                                              _model
                                                  .addToAreasYourLifeLikeToImprove(
                                                      'relationships');
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.boardButtonModel36,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: BoardButtonWidget(
                                          isSelected: _model
                                              .areasYourLifeLikeToImprove
                                              .contains('work'),
                                          buttonText: 'Work',
                                          textSize: 20,
                                          onSelect: () async {
                                            if (_model
                                                    .areasYourLifeLikeToImprove
                                                    .contains('work') ==
                                                true) {
                                              _model
                                                  .removeFromAreasYourLifeLikeToImprove(
                                                      'work');
                                              safeSetState(() {});
                                            } else {
                                              _model
                                                  .addToAreasYourLifeLikeToImprove(
                                                      'work');
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.boardButtonModel37,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: BoardButtonWidget(
                                          isSelected: _model
                                              .areasYourLifeLikeToImprove
                                              .contains('fitness'),
                                          buttonText: 'Fitness',
                                          textSize: 20,
                                          onSelect: () async {
                                            if (_model
                                                    .areasYourLifeLikeToImprove
                                                    .contains('fitness') ==
                                                true) {
                                              _model
                                                  .removeFromAreasYourLifeLikeToImprove(
                                                      'fitness');
                                              safeSetState(() {});
                                            } else {
                                              _model
                                                  .addToAreasYourLifeLikeToImprove(
                                                      'fitness');
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.boardButtonModel38,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: BoardButtonWidget(
                                          isSelected: _model
                                              .areasYourLifeLikeToImprove
                                              .contains('spirituality'),
                                          buttonText: 'Spirituality',
                                          textSize: 20,
                                          onSelect: () async {
                                            if (_model
                                                    .areasYourLifeLikeToImprove
                                                    .contains('spirituality') ==
                                                true) {
                                              _model
                                                  .removeFromAreasYourLifeLikeToImprove(
                                                      'spirituality');
                                              safeSetState(() {});
                                            } else {
                                              _model
                                                  .addToAreasYourLifeLikeToImprove(
                                                      'spirituality');
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.boardButtonModel39,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: BoardButtonWidget(
                                          isSelected: _model
                                              .areasYourLifeLikeToImprove
                                              .contains('relaxation'),
                                          buttonText: 'Relaxation',
                                          textSize: 20,
                                          onSelect: () async {
                                            if (_model
                                                    .areasYourLifeLikeToImprove
                                                    .contains('relaxation') ==
                                                true) {
                                              _model
                                                  .removeFromAreasYourLifeLikeToImprove(
                                                      'relaxation');
                                              safeSetState(() {});
                                            } else {
                                              _model
                                                  .addToAreasYourLifeLikeToImprove(
                                                      'relaxation');
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.boardButtonModel40,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: BoardButtonWidget(
                                          isSelected: _model
                                              .areasYourLifeLikeToImprove
                                              .contains('ecology'),
                                          buttonText: 'Ecology',
                                          textSize: 20,
                                          onSelect: () async {
                                            if (_model
                                                    .areasYourLifeLikeToImprove
                                                    .contains('ecology') ==
                                                true) {
                                              _model
                                                  .removeFromAreasYourLifeLikeToImprove(
                                                      'ecology');
                                              safeSetState(() {});
                                            } else {
                                              _model
                                                  .addToAreasYourLifeLikeToImprove(
                                                      'ecology');
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 20.0)),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel16,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'What_are_the_areas_of_your_life_where_you_would_like_to_improve?',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list': _model
                                                .areasYourLifeLikeToImprove,
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel17,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'How motivated have you been feeling lately?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel41,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.yourMotivationRecently ==
                                                'amazing',
                                        buttonText: 'Amazing',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.yourMotivationRecently =
                                              'amazing';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel42,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.yourMotivationRecently ==
                                                'pretty_good',
                                        buttonText: 'Pretty good',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.yourMotivationRecently =
                                              'pretty_good';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel43,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.yourMotivationRecently ==
                                                'up_and_down',
                                        buttonText: 'Up and down',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.yourMotivationRecently =
                                              'up_and_down';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel44,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.yourMotivationRecently ==
                                                'struggling_a_lot',
                                        buttonText: 'Struggling a lot',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.yourMotivationRecently =
                                              'struggling_a_lot';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel17,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'How_was_your_motivation_recently?',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list':
                                                functions.stringToList(_model
                                                    .yourMotivationRecently!),
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel18,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'What quality do you want to develop?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel45,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.definesYouWouldLikeToBe ==
                                                'driven',
                                        buttonText: 'Driven',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.definesYouWouldLikeToBe =
                                              'driven';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel46,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.definesYouWouldLikeToBe ==
                                                'peaceful',
                                        buttonText: 'Peaceful',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.definesYouWouldLikeToBe =
                                              'peaceful';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel47,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.definesYouWouldLikeToBe ==
                                                'confident',
                                        buttonText: 'Confident',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.definesYouWouldLikeToBe =
                                              'confident';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel48,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.definesYouWouldLikeToBe ==
                                                'grateful',
                                        buttonText: 'Grateful',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.definesYouWouldLikeToBe =
                                              'grateful';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel49,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.definesYouWouldLikeToBe ==
                                                'kind',
                                        buttonText: 'Kind',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.definesYouWouldLikeToBe =
                                              'kind';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel50,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.definesYouWouldLikeToBe ==
                                                'authentic',
                                        buttonText: 'Authentic',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.definesYouWouldLikeToBe =
                                              'authentic';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel18,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'What_defines_best_the_person_you_would_like_to_be?',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list':
                                                functions.stringToList(_model
                                                    .definesYouWouldLikeToBe!),
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel19,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'Are you actively working on your mindset already?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel51,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                                .triedToBuildResilientMindset ==
                                            'yes',
                                        buttonText: 'Yes',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.triedToBuildResilientMindset =
                                              'yes';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel52,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model
                                                .triedToBuildResilientMindset ==
                                            'not_yet',
                                        buttonText: 'Not yet',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.triedToBuildResilientMindset =
                                              'not_yet';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel19,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'Have_you_tried_to_build_a_more_resilient_mindset_in_the_past?',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list':
                                                functions.stringToList(_model
                                                    .triedToBuildResilientMindset!),
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel20,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'Do you believe a good mindset is key to success?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel53,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.godMindset == 'yes',
                                        buttonText: 'Yes',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.godMindset = 'yes';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel54,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.godMindset == 'not_really',
                                        buttonText: 'Not really',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.godMindset = 'not_really';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel20,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'Would_you_agree_that_a_god _indset is your_number_one_driver_of_success??',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list':
                                                functions.stringToList(
                                                    _model.godMindset!),
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel21,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'Do you believe that consistency matters more than motivation?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel55,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.consistencyOrMotivation ==
                                                'yes',
                                        buttonText: 'Yes',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.consistencyOrMotivation =
                                              'yes';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel56,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected:
                                            _model.consistencyOrMotivation ==
                                                'not_really',
                                        buttonText: 'Not really',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.consistencyOrMotivation =
                                              'not_really';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel21,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'Do_you_believe_that_consistency_matters_more_than_motivation?',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list':
                                                functions.stringToList(_model
                                                    .consistencyOrMotivation!),
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel22,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title:
                                            'Is there any particular goal you’d like to achieve right now?',
                                      ),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _model.textController2,
                                  focusNode: _model.textFieldFocusNode2,
                                  autofocus: false,
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Grift',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'shwkiizb' /* Type here... */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Grift',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Grift',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                  textAlign: TextAlign.center,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                  inputFormatters: [
                                    if (!isAndroid && !isiOS)
                                      TextInputFormatter.withFunction(
                                          (oldValue, newValue) {
                                        return TextEditingValue(
                                          selection: newValue.selection,
                                          text: newValue.text.toCapitalization(
                                              TextCapitalization.words),
                                        );
                                      }),
                                  ],
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel22,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await actions.hideKeyboardAction(
                                        context,
                                      );

                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question:
                                              'Is_there_any_particular_goal_you’d_like_to_achieve_right_now?',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list':
                                                functions.stringToList(_model
                                                    .textController2.text),
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel23,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title: 'How old are you?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel57,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.yearsOld == '13-17',
                                        buttonText: '13-17',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.yearsOld = '13-17';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel58,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.yearsOld == '18-24',
                                        buttonText: '18-24',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.yearsOld = '18-24';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel59,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.yearsOld == '25-34',
                                        buttonText: '25-34',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.yearsOld = '25-34';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel60,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.yearsOld == '35-44',
                                        buttonText: '35-44',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.yearsOld = '35-44';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel61,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.yearsOld == '45-54',
                                        buttonText: '45-54',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.yearsOld = '45-54';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel62,
                                      updateCallback: () => safeSetState(() {}),
                                      child: BoardButtonWidget(
                                        isSelected: _model.yearsOld == '55+',
                                        buttonText: '55+',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.yearsOld = '55+';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel23,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question: 'how_old_are_you',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list': functions
                                                .stringToList(_model.yearsOld!),
                                          },
                                        ),
                                      });

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        ageGroup: _model.yearsOld,
                                      ));
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel24,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: OnboardTitleWidget(
                                        title: 'What’s your gender?',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.boardButtonModel63,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: BoardButtonWidget(
                                        isSelected: _model.gender == 'male',
                                        buttonText: 'Male',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.gender = 'male';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel64,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: BoardButtonWidget(
                                        isSelected: _model.gender == 'female',
                                        buttonText: 'Female',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.gender = 'female';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.boardButtonModel65,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: BoardButtonWidget(
                                        isSelected: _model.gender == 'other',
                                        buttonText: 'Other',
                                        textSize: 20,
                                        onSelect: () async {
                                          _model.gender = 'other';
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel24,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: NextButtonWidget(
                                    title: 'Continue',
                                    onTab: () async {
                                      await OnboardingQuestionsRecord.collection
                                          .doc()
                                          .set({
                                        ...createOnboardingQuestionsRecordData(
                                          user: currentUserReference,
                                          question: 'what_gender_are_you',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'answer_list': functions
                                                .stringToList(_model.gender!),
                                          },
                                        ),
                                      });
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardTitleModel25,
                                      updateCallback: () => safeSetState(() {}),
                                      child: OnboardTitleWidget(
                                        title: 'Personalising your experience',
                                      ),
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.loadWithTimerModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: LoadWithTimerWidget(
                                    onInit: () async {
                                      await Future.delayed(
                                        Duration(
                                          milliseconds: 4000,
                                        ),
                                      );
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: 1.0,
                                  height: 1.0,
                                  decoration: BoxDecoration(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => wrapWithModel(
                                        model: _model.onboardTitleModel26,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: OnboardTitleWidget(
                                          title:
                                              'Congrats, ${currentUserDisplayName}, you are part of the Becomers  community! ${(String var1) {
                                            return var1 = '\n \n';
                                          }('')}Are you ready to adopt a life-changing mindset?',
                                          center: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.nextButtonModel25,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NextButtonWidget(
                                    title: 'Let\'s Become',
                                    onTab: () async {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        onboardingIsCompleted: true,
                                      ));

                                      context.pushNamed(
                                        PaywallWidget.routeName,
                                        queryParameters: {
                                          'isOnboarding': serializeParam(
                                            true,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
