import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/image_asset/image_asset_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'background_item_model.dart';
export 'background_item_model.dart';

class BackgroundItemWidget extends StatefulWidget {
  const BackgroundItemWidget({
    super.key,
    this.item,
    bool? isSelected,
    required this.onTab,
    bool? isLock,
  })  : this.isSelected = isSelected ?? false,
        this.isLock = isLock ?? false;

  final BackgroundSettingsStruct? item;
  final bool isSelected;
  final Future Function()? onTab;
  final bool isLock;

  @override
  State<BackgroundItemWidget> createState() => _BackgroundItemWidgetState();
}

class _BackgroundItemWidgetState extends State<BackgroundItemWidget> {
  late BackgroundItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackgroundItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await widget.onTab?.call();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(14.0),
              border: Border.all(
                color: Color(0xFFFFEEC8),
                width: widget.isSelected ? 5.0 : 0.0,
              ),
            ),
            child: Stack(
              children: [
                ClipRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: valueOrDefault<double>(
                        widget.isLock ? 1.0 : 0.0,
                        0.0,
                      ),
                      sigmaY: valueOrDefault<double>(
                        widget.isLock ? 1.0 : 0.0,
                        0.0,
                      ),
                    ),
                    child: wrapWithModel(
                      model: _model.imageAssetModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ImageAssetWidget(
                        number: widget.item!.imageNumber,
                        borderRadius: 13.0,
                      ),
                    ),
                  ),
                ),
                if (valueOrDefault<bool>(
                  widget.isLock,
                  false,
                ))
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.lock_open,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 49.0,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'gj1cz166' /* Press to unlock */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Grift',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
