// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'dart:async';

class DTimer extends StatefulWidget {
  const DTimer({
    Key? key,
    this.width,
    this.height,
    this.pStartValue,
    this.pTimerStatus,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int? pStartValue;
  final bool? pTimerStatus;

  @override
  _DTimerState createState() => _DTimerState();
}

class _DTimerState extends State<DTimer> {
  Timer? _timer;
  int? _start;
  int? min;
  int? sec;
  bool? _status;

  @override
  void initState() {
    _start = widget.pStartValue;
    _status = widget.pTimerStatus;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer t) {
        if (_start == 0) {
          setState(() {
            t.cancel();
          });
        } else {
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_status == true) {
      _status = false;
      startTimer();
    }
    return Text(
      '$min:$sec',
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontSize: 13,
          fontWeight: FontWeight.bold),
    );
  }
}
