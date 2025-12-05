import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'messages_item_model.dart';
export 'messages_item_model.dart';

class MessagesItemWidget extends StatefulWidget {
  const MessagesItemWidget({
    super.key,
    required this.title,
    required this.onNext,
    required this.onLike,
  });

  final String? title;
  final Future Function()? onNext;
  final Future Function()? onLike;

  @override
  State<MessagesItemWidget> createState() => _MessagesItemWidgetState();
}

class _MessagesItemWidgetState extends State<MessagesItemWidget>
    with TickerProviderStateMixin {
  late MessagesItemModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessagesItemModel());

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
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
            child: Text(
              valueOrDefault<String>(
                widget.title,
                '-',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Satoshi',
                    color: Color(0xFF4A4A4A),
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 55.0,
                icon: FaIcon(
                  FontAwesomeIcons.share,
                  color: Color(0xFF4A4A4A),
                  size: 40.0,
                ),
                onPressed: () async {
                  HapticFeedback.lightImpact();
                  await widget.onNext?.call();
                },
              ),
              ToggleIcon(
                onPressed: () async {
                  safeSetState(() => _model.isLike = !_model.isLike);
                  HapticFeedback.lightImpact();
                  _model.isLike = !_model.isLike;
                  safeSetState(() {});
                  await widget.onLike?.call();
                },
                value: _model.isLike,
                onIcon: FaIcon(
                  FontAwesomeIcons.solidHeart,
                  color: Color(0xFF4A4A4A),
                  size: 24.0,
                ),
                offIcon: FaIcon(
                  FontAwesomeIcons.heart,
                  color: Color(0xFF4A4A4A),
                  size: 40.0,
                ),
              ),
            ].divide(SizedBox(width: 6.0)),
          ),
        ],
      ),
    );
  }
}
