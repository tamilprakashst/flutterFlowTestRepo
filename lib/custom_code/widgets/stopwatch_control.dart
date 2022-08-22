// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
class StopwatchControl extends StatefulWidget {
  const StopwatchControl({
    Key? key,
    this.width,
    this.height,
    this.color,
    required this.currentTime,
    required this.totalMins,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? color;
  final int currentTime;
  final int totalMins;

  @override
  _StopwatchControlState createState() => _StopwatchControlState();
}

class _StopwatchControlState extends State<StopwatchControl> {
  @override
  Widget build(BuildContext context) {
    Color color = widget.color ?? const Color.fromARGB(255, 184, 5, 5);
    return Container(
      width: MediaQuery.of(context).size.width / 1.7,
      height: MediaQuery.of(context).size.width / 1.7,
      child: Center(
        child: CustomPaint(
          size: const Size(300, 300),
          painter: ArcPainter(
              color: color,
              percent: (widget.currentTime / widget.totalMins!) * 100,
              minutes: widget.totalMins - widget.currentTime!),
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  final Color color;
  final int minutes;
  final double percent;

  ArcPainter(
      {required this.color, required this.percent, required this.minutes});
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
        Rect.fromLTWH(0, 0, size.height, size.height),
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill);
    final minValue = TextSpan(
        text: ((minutes / 60).ceil().toInt()).toString(),
        style: TextStyle(
            fontSize: 15,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
            color: color));
    final minuteText = TextSpan(
        text: "Minutes",
        style: TextStyle(
            fontSize: 10,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
            color: color));
    final TextPainter painter = TextPainter(text: minValue);
    painter.layout(minWidth: 0, maxWidth: size.width);
    var offset = Offset(((size.width - painter.width) * 0.5) + 2, 13);
    painter.paint(canvas, offset);
    final TextPainter painter2 = TextPainter(text: minuteText);
    painter2.layout(minWidth: 0, maxWidth: size.width);
    const offset2 = Offset(11, 32);
    painter.paint(canvas, offset);
    // painter.text = minuteText;
    painter2.paint(canvas, offset2);
    var sweepAngle = ((360 * (percent / 100)) - 5);
    sweepAngle = sweepAngle < 0 ? 360 : (360 - sweepAngle);
    canvas.drawArc(
        Rect.fromLTWH(0, 0, size.height, size.height),
        270 * 0.0175,
        sweepAngle * 0.0175,
        false,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
