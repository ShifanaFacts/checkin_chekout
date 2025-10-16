import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  final String currentDate;
  final String currentTime;

  const TimeDisplay({
    super.key,
    required this.currentDate,
    required this.currentTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentDate,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(height: 5),
        Text(
          currentTime,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
