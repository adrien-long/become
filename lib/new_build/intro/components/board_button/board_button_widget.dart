import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'board_button_model.dart';
export 'board_button_model.dart';

class BoardButtonWidget extends StatefulWidget {
  const BoardButtonWidget({
    super.key,
    bool? isSelected,
    String? buttonText,
    this.onSelect,
    int? textSize,
  })  : this.isSelected = isSelected ?? false,
        this.buttonText = buttonText ?? '-',
        this.textSize = textSize ?? 20;

  final bool isSelected;
  final String buttonText;
  final Future Function()? onSelect;
  final int textSize;

  @override
  State<BoardButtonWidget> createState() => _BoardButtonWidgetState();
}

class _BoardButtonWidgetState extends State<BoardButtonWidget> {
  late BoardButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoardButtonModel());
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
        HapticFeedback.lightImpact();
        await widget.onSelect?.call();
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget.isSelected
                ? FlutterFlowTheme.of(context).selectedOptionFill
                : FlutterFlowTheme.of(context).info,
            Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).optionBorder,
            width: 1.0,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget.buttonText,
              '-',
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Grift',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: widget.textSize.toDouble(),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ),
    );
  }
}
