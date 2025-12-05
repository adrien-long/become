import '/backend/backend.dart';
import '/components/screenshot/screenshot_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'screenshot_bottom_sheet_model.dart';
export 'screenshot_bottom_sheet_model.dart';

class ScreenshotBottomSheetWidget extends StatefulWidget {
  const ScreenshotBottomSheetWidget({
    super.key,
    required this.quote,
    required this.backgroundImage,
  });

  final DocumentReference? quote;
  final DocumentReference? backgroundImage;

  @override
  State<ScreenshotBottomSheetWidget> createState() =>
      _ScreenshotBottomSheetWidgetState();
}

class _ScreenshotBottomSheetWidgetState
    extends State<ScreenshotBottomSheetWidget> {
  late ScreenshotBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScreenshotBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.9,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 14.0, 20.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 40.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: Color(0xFFC9C9C9),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: StreamBuilder<QuotesRecord>(
                stream: QuotesRecord.getDocument(widget.quote!),
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

                  final stackQuotesRecord = snapshot.data!;

                  return Stack(
                    children: [
                      wrapWithModel(
                        model: _model.screenshotModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ScreenshotWidget(
                          quoteText: '${stackQuotesRecord.content}',
                          wallpaperDoc: widget.backgroundImage!,
                          quote: widget.quote!,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.05),
                        child: StreamBuilder<QuotesRecord>(
                          stream: QuotesRecord.getDocument(widget.quote!),
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

                            final widgetScreenshotQuotesRecord = snapshot.data!;

                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.8,
                              child: custom_widgets.WidgetScreenshot(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                onScreenshotCaptured: (screenshot) async {
                                  _model.imageBytes = screenshot;
                                  safeSetState(() {});
                                  await actions.shareScreenshot(
                                    screenshot,
                                  );
                                },
                                screenshotChild: () => ScreenshotWidget(
                                  quoteText:
                                      widgetScreenshotQuotesRecord.content,
                                  wallpaperDoc: widget.backgroundImage!,
                                  quote: widget.quote!,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
