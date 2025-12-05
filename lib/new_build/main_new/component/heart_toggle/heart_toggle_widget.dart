import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'heart_toggle_model.dart';
export 'heart_toggle_model.dart';

class HeartToggleWidget extends StatefulWidget {
  const HeartToggleWidget({
    super.key,
    bool? isLiked,
    required this.onToggle,
    required this.color,
  }) : this.isLiked = isLiked ?? false;

  final bool isLiked;
  final Future Function()? onToggle;
  final Color? color;

  @override
  State<HeartToggleWidget> createState() => _HeartToggleWidgetState();
}

class _HeartToggleWidgetState extends State<HeartToggleWidget> {
  late HeartToggleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeartToggleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onToggle?.call();
      },
      child: Builder(
        builder: (context) {
          if (widget.isLiked) {
            return FaIcon(
              FontAwesomeIcons.solidHeart,
              color: FlutterFlowTheme.of(context).secondary,
              size: 32.0,
            );
          } else {
            return FaIcon(
              FontAwesomeIcons.heart,
              color: widget.color,
              size: 32.0,
            );
          }
        },
      ),
    );
  }
}
