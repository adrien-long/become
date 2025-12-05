import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/intro/components/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_page_component_model.dart';
export 'text_page_component_model.dart';

class TextPageComponentWidget extends StatefulWidget {
  const TextPageComponentWidget({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onTab,
    this.onInitial,
  });

  final String? text;
  final String? buttonText;
  final Future Function()? onTab;
  final Future Function()? onInitial;

  @override
  State<TextPageComponentWidget> createState() =>
      _TextPageComponentWidgetState();
}

class _TextPageComponentWidgetState extends State<TextPageComponentWidget>
    with TickerProviderStateMixin {
  late TextPageComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextPageComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.onInitial?.call();
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.0,
            height: 10.0,
            decoration: BoxDecoration(),
          ),
          Text(
            valueOrDefault<String>(
              widget.text,
              '-',
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  font: GoogleFonts.nothingYouCouldDo(
                    fontWeight: FontWeight.normal,
                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                ),
          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
          wrapWithModel(
            model: _model.nextButtonModel,
            updateCallback: () => safeSetState(() {}),
            child: NextButtonWidget(
              title: widget.buttonText!,
              onTab: () async {
                await widget.onTab?.call();
              },
            ),
          ),
        ],
      ),
    );
  }
}
