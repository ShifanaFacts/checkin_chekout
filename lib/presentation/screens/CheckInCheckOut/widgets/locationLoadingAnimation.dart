import 'package:flutter/material.dart';

import 'dart:math';

class LocationScanningAnimation extends StatefulWidget {
  const LocationScanningAnimation({super.key});

  @override
  LocationScanningAnimationState createState() =>
      LocationScanningAnimationState();
}

class LocationScanningAnimationState extends State<LocationScanningAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lensAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _lensAnimation = Tween<double>(
      begin: -50,
      end: 50,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: LocationLensPainter(
                  lensOffset: _lensAnimation.value,
                  pulseScale: _pulseAnimation.value,
                ),
                child: Container(),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Scanning for your location...',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}

// Custom painter for the location scanning animation
class LocationLensPainter extends CustomPainter {
  final double lensOffset;
  final double pulseScale;

  LocationLensPainter({required this.lensOffset, required this.pulseScale});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint();

    // Draw a subtle map-like background
    paint.color = Colors.grey.shade200;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Draw simplified map elements (roads)
    paint.color = Colors.grey.shade400;
    paint.strokeWidth = 5;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );

    // Draw a pulsing circle at the center
    paint.color = Colors.blue.withOpacity(0.3);
    canvas.drawCircle(center, 20 * pulseScale, paint);

    // Draw magnifying lens
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    final lensCenter = Offset(center.dx + lensOffset, center.dy);
    canvas.drawCircle(lensCenter, 20, paint);

    // Draw lens handle
    final handleEnd = Offset(
      lensCenter.dx + 20 * cos(pi / 4),
      lensCenter.dy + 20 * sin(pi / 4),
    );
    canvas.drawLine(lensCenter, handleEnd, paint);

    // Draw lens shine effect
    paint.color = Colors.white.withOpacity(0.5);
    paint.strokeWidth = 1;
    canvas.drawLine(
      Offset(lensCenter.dx - 10, lensCenter.dy - 10),
      Offset(lensCenter.dx + 10, lensCenter.dy + 10),
      paint,
    );
  }

  @override
  bool shouldRepaint(LocationLensPainter oldDelegate) {
    return oldDelegate.lensOffset != lensOffset ||
        oldDelegate.pulseScale != pulseScale;
  }
}
