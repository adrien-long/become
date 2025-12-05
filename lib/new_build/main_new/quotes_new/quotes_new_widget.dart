import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/feedback_sheet/feedback_sheet_widget.dart';
import '/components/quotations_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/image_asset/image_asset_widget.dart';
import '/new_build/main_new/component/nav_buttons/nav_buttons_widget.dart';
import '/new_build/sheets/background_images_sheet_new/background_images_sheet_new_widget.dart';
import '/new_build/sheets/category_sheet/category_sheet_widget.dart';
import '/new_build/sheets/quotes_liked_sheet/quotes_liked_sheet_widget.dart';
import '/new_build/sheets/wal_sheet/wal_sheet_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'quotes_new_model.dart';
export 'quotes_new_model.dart';

class QuotesNewWidget extends StatefulWidget {
  const QuotesNewWidget({super.key});

  static String routeName = 'QuotesNew';
  static String routePath = '/quotesNew';

  @override
  State<QuotesNewWidget> createState() => _QuotesNewWidgetState();
}

class _QuotesNewWidgetState extends State<QuotesNewWidget> {
  late QuotesNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuotesNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setAppLanguage(context, 'en');
      if ((valueOrDefault<bool>(
                  currentUserDocument?.onboardingIsCompleted, false) ==
              false) &&
          !FFAppState().askedRestartOnboarding) {
        var confirmDialogResponse = await showDialog<bool>(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('Set Up Your App'),
                  content: Text(
                      'Complete the quick onboarding to personalize your experience.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, false),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, true),
                      child: Text('Yes'),
                    ),
                  ],
                );
              },
            ) ??
            false;
        if (confirmDialogResponse) {
          context.pushNamed(IntroPageWidget.routeName);
        } else {
          FFAppState().askedRestartOnboarding = true;
          safeSetState(() {});
        }
      }
      if (FFAppState().selectedCategories.length == 0) {
        FFAppState()
            .addToSelectedCategories(FFAppState().Categories.firstOrNull!);
        safeSetState(() {});
      }
      _model.activeQuote = await queryQuotationsRecordOnce(
        queryBuilder: (quotationsRecord) => quotationsRecord.whereIn(
            'category', FFAppState().Categories.map((e) => e.title).toList()),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (!((revenue_cat.activeEntitlementIds.length == 0) &&
          (FFAppState().isCheckInPayWall == false))) {
        _model.isEnabled = await actions.checkNotificationsEnabled();
        if (!_model.isEnabled!) {}
      }

      await currentUserReference!.update({
        ...mapToFirestore(
          {
            'last_visit': FieldValue.serverTimestamp(),
          },
        ),
      });
      await Future.delayed(
        Duration(
          milliseconds: 2000,
        ),
      );
      if (valueOrDefault<bool>(currentUserDocument?.requestFeedback, false) ==
          true) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  child: FeedbackSheetWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
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
      stream: _model.quotesList(
        requestFn: () => queryQuotationsRecord(),
      ),
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
        List<QuotationsRecord> quotesNewQuotationsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                wrapWithModel(
                  model: _model.imageAssetModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: ImageAssetWidget(
                    number: FFAppState().currentSettins.imageNumber,
                    borderRadius: 0.0,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 40.0, 25.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 80.0,
                              decoration: BoxDecoration(),
                            ),
                            Flexible(
                              child: wrapWithModel(
                                model: _model.navButtonsModel,
                                updateCallback: () => safeSetState(() {}),
                                child: NavButtonsWidget(
                                  onWal: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: WalSheetWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  onLiked: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: QuotesLikedSheetWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.quoteIndex = value));

                                    safeSetState(() {});
                                  },
                                  onCategories: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: CategorySheetWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (revenue_cat.activeEntitlementIds.length == 0)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (valueOrDefault<bool>(
                                      revenue_cat.activeEntitlementIds.length ==
                                          0,
                                      false,
                                    ) &&
                                    responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      HapticFeedback.mediumImpact();

                                      context
                                          .pushNamed(PaywallWidget.routeName);
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '4o060sf8' /* Click here to activate your su... */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Satoshi',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if ((valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.onboardingIsCompleted,
                                            false) ==
                                        false) &&
                                    responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                  AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        HapticFeedback.mediumImpact();

                                        context.pushNamed(
                                            IntroPageWidget.routeName);
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'czi1mw3l' /* Click here to complete the onb... */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Satoshi',
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
                      wrapWithModel(
                        model: _model.quotationsViewModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: QuotationsViewWidget(
                          quotationsList: functions.filteredQuotations(
                              quotesNewQuotationsRecordList.toList(),
                              functions
                                  .listCategoryName(
                                      FFAppState().selectedCategories.toList())
                                  .toList(),
                              revenue_cat.activeEntitlementIds.length != 0,
                              functions
                                  .allFreeCategories(
                                      FFAppState().Categories.toList())
                                  .toList()),
                          onInit: () async {},
                          onSwap: (quoteCurrent) async {
                            HapticFeedback.lightImpact();
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 22.0, 22.0),
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
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.9,
                                        child: BackgroundImagesSheetNewWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.palette,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
