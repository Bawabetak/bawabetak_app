import 'package:flutter/material.dart';

class OnboardingContainerPainter extends CustomPainter {
  final Color color;

  OnboardingContainerPainter({super.repaint, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height * 0.3, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
