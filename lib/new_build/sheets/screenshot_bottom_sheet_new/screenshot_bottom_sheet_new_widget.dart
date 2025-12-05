import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/options_button/options_button_widget.dart';
import '/new_build/main_new/component/screenshot_new/screenshot_new_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screenshot_bottom_sheet_new_model.dart';
export 'screenshot_bottom_sheet_new_model.dart';

class ScreenshotBottomSheetNewWidget extends StatefulWidget {
  const ScreenshotBottomSheetNewWidget({
    super.key,
    required this.quotation,
  });

  final QuotationsRecord? quotation;

  @override
  State<ScreenshotBottomSheetNewWidget> createState() =>
      _ScreenshotBottomSheetNewWidgetState();
}

class _ScreenshotBottomSheetNewWidgetState
    extends State<ScreenshotBottomSheetNewWidget> {
  late ScreenshotBottomSheetNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScreenshotBottomSheetNewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.messageText =
          '${widget.quotation?.content}${widget.quotation?.source != null && widget.quotation?.source != '' ? ' - ${widget.quotation?.source}' : ''}';
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
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.clear_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    HapticFeedback.mediumImpact();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22.0, 12.0, 22.0, 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: custom_widgets.CreateScreenshot(
                      width: double.infinity,
                      height: 400.0,
                      autoCapture: true,
                      onScreenshotCaptured: (screenshot) async {
                        _model.imageBytes = screenshot;
                        safeSetState(() {});
                      },
                      childBuilder: () => ScreenshotNewWidget(
                        quote: widget.quotation!,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.optionsButtonModel1,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: OptionsButtonWidget(
                            title: 'Save Image',
                            icon: Icon(
                              Icons.save_alt,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            onTab: () async {
                              HapticFeedback.mediumImpact();
                              await downloadFile(
                                filename: getCurrentTimestamp.secondsSinceEpoch
                                    .toString(),
                                uploadedFile: _model.imageBytes!,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.optionsButtonModel2,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: OptionsButtonWidget(
                            title: 'Share Image',
                            icon: Icon(
                              Icons.share_outlined,
                            ),
                            onTab: () async {
                              HapticFeedback.mediumImpact();
                              await actions.shareScreenshot(
                                _model.imageBytes!,
                              );
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.optionsButtonModel3,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: OptionsButtonWidget(
                            title: 'Copy Text',
                            icon: Icon(
                              Icons.content_copy,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            onTab: () async {
                              HapticFeedback.mediumImpact();
                              await Clipboard.setData(ClipboardData(
                                  text: '${widget.quotation?.content}'));
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Text Copied!',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.crimsonPro(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 2000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
