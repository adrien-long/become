import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'loading_journal_model.dart';
export 'loading_journal_model.dart';

class LoadingJournalWidget extends StatefulWidget {
  const LoadingJournalWidget({super.key});

  @override
  State<LoadingJournalWidget> createState() => _LoadingJournalWidgetState();
}

class _LoadingJournalWidgetState extends State<LoadingJournalWidget>
    with TickerProviderStateMixin {
  late LoadingJournalModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingJournalModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<JournalEntriesRecord>>(
        stream: queryJournalEntriesRecord(
          queryBuilder: (journalEntriesRecord) => journalEntriesRecord.where(
            'journal',
            isEqualTo: currentUserDocument?.activeJournal,
          ),
        ),
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
          List<JournalEntriesRecord> listViewJournalEntriesRecordList =
              snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listViewJournalEntriesRecordList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewJournalEntriesRecord =
                  listViewJournalEntriesRecordList[listViewIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 5.0, 30.0, 5.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      EditJournalEntryWidget.routeName,
                      queryParameters: {
                        'isOnboarding': serializeParam(
                          false,
                          ParamType.bool,
                        ),
                        'journalEntry': serializeParam(
                          listViewJournalEntriesRecord.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  onDoubleTap: () async {
                    context.pushNamed(
                      EditJournalEntryWidget.routeName,
                      queryParameters: {
                        'isOnboarding': serializeParam(
                          false,
                          ParamType.bool,
                        ),
                        'journalEntry': serializeParam(
                          listViewJournalEntriesRecord.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  onLongPress: () async {
                    context.pushNamed(
                      EditJournalEntryWidget.routeName,
                      queryParameters: {
                        'isOnboarding': serializeParam(
                          false,
                          ParamType.bool,
                        ),
                        'journalEntry': serializeParam(
                          listViewJournalEntriesRecord.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFDEDEDE),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x18D5D5D5),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100.0,
                              height: 23.6,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: 177.5,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!),
              );
            },
          );
        },
      ),
    );
  }
}
