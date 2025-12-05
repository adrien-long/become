import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/background_item/background_item_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'background_images_sheet_new_model.dart';
export 'background_images_sheet_new_model.dart';

class BackgroundImagesSheetNewWidget extends StatefulWidget {
  const BackgroundImagesSheetNewWidget({super.key});

  @override
  State<BackgroundImagesSheetNewWidget> createState() =>
      _BackgroundImagesSheetNewWidgetState();
}

class _BackgroundImagesSheetNewWidgetState
    extends State<BackgroundImagesSheetNewWidget> {
  late BackgroundImagesSheetNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackgroundImagesSheetNewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<WallpapersRecord>>(
      stream: FFAppState().wallpapersQuery(
        requestFn: () => queryWallpapersRecord(
          queryBuilder: (wallpapersRecord) => wallpapersRecord.orderBy('order'),
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
        List<WallpapersRecord> containerWallpapersRecordList = snapshot.data!;

        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
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
            mainAxisAlignment: MainAxisAlignment.start,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.lightImpact();
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
                            'mritjylk' /* Choose a background */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Grift',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.lightImpact();
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.check_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.82,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final images = FFAppState().BackgroundList.toList();

                        return GridView.builder(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            20.0,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 0.0,
                            childAspectRatio: 1.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: images.length,
                          itemBuilder: (context, imagesIndex) {
                            final imagesItem = images[imagesIndex];
                            return wrapWithModel(
                              model: _model.backgroundItemModels.getModel(
                                imagesIndex.toString(),
                                imagesIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: BackgroundItemWidget(
                                key: Key(
                                  'Keyl2z_${imagesIndex.toString()}',
                                ),
                                item: imagesItem,
                                isSelected:
                                    imagesItem == FFAppState().currentSettins,
                                isLock: (imagesItem.isPay == true) &&
                                    (revenue_cat.activeEntitlementIds.length ==
                                        0),
                                onTab: () async {
                                  HapticFeedback.lightImpact();
                                  if (imagesItem.isPay &&
                                      !(revenue_cat
                                          .activeEntitlementIds.isNotEmpty)) {
                                    context.pushNamed(PaywallWidget.routeName);
                                  } else {
                                    FFAppState().currentSettins = imagesItem;
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                  }
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
            ],
          ),
        );
      },
    );
  }
}
