import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'nav_buttons_model.dart';
export 'nav_buttons_model.dart';

class NavButtonsWidget extends StatefulWidget {
  const NavButtonsWidget({
    super.key,
    required this.onWal,
    required this.onLiked,
    required this.onCategories,
  });

  final Future Function()? onWal;
  final Future Function()? onLiked;
  final Future Function()? onCategories;

  @override
  State<NavButtonsWidget> createState() => _NavButtonsWidgetState();
}

class _NavButtonsWidgetState extends State<NavButtonsWidget> {
  late NavButtonsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavButtonsModel());
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              HapticFeedback.mediumImpact();
              await widget.onCategories?.call();
            },
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.dashboard_sharp,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              HapticFeedback.mediumImpact();
              await widget.onWal?.call();
            },
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: FaIcon(
                  FontAwesomeIcons.globeAfrica,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              HapticFeedback.mediumImpact();
              await widget.onLiked?.call();
            },
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: FaIcon(
                  FontAwesomeIcons.handHoldingHeart,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ].divide(SizedBox(width: 6.0)),
      ),
    );
  }
}
