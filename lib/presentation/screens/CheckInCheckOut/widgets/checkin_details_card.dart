import 'package:flutter/material.dart';

class CheckinDetailsCard extends StatelessWidget {
  final String project;
  final String department;
  final String costCode;
  final String activity;
  final String checkInTime;

  const CheckinDetailsCard({
    super.key,
    required this.project,
    required this.department,
    required this.costCode,
    required this.activity,
    required this.checkInTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _tile(Icons.label, "Project", project),
            _tile(Icons.business, "Department", department),
            _tile(Icons.attach_money, "Cost Code", costCode),
            _tile(Icons.play_arrow, "Activity", activity),
            _tile(Icons.access_time, "Check-In Time", checkInTime),
          ],
        ),
      ),
    );
  }

  ListTile _tile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(value),
      subtitle: Text(label),
    );
  }
}
