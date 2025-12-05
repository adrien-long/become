import '/auth/firebase_auth/auth_util.dart';
import '/components/history_list_item/history_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/empty_list/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quotes_liked_sheet_model.dart';
export 'quotes_liked_sheet_model.dart';

class QuotesLikedSheetWidget extends StatefulWidget {
  const QuotesLikedSheetWidget({super.key});

  @override
  State<QuotesLikedSheetWidget> createState() => _QuotesLikedSheetWidgetState();
}

class _QuotesLikedSheetWidgetState extends State<QuotesLikedSheetWidget> {
  late QuotesLikedSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuotesLikedSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      '8azjimc9' /* Favorites */,
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => Builder(
                    builder: (context) {
                      final quotesList =
                          (currentUserDocument?.likedQuotations.toList() ?? [])
                              .toList();
                      if (quotesList.isEmpty) {
                        return EmptyListWidget(
                          text: 'You haven\'t liked any quotes yet.',
                          icon: Icon(
                            Icons.heart_broken_sharp,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 50.0,
                          ),
                        );
                      }

                      return MasonryGridView.builder(
                        gridDelegate:
                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 12.0,
                        itemCount: quotesList.length,
                        padding: EdgeInsets.fromLTRB(
                          0,
                          10.0,
                          0,
                          0,
                        ),
                        itemBuilder: (context, quotesListIndex) {
                          final quotesListItem = quotesList[quotesListIndex];
                          return wrapWithModel(
                            model: _model.historyListItemModels.getModel(
                              quotesListIndex.toString(),
                              quotesListIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: HistoryListItemWidget(
                              key: Key(
                                'Keyjme_${quotesListIndex.toString()}',
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
  }
}
