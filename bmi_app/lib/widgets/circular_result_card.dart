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

  String bmiMessage(String status) {
    switch (status) {
      case "Normal":
        return "Great! You have a normal body weight. ";
      case "UnderWeight":
        return "You are currently underweight.";

      case "OverWeight":
        return "You are slightly above the recommended weight range.";
      case "Obese":
        return "Your BMI falls within the obese range.";
      default:
        return "Unable to determine your BMI category.   ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          "Your BMI",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 270,
          height: 220,
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
        Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                (bmiMessage(
                  status,
                )).substring(0, (bmiMessage(status)).indexOf('.') + 1),
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight(700),
                ),
              ),
            ],
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
      ..color = color.withOpacity(0.3)
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
