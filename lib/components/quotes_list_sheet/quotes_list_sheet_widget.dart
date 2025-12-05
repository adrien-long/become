import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/history_list_item/history_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quotes_list_sheet_model.dart';
export 'quotes_list_sheet_model.dart';

class QuotesListSheetWidget extends StatefulWidget {
  const QuotesListSheetWidget({super.key});

  @override
  State<QuotesListSheetWidget> createState() => _QuotesListSheetWidgetState();
}

class _QuotesListSheetWidgetState extends State<QuotesListSheetWidget> {
  late QuotesListSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuotesListSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuotesRecord>>(
      stream: queryQuotesRecord(
        queryBuilder: (quotesRecord) => quotesRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .where(
              'is_deleted',
              isEqualTo: false,
            )
            .where(
              'is_favorited',
              isEqualTo: _model.favoritesFilterValue,
            )
            .orderBy('created_at', descending: true),
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
        List<QuotesRecord> containerQuotesRecordList = snapshot.data!;

        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 0.9,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Container(
                  width: 40.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFC9C9C9),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        HapticFeedback.mediumImpact();
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ff1hkc29' /* History */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.crimsonPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ToggleIcon(
                          onPressed: () async {
                            safeSetState(() =>
                                _model.favoriteToggle = !_model.favoriteToggle);
                            HapticFeedback.mediumImpact();
                            if (_model.favoritesFilterValue == true) {
                              _model.favoritesFilterValue = null;
                              safeSetState(() {});
                            } else {
                              _model.favoritesFilterValue = true;
                              safeSetState(() {});
                            }
                          },
                          value: _model.favoriteToggle,
                          onIcon: FaIcon(
                            FontAwesomeIcons.solidHeart,
                            color: FlutterFlowTheme.of(context).error,
                            size: 24.0,
                          ),
                          offIcon: FaIcon(
                            FontAwesomeIcons.heart,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'ojx4qkxn' /* Filter */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Satoshi',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Builder(
                        builder: (context) {
                          final quotesList =
                              (currentUserDocument?.likedQuotations.toList() ??
                                      [])
                                  .toList();

                          return MasonryGridView.builder(
                            gridDelegate:
                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                            ),
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 12.0,
                            itemCount: quotesList.length,
                            itemBuilder: (context, quotesListIndex) {
                              final quotesListItem =
                                  quotesList[quotesListIndex];
                              return wrapWithModel(
                                model: _model.historyListItemModels.getModel(
                                  quotesListIndex.toString(),
                                  quotesListIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: HistoryListItemWidget(
                                  key: Key(
                                    'Keymp6_${quotesListIndex.toString()}',
                                  ),
                                  currentReference: quotesListItem,
                                  onTab: () async {
                                    Navigator.pop(context, quotesListIndex);
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
