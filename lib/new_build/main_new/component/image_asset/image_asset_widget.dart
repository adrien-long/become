import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'image_asset_model.dart';
export 'image_asset_model.dart';

class ImageAssetWidget extends StatefulWidget {
  const ImageAssetWidget({
    super.key,
    int? number,
    required this.borderRadius,
  }) : this.number = number ?? 9;

  final int number;
  final double? borderRadius;

  @override
  State<ImageAssetWidget> createState() => _ImageAssetWidgetState();
}

class _ImageAssetWidgetState extends State<ImageAssetWidget> {
  late ImageAssetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageAssetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.number == 1) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              widget.borderRadius,
              0.0,
            )),
            child: Image.asset(
              'assets/images/background_1.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.number == 2) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              widget.borderRadius,
              0.0,
            )),
            child: Image.asset(
              'assets/images/background_2.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.number == 3) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              widget.borderRadius,
              0.0,
            )),
            child: Image.asset(
              'assets/images/background_3.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.number == 4) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              widget.borderRadius,
              0.0,
            )),
            child: Image.asset(
              'assets/images/background_4.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.number == 5) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              widget.borderRadius,
              0.0,
            )),
            child: Image.asset(
              'assets/images/background_5.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.number == 6) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              widget.borderRadius,
              0.0,
            )),
            child: Image.asset(
              'assets/images/background_6.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.number == 7) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              widget.borderRadius,
              0.0,
            )),
            child: Image.asset(
              'assets/images/background_7.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.number == 8) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              widget.borderRadius,
              0.0,
            )),
            child: Image.asset(
              'assets/images/background_8.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.number == 9) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              widget.borderRadius,
              0.0,
            )),
            child: Image.asset(
              'assets/images/background_9.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.number == 10) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              widget.borderRadius,
              0.0,
            )),
            child: Image.asset(
              'assets/images/pexels-igor-haritanovich-814387-1687341_1-low.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(valueOrDefault<double>(
              widget.borderRadius,
              0.0,
            )),
            child: Image.asset(
              'assets/images/background_9.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        }
      },
    );
  }
}
