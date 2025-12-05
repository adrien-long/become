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
import 'intro_g_model.dart';
export 'intro_g_model.dart';

/// Create a simple page that will ask one question to the user.
///
/// The user will have to type the answer. It should be an average text (2,3
/// sentences max)
class IntroGWidget extends StatefulWidget {
  const IntroGWidget({super.key});

  static String routeName = 'IntroG';
  static String routePath = '/introG';

  @override
  State<IntroGWidget> createState() => _IntroGWidgetState();
}

class _IntroGWidgetState extends State<IntroGWidget> {
  late IntroGModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroGModel());

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
                        'cemvlo2t' /* Why do you think motivation fa... */,
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
                                .contains('lack_of_clear_goals') ==
                            true) {
                          _model.removeFromSelectedFields(
                              'losing_excitement_over_time');
                          safeSetState(() {});
                        } else {
                          _model.addToSelectedFields('lack_of_clear_goals');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: _model.selectedFields
                                  .contains('lack_of_clear_goals')
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields
                                    .contains('lack_of_clear_goals')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'b90xnct6' /* Lack of clear goals */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields
                                          .contains('lack_of_clear_goals')
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
                                .contains('no_visible_progress') ==
                            true) {
                          _model
                              .removeFromSelectedFields('no_visible_progress');
                          safeSetState(() {});
                        } else {
                          _model.addToSelectedFields('no_visible_progress');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: _model.selectedFields
                                  .contains('no_visible_progress')
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields
                                    .contains('no_visible_progress')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'w2vcy9lr' /* No visible progress */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields
                                          .contains('no_visible_progress')
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
                                'lack_of_support_or_accountability') ==
                            true) {
                          _model.removeFromSelectedFields(
                              'lack_of_support_or_accountability');
                          safeSetState(() {});
                        } else {
                          _model.addToSelectedFields(
                              'lack_of_support_or_accountability');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: _model.selectedFields
                                  .contains('lack_of_support_or_accountability')
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields.contains(
                                    'lack_of_support_or_accountability')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '5p7sqj9l' /* Lack of support or accountabil... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields.contains(
                                          'lack_of_support_or_accountability')
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
                        if (_model.selectedFields.contains('fear_of_failure') ==
                            true) {
                          _model.removeFromSelectedFields('fear_of_failure');
                          safeSetState(() {});
                        } else {
                          _model.addToSelectedFields('fear_of_failure');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              _model.selectedFields.contains('fear_of_failure')
                                  ? FlutterFlowTheme.of(context).secondary
                                  : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields
                                    .contains('fear_of_failure')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ugktcokh' /* Fear of failure */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields
                                          .contains('fear_of_failure')
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
                        if (_model.selectedFields.contains('im_too_busy') ==
                            true) {
                          _model.removeFromSelectedFields('im_too_busy');
                          safeSetState(() {});
                        } else {
                          _model.addToSelectedFields('im_too_busy');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: _model.selectedFields.contains('im_too_busy')
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields.contains('im_too_busy')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'u0xupj9w' /* I’m too busy / not enough time */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields
                                          .contains('im_too_busy')
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
                                .contains('losing_excitement_over_time') ==
                            true) {
                          _model.removeFromSelectedFields(
                              'losing_excitement_over_time');
                          safeSetState(() {});
                        } else {
                          _model.addToSelectedFields(
                              'losing_excitement_over_time');
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: _model.selectedFields
                                  .contains('losing_excitement_over_time')
                              ? FlutterFlowTheme.of(context).secondary
                              : Color(0x00000000),
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: _model.selectedFields
                                    .contains('losing_excitement_over_time')
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'qhpnwovm' /* Losing excitement over time */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: _model.selectedFields.contains(
                                          'losing_excitement_over_time')
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
                          question: 'why_do_you_think_motivation_fades?',
                        ),
                        ...mapToFirestore(
                          {
                            'answer_list': _model.selectedFields,
                          },
                        ),
                      });

                      context.pushNamed(IntroHWidget.routeName);
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
                            '44kolecd' /* Next */,
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
