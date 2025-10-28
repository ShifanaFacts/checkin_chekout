import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class TimeDisplay extends StatefulWidget {
  const TimeDisplay({super.key});

  @override
  TimeDisplayState createState() => TimeDisplayState();
}

class TimeDisplayState extends State<TimeDisplay> {
  String currentTime = DateFormat(
    'hh:mm:ss a',
  ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));
  String currentDate = DateFormat(
    'EEEE, MMMM d, yyyy',
  ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));

  @override
  void initState() {
    super.initState();
    _startTimeUpdate();
  }

  void _startTimeUpdate() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        final now = DateTime.now().toUtc().add(const Duration(hours: 4));
        currentTime = DateFormat('hh:mm:ss a').format(now);
        final newDate = DateFormat('EEEE, MMMM d, yyyy').format(now);
        if (newDate != currentDate) currentDate = newDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // vertically center
        crossAxisAlignment: CrossAxisAlignment.center, // horizontally center
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
      ),
    );
  }
}
