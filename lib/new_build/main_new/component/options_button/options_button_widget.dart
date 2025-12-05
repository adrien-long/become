import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'options_button_model.dart';
export 'options_button_model.dart';

class OptionsButtonWidget extends StatefulWidget {
  const OptionsButtonWidget({
    super.key,
    required this.onTab,
    required this.title,
    required this.icon,
  });

  final Future Function()? onTab;
  final String? title;
  final Widget? icon;

  @override
  State<OptionsButtonWidget> createState() => _OptionsButtonWidgetState();
}

class _OptionsButtonWidgetState extends State<OptionsButtonWidget> {
  late OptionsButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionsButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 70.0,
      ),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.onTab?.call();
            },
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.circle,
              ),
              child: widget.icon!,
            ),
          ),
          Text(
            valueOrDefault<String>(
              widget.title,
              '-',
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Grift',
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.0,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ].divide(SizedBox(height: 10.0)),
      ),
    );
  }
}
