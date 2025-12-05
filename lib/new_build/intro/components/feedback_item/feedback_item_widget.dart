import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'feedback_item_model.dart';
export 'feedback_item_model.dart';

class FeedbackItemWidget extends StatefulWidget {
  const FeedbackItemWidget({
    super.key,
    required this.messase,
    required this.userName,
    required this.yearsOld,
    required this.rating,
  });

  final String? messase;
  final String? userName;
  final int? yearsOld;
  final int? rating;

  @override
  State<FeedbackItemWidget> createState() => _FeedbackItemWidgetState();
}

class _FeedbackItemWidgetState extends State<FeedbackItemWidget> {
  late FeedbackItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackItemModel());
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
          Text(
            widget.messase!,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Satoshi',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar.builder(
                onRatingUpdate: (newValue) =>
                    safeSetState(() => _model.ratingBarValue = newValue),
                itemBuilder: (context, index) => Icon(
                  Icons.star_rate,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                direction: Axis.horizontal,
                initialRating: _model.ratingBarValue ??=
                    widget.rating!.toDouble(),
                unratedColor: FlutterFlowTheme.of(context).secondaryText,
                itemCount: 5,
                itemSize: 18.0,
                glowColor: FlutterFlowTheme.of(context).primaryText,
              ),
              RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'k1mfsqd1' /*  —  */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Satoshi',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    TextSpan(
                      text: widget.userName!,
                      style: TextStyle(),
                    ),
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'ok1eovk5' /* ,  */,
                      ),
                      style: TextStyle(),
                    ),
                    TextSpan(
                      text: widget.yearsOld!.toString(),
                      style: TextStyle(),
                    ),
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        '0aa3hot0' /* . */,
                      ),
                      style: TextStyle(),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Satoshi',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
