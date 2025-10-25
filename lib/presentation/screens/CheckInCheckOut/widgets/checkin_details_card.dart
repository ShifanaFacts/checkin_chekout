import 'dart:developer';
import 'package:checkin_checkout/data/models/checkin_checkout_model/checkin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckinDetailsCard extends StatefulWidget {
  final CheckinVieModel? checkinViewModel;
  final double latitude;
  final double longitude;

  const CheckinDetailsCard({
    super.key,
    required this.checkinViewModel,
    required this.latitude,
    required this.longitude,
  });

  @override
  CheckinDetailsCardState createState() => CheckinDetailsCardState();
}

class CheckinDetailsCardState extends State<CheckinDetailsCard> {
  @override
  Widget build(BuildContext context) {
    // Access the passed CheckinViewModel
    final data = widget.checkinViewModel;

    // Check if the view model has valid data
    return _buildCard(
      project: data?.JOBMST_DOCNO ?? "",
      department: data?.DEPT_DESC ?? "",
      costCode: data?.COST_DESC ?? "",
      activity: data?.ACT_DOCNO ?? "",
      checkInTime: data?.checkintime ?? "",
    );
  }

  Widget _buildCard({
    required String project,
    required String department,
    required String costCode,
    required String activity,
    required String checkInTime,
  }) {
    return Card(
      elevation: 8,
      shadowColor: Colors.blueAccent.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blueAccent.withOpacity(0.2)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTile(
                icon: Icons.label,
                title: 'Project',
                value: project,
                color: Colors.blueAccent,
              ),
              _buildDivider(),
              _buildTile(
                icon: Icons.business,
                title: 'Department',
                value: department,
                color: Colors.teal,
              ),
              _buildDivider(),
              _buildTile(
                icon: Icons.attach_money,
                title: 'Cost Code',
                value: costCode,
                color: Colors.green,
              ),
              _buildDivider(),
              _buildTile(
                icon: Icons.play_arrow,
                title: 'Activity',
                value: activity,
                color: Colors.orange,
              ),
              _buildDivider(),
              _buildTile(
                icon: Icons.access_time,
                title: 'Check-In Time',
                value: checkInTime != ""
                    ? DateFormat(
                        'HH:mm:ss dd-MM-yyyy',
                      ).format(DateTime.parse(checkInTime))
                    : "",
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(20 * (1 - value), 0),
            child: child,
          ),
        );
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 25),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1, color: Colors.grey.shade200);
  }
}
