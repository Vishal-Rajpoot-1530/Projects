import 'dart:math';
import 'package:flutter/material.dart';

class CircularResultCard extends StatelessWidget {
  final double bmi;
  final String status;
  final Color color;

  const CircularResultCard({
    super.key,
    required this.bmi,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Your BMI",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 30),
        SizedBox(
          width: 270,
          height: 270,
          child: CustomPaint(
            painter: BMIPainter(bmi: bmi, color: color),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    bmi.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 58,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  SizedBox(height: 10),

                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight(600),
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BMIPainter extends CustomPainter {
  final double bmi;
  final Color color;

  BMIPainter({required this.bmi, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const strokeWidth = 16.0;
    final radius = size.width / 2 - strokeWidth;

    final backgroundPaint = Paint()
      ..color = const Color.fromARGB(255, 208, 243, 209)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    const startAngle = 3 * pi / 4;

    const sweepAngle = 3 * pi / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    double progress = (bmi / 40).clamp(0.0, 1.0);

    final progressSweep = sweepAngle * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressSweep,
      false,
      progressPaint,
    );

    final angle = startAngle + progressSweep;

    final dotX = center.dx + radius * cos(angle);
    final dotY = center.dy + radius * sin(angle);

    final dotPain = Paint()..color = color;

    canvas.drawCircle(Offset(dotX, dotY), 12, dotPain);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
