import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'next_button_model.dart';
export 'next_button_model.dart';

class NextButtonWidget extends StatefulWidget {
  const NextButtonWidget({
    super.key,
    required this.title,
    required this.onTab,
  });

  final String? title;
  final Future Function()? onTab;

  @override
  State<NextButtonWidget> createState() => _NextButtonWidgetState();
}

class _NextButtonWidgetState extends State<NextButtonWidget> {
  late NextButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NextButtonModel());
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
        maxWidth: 280.0,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x3F000000),
            offset: Offset(
              0.0,
              4.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: FFButtonWidget(
        onPressed: () async {
          HapticFeedback.mediumImpact();
          await widget.onTab?.call();
        },
        text: widget.title!,
        options: FFButtonOptions(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 50.0,
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: FlutterFlowTheme.of(context).second,
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Grift',
                color: FlutterFlowTheme.of(context).primaryBackground,
                fontSize: 20.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
          elevation: 0.0,
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
