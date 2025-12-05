import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'category_button_model.dart';
export 'category_button_model.dart';

class CategoryButtonWidget extends StatefulWidget {
  const CategoryButtonWidget({
    super.key,
    bool? isSelected,
    String? title,
    this.onSelect,
    int? textSize,
    required this.emodji,
    bool? isLock,
    required this.subtitle,
    bool? isPay,
  })  : this.isSelected = isSelected ?? false,
        this.title = title ?? '-',
        this.textSize = textSize ?? 20,
        this.isLock = isLock ?? false,
        this.isPay = isPay ?? false;

  final bool isSelected;
  final String title;
  final Future Function()? onSelect;
  final int textSize;
  final String? emodji;
  final bool isLock;
  final String? subtitle;
  final bool isPay;

  @override
  State<CategoryButtonWidget> createState() => _CategoryButtonWidgetState();
}

class _CategoryButtonWidgetState extends State<CategoryButtonWidget> {
  late CategoryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryButtonModel());
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
        if (widget.isLock) {
          var confirmDialogResponse = await showDialog<bool>(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('This is a paid category.'),
                    content: Text('Would you like to proceed to payment?'),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, false),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, true),
                        child: Text('Confirm'),
                      ),
                    ],
                  );
                },
              ) ??
              false;
          if (confirmDialogResponse) {
            context.pushNamed(PaywallWidget.routeName);
          }
        } else {
          await widget.onSelect?.call();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget.isSelected
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).secondaryBackground,
            Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Colors.transparent,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.emodji,
                  '💡',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Satoshi',
                      fontSize: 34.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.title,
                          '-',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Grift',
                              color: widget.isSelected
                                  ? FlutterFlowTheme.of(context)
                                      .primaryBackground
                                  : FlutterFlowTheme.of(context).primaryText,
                              fontSize: widget.textSize.toDouble(),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.subtitle,
                          '-',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Grift',
                              color: widget.isSelected
                                  ? FlutterFlowTheme.of(context)
                                      .primaryBackground
                                  : FlutterFlowTheme.of(context).primary,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.isPay)
                FaIcon(
                  FontAwesomeIcons.crown,
                  color: FlutterFlowTheme.of(context).warning,
                  size: 18.0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
