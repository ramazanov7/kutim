import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:kutim/src/core/theme/resources.dart';

class CustomLoadingOverlayWidget extends StatelessWidget {
  const CustomLoadingOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 96,
        width: 96,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: const RepaintBoundary(
          child: SpinningProgressIndicator(),
        ),
      ),
    );
  }
}

class SpinningProgressIndicator extends StatefulWidget {
  final double size;

  const SpinningProgressIndicator({super.key, this.size = 48});

  @override
  _SpinningProgressIndicatorState createState() => _SpinningProgressIndicatorState();
}

class _SpinningProgressIndicatorState extends State<SpinningProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: CustomPaint(
          painter: _CircularProgressPainter(),
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  @override
  // void paint(Canvas canvas, Size size) {
  //   const double strokeWidth = 10.0;
  //   final Paint paint = Paint()
  //     ..style = PaintingStyle.stroke
  //     ..strokeWidth = strokeWidth;

  //   Rect rect = Offset.zero & size;
  //   rect = rect.deflate(strokeWidth / 2);

  //   paint.shader = SweepGradient(
  //     colors: [
  //       const Color(0xFF7CC836).withOpacity(0),
  //       const Color(0xFF7CC836),
  //       // Transition to transparent
  //     ],
  //     stops: const [0.1, 1.0],
  //     transform: const GradientRotation(math.pi / 4 + math.pi / 2), // Adjust rotation to match from 189.25deg
  //   ).createShader(rect);

  //   // Draw the gradient arc
  //   canvas.drawArc(rect, 1, 2 * math.pi, false, paint);
  // }

  void paint(Canvas canvas, Size size) {
    final double centerPoint = size.height / 2;

    const double strokeWidth = 7.5;
    const double percentValue = 100 / 100;
    final double radius = centerPoint;

    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.shader = SweepGradient(
      colors: [
        AppColors.mainColor.withOpacity(0),
        AppColors.mainColor,
      ],
      tileMode: TileMode.repeated,
      startAngle: _degreeToRad(270),
      endAngle: _degreeToRad(270 + 360.0),
    ).createShader(Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0));

    final Rect rect = Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: radius);

    const scapSize = strokeWidth / 2;
    final double scapToDegree = scapSize / radius;

    final double startAngle = _degreeToRad(270) + scapToDegree;
    final double sweepAngle = _degreeToRad(360) - (2 * scapToDegree);

    canvas.drawArc(rect, startAngle, percentValue * sweepAngle, false, paint);
  }

  double _degreeToRad(double degree) => degree * math.pi / 180;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
