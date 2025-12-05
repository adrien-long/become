import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'intro_a_model.dart';
export 'intro_a_model.dart';

/// Create a simple page that will ask one question to the user.
///
/// The user will have to type the answer. It should be an average text (2,3
/// sentences max)
class IntroAWidget extends StatefulWidget {
  const IntroAWidget({super.key});

  static String routeName = 'IntroA';
  static String routePath = '/introA';

  @override
  State<IntroAWidget> createState() => _IntroAWidgetState();
}

class _IntroAWidgetState extends State<IntroAWidget>
    with TickerProviderStateMixin {
  late IntroAModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroAModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
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
              fit: BoxFit.fitWidth,
              image: Image.asset(
                'assets/images/Welcome.png',
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Group_32.png',
                      width: 235.7,
                      height: 79.8,
                      fit: BoxFit.fitWidth,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: FFButtonWidget(
                      onPressed: () async {
                        HapticFeedback.heavyImpact();
                        GoRouter.of(context).prepareAuthEvent();
                        final user =
                            await authManager.signInAnonymously(context);
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
                              'created_at': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        _model.journal = JournalRecord.getDocumentFromData({
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
                          activeJournal: _model.journal?.reference,
                          languageCode:
                              FFLocalizations.of(context).languageCode,
                        ));

                        await QuotesRecord.collection.doc().set({
                          ...createQuotesRecordData(
                            content: 'You are stronger than you think',
                            user: currentUserReference,
                            isFavorited: false,
                            createdBy: 'intro_quote',
                            isPublic: false,
                            isApproved: false,
                            isDeleted: false,
                          ),
                          ...mapToFirestore(
                            {
                              'created_at': FieldValue.serverTimestamp(),
                            },
                          ),
                        });

                        context.pushNamedAuth(
                            IntroBWidget.routeName, context.mounted);

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        '8aeujk58' /* Get Started */,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['buttonOnPageLoadAnimation']!),
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
