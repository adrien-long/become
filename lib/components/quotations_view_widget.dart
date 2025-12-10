import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/heart_toggle/heart_toggle_widget.dart';
import '/new_build/sheets/screenshot_bottom_sheet_new/screenshot_bottom_sheet_new_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quotations_view_model.dart';
export 'quotations_view_model.dart';

class QuotationsViewWidget extends StatefulWidget {
  const QuotationsViewWidget({
    super.key,
    required this.quotationsList,
    required this.onInit,
    required this.onSwap,
  });

  final List<QuotationsRecord>? quotationsList;
  final Future Function()? onInit;
  final Future Function(DocumentReference quoteCurrent)? onSwap;

  @override
  State<QuotationsViewWidget> createState() => _QuotationsViewWidgetState();
}

class _QuotationsViewWidgetState extends State<QuotationsViewWidget> {
  late QuotationsViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuotationsViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.onInit?.call();
      _model.ref = widget.quotationsList?.firstOrNull?.reference;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Builder(
            builder: (context) {
              final allquotes = widget.quotationsList!.toList();

              return Container(
                height: MediaQuery.sizeOf(context).height * 0.55,
                child: PageView.builder(
                  controller: _model.pageViewController ??= PageController(
                      initialPage: max(0, min(0, allquotes.length - 1))),
                  onPageChanged: (_) async {
                    HapticFeedback.mediumImpact();
                    await widget.onSwap?.call(
                      widget.quotationsList!
                          .elementAtOrNull(_model.pageViewCurrentIndex)!
                          .reference,
                    );
                    _model.ref = widget.quotationsList
                        ?.elementAtOrNull(_model.pageViewCurrentIndex)
                        ?.reference;
                    safeSetState(() {});
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: allquotes.length,
                  itemBuilder: (context, allquotesIndex) {
                    final allquotesItem = allquotes[allquotesIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {},
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Text(
                                  '${allquotesItem.content}',
                                  textAlign: TextAlign.center,
                                  maxLines: 10,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Grift',
                                        color:
                                            FFAppState().currentSettins.color,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: Icon(
                                          FFIcons.knone,
                                          color:
                                              FFAppState().currentSettins.color,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'qqwfg903' /* Become */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font:
                                                  GoogleFonts.nothingYouCouldDo(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: FFAppState()
                                                  .currentSettins
                                                  .color,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => wrapWithModel(
                          model: _model.heartToggleModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HeartToggleWidget(
                            isLiked: (currentUserDocument?.likedQuotations
                                        .toList() ??
                                    [])
                                .contains(widget.quotationsList
                                    ?.elementAtOrNull(
                                        _model.pageViewCurrentIndex)
                                    ?.reference),
                            color: FFAppState().currentSettins.color!,
                            onToggle: () async {
                              HapticFeedback.lightImpact();
                              if ((currentUserDocument?.likedQuotations
                                              .toList() ??
                                          [])
                                      .contains(widget.quotationsList
                                          ?.elementAtOrNull(
                                              _model.pageViewCurrentIndex)
                                          ?.reference) ==
                                  false) {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'liked_quotations':
                                          FieldValue.arrayUnion([
                                        widget.quotationsList
                                            ?.elementAtOrNull(
                                                _model.pageViewCurrentIndex)
                                            ?.reference
                                      ]),
                                    },
                                  ),
                                });
                              } else {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'liked_quotations':
                                          FieldValue.arrayRemove([
                                        widget.quotationsList
                                            ?.elementAtOrNull(
                                                _model.pageViewCurrentIndex)
                                            ?.reference
                                      ]),
                                    },
                                  ),
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                HapticFeedback.mediumImpact();
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ScreenshotBottomSheetNewWidget(
                                        quotation: (widget.quotationsList!
                                            .elementAtOrNull(
                                                _model.pageViewCurrentIndex))!,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: FaIcon(
                                FontAwesomeIcons.share,
                                color: FFAppState().currentSettins.color,
                                size: 36.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
