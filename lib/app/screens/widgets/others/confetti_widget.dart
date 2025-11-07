import 'dart:math';
import 'package:flutter/material.dart';

class ConfettiWidget extends StatelessWidget {
  final Duration duration;
  final ValueNotifier<double> progress;

  const ConfettiWidget({
    super.key,
    this.duration = const Duration(milliseconds: 500),
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: progress,
        builder: (context, child) {
          return CustomPaint(
            painter: ConfettiPainter(progress: progress.value, repaint: progress.value > 0), // Pasar el ValueNotifier y el repaint
          );
        },
      ),
    );
  }
}

class ConfettiPainter extends CustomPainter {
  final double progress;
  final bool repaint; // Agregar el campo repaint

  ConfettiPainter({required this.progress, required this.repaint});

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random();
    final confettiCount = 50;

    for (int i = 0; i < confettiCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 3 + 1;
      final color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );

      canvas.drawCircle(Offset(x, y), radius, Paint()..color = color);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return repaint; // Usar el campo repaint
  }
}