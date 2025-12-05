import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'load_with_timer_model.dart';
export 'load_with_timer_model.dart';

class LoadWithTimerWidget extends StatefulWidget {
  const LoadWithTimerWidget({
    super.key,
    required this.onInit,
  });

  final Future Function()? onInit;

  @override
  State<LoadWithTimerWidget> createState() => _LoadWithTimerWidgetState();
}

class _LoadWithTimerWidgetState extends State<LoadWithTimerWidget> {
  late LoadWithTimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadWithTimerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.onInit?.call();
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/images/25.gif',
          width: 124.0,
          height: 124.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
