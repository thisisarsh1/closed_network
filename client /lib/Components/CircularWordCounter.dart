import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CircularWordCounter extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;

  const CircularWordCounter({
    super.key,
    required this.controller,
    required this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final currentLength = controller.text.length;
        final isOverLimit = currentLength > maxLength;
        final progress = (currentLength / maxLength).clamp(0.0, 1.0);

        return TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 200),
          tween: Tween(begin: 0, end: progress),
          builder: (context, value, child) {
            return CustomPaint(
              painter: _CircularCounterPainter(
                progress: value,
                isOverLimit: isOverLimit,
              ),
              child: Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                child: Text(
                  (maxLength - currentLength).toString(),
                  style: GoogleFonts.sora(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isOverLimit ? Colors.redAccent : Colors.white,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _CircularCounterPainter extends CustomPainter {
  final double progress;
  final bool isOverLimit;

  _CircularCounterPainter({
    required this.progress,
    required this.isOverLimit,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 3.0;
    final radius = (size.width - strokeWidth) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    final basePaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.grey[800]!
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = isOverLimit ? Colors.redAccent : Colors.tealAccent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, basePaint);

    final sweepAngle = 2 * 3.1416 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.1416 / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CircularCounterPainter oldDelegate) =>
      oldDelegate.progress != progress ||
          oldDelegate.isOverLimit != isOverLimit;
}
