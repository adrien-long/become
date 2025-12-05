import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_journal_entry_model.dart';
export 'edit_journal_entry_model.dart';

/// Create a simple page that will ask one question to the user.
///
/// The user will have to type the answer. It should be an average text (2,3
/// sentences max)
class EditJournalEntryWidget extends StatefulWidget {
  const EditJournalEntryWidget({
    super.key,
    bool? isOnboarding,
    required this.journalEntry,
  }) : this.isOnboarding = isOnboarding ?? false;

  final bool isOnboarding;
  final DocumentReference? journalEntry;

  static String routeName = 'EditJournalEntry';
  static String routePath = '/editJournalEntry';

  @override
  State<EditJournalEntryWidget> createState() => _EditJournalEntryWidgetState();
}

class _EditJournalEntryWidgetState extends State<EditJournalEntryWidget> {
  late EditJournalEntryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditJournalEntryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isOnboarding == true) {
        await actions.saveOnboardingCheckpointAuto(
          context,
        );
      }
    });

    _model.textFieldFocusNode ??= FocusNode();
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
        body: Padding(
          padding: EdgeInsets.all(24.0),
          child: StreamBuilder<JournalEntriesRecord>(
            stream: JournalEntriesRecord.getDocument(widget.journalEntry!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }

              final containerJournalEntriesRecord = snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: StreamBuilder<QuestionsRecord>(
                  stream: QuestionsRecord.getDocument(
                      containerJournalEntriesRecord.questionRef!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }

                    final columnQuestionsRecord = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 60.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              columnQuestionsRecord.description
                                  .where((e) =>
                                      e.languageCode ==
                                      FFLocalizations.of(context).languageCode)
                                  .toList()
                                  .firstOrNull
                                  ?.content,
                              'This is the question',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  font: GoogleFonts.nothingYouCouldDo(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 20.0),
                          child: TextFormField(
                            controller: _model.textController ??=
                                TextEditingController(
                              text: containerJournalEntriesRecord.answer,
                            ),
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                '3j1gmy9o' /* Type here... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.crimsonPro(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            textAlign: TextAlign.center,
                            maxLines: 4,
                            minLines: 3,
                            maxLength: 200,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            keyboardType: TextInputType.multiline,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              if (!isAndroid && !isiOS)
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  return TextEditingValue(
                                    selection: newValue.selection,
                                    text: newValue.text.toCapitalization(
                                        TextCapitalization.sentences),
                                  );
                                }),
                            ],
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await containerJournalEntriesRecord.reference
                                .update(createJournalEntriesRecordData(
                              answer: _model.textController.text,
                              question: valueOrDefault<String>(
                                columnQuestionsRecord.description
                                    .where((e) =>
                                        e.languageCode ==
                                        FFLocalizations.of(context)
                                            .languageCode)
                                    .toList()
                                    .firstOrNull
                                    ?.content,
                                'This is the question',
                              ),
                            ));
                            await actions.summarizeAndSaveJournal(
                              currentUserReference!,
                            );
                            if (widget.isOnboarding) {
                              if (columnQuestionsRecord.onboardingOrder >=
                                  FFAppConstants.questionsForOnboarding) {
                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed(QuotesNewWidget.routeName);
                              } else {
                                _model.newJournalEntry =
                                    await actions.createJournalEntryFromNumber(
                                  columnQuestionsRecord.onboardingOrder,
                                  currentUserDocument!.activeJournal!,
                                );

                                context.goNamed(
                                  EditJournalEntryWidget.routeName,
                                  queryParameters: {
                                    'isOnboarding': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'journalEntry': serializeParam(
                                      _model.newJournalEntry,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              }
                            } else {
                              context.pushNamed(QuotesNewWidget.routeName);
                            }

                            await actions.summarizeAndSaveJournal(
                              currentUserReference!,
                            );

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '6hsvscql' /* Submit */,
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        if (!widget.isOnboarding)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'n4g5iuf6' /* Back */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Satoshi',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
