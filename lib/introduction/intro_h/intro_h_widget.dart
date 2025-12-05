import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'intro_h_model.dart';
export 'intro_h_model.dart';

/// Create a simple page that will ask one question to the user.
///
/// The user will have to type the answer. It should be an average text (2,3
/// sentences max)
class IntroHWidget extends StatefulWidget {
  const IntroHWidget({super.key});

  static String routeName = 'IntroH';
  static String routePath = '/introH';

  @override
  State<IntroHWidget> createState() => _IntroHWidgetState();
}

class _IntroHWidgetState extends State<IntroHWidget> {
  late IntroHModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroHModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.saveOnboardingCheckpointAuto(
        context,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Group_70.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'usf5nuh7' /* What do you think would help y... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.nothingYouCouldDo(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 26.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.selectedFields
                                .contains('motivation_messages') ==
                            true) {
                          _model
                              .removeFromSelectedFields('motivation_messages');
                          safeSetState(() {});
                        } else {
                          _model.addToSelectedFields('motivation_messages');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: _model.selectedFields
                                  .contains('motivation_messages')
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields
                                    .contains('motivation_messages')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'iwcdl6xo' /* Motivation messages */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields
                                          .contains('motivation_messages')
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.selectedFields
                                .contains('daily_reminders_check_ins') ==
                            true) {
                          _model.removeFromSelectedFields(
                              'daily_reminders_check_ins');
                          safeSetState(() {});
                        } else {
                          _model
                              .addToSelectedFields('daily_reminders_check_ins');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: _model.selectedFields
                                  .contains('daily_reminders_check_ins')
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields
                                    .contains('daily_reminders_check_ins')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '04i1aq4l' /*  Daily reminders / check-ins */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields
                                          .contains('daily_reminders_check_ins')
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.selectedFields
                                .contains('inspiring_success_stories') ==
                            true) {
                          _model.removeFromSelectedFields(
                              'inspiring_success_stories');
                          safeSetState(() {});
                        } else {
                          _model
                              .addToSelectedFields('inspiring_success_stories');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: _model.selectedFields
                                  .contains('inspiring_success_stories')
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields
                                    .contains('inspiring_success_stories')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ifdkvfvc' /* Inspiring success stories */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields
                                          .contains('inspiring_success_stories')
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.selectedFields.contains(
                                'positive_self_talk_&_mindset_tips') ==
                            true) {
                          _model.removeFromSelectedFields(
                              'positive_self_talk_&_mindset_tips');
                          safeSetState(() {});
                        } else {
                          _model.addToSelectedFields(
                              'positive_self_talk_&_mindset_tips');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: _model.selectedFields
                                  .contains('positive_self_talk_&_mindset_tips')
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields.contains(
                                    'positive_self_talk_&_mindset_tips')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '08njty1t' /* Positive self-talk & mindset t... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields.contains(
                                          'positive_self_talk_&_mindset_tips')
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.selectedFields
                                .contains('reflect_on_wins_and_defeats') ==
                            true) {
                          _model.removeFromSelectedFields(
                              'reflect_on_wins_and_defeats');
                          safeSetState(() {});
                        } else {
                          _model.addToSelectedFields(
                              'reflect_on_wins_and_defeats');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: _model.selectedFields
                                  .contains('reflect_on_wins_and_defeats')
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields
                                    .contains('reflect_on_wins_and_defeats')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'dd4gj5pm' /* Reflect on wins and defeats / ... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields.contains(
                                          'reflect_on_wins_and_defeats')
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.selectedFields
                                .contains('having_an_accountability_partner') ==
                            true) {
                          _model.removeFromSelectedFields(
                              'having_an_accountability_partner');
                          safeSetState(() {});
                        } else {
                          _model.addToSelectedFields(
                              'having_an_accountability_partner');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: _model.selectedFields
                                  .contains('having_an_accountability_partner')
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields.contains(
                                    'having_an_accountability_partner')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'rzulzucr' /* Having an accountability partn... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields.contains(
                                          'having_an_accountability_partner')
                                      ? FlutterFlowTheme.of(context)
                                          .primaryBackground
                                      : FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '846xuzlg' /* *An accountability partner is ... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      HapticFeedback.mediumImpact();

                      await OnboardingQuestionsRecord.collection.doc().set({
                        ...createOnboardingQuestionsRecordData(
                          user: currentUserReference,
                          question:
                              'what_do_you_think_would_help_you_the_most?',
                        ),
                        ...mapToFirestore(
                          {
                            'answer_list': _model.selectedFields,
                          },
                        ),
                      });

                      context.pushNamed(IntroIWidget.routeName);
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x332D2D2D),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'l7jor04o' /* Next */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
