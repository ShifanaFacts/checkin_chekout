import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckinCheckout extends StatefulWidget {
  const CheckinCheckout({super.key});

  @override
  _CheckinCheckoutState createState() => _CheckinCheckoutState();
}

class _CheckinCheckoutState extends State<CheckinCheckout> {
  String currentTime = DateFormat(
    'hh:mm:ss a',
  ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));
  String currentDate = DateFormat(
    'EEEE, MMMM d, yyyy',
  ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));
  String currentStatus = "Not Checked-In";
  bool isCheckedIn = false;
  String? checkInTime;

  // User and job information
  final String userName = "Ataah Ul Rehman Mohammed Abdul Razzak";
  final String designation = "Finance Manager";
  final String workingCompany = "Innovatech Solutions";
  final String employeeId = "2229";
  final String department = "Finance";

  // Dropdown selections
  String? selectedProject;
  String? selectedDepartment;
  String? selectedCostCode;
  String? selectedActivity;

  // Sample dropdown options
  final List<String> projects = ['Project A', 'Project B', 'Project C'];
  final List<String> departments = ['IT', 'HR', 'Finance'];
  final List<String> costCodes = ['CC001', 'CC002', 'CC003'];
  final List<String> activities = ['Development', 'Testing', 'Deployment'];

  @override
  void initState() {
    super.initState();
    // Update time every second
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() {
          currentTime = DateFormat(
            'hh:mm:ss a',
          ).format(DateTime.now().toUtc().add(const Duration(hours: 4)));
        });
      }
      return true;
    });
  }

  bool get canCheckIn =>
      selectedProject != null &&
      selectedDepartment != null &&
      selectedCostCode != null &&
      selectedActivity != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue[100],
                      child: const Icon(
                        Icons.person,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                            softWrap: true, // Allow wrapping
                            maxLines: null, // Unlimited lines
                            overflow: TextOverflow.visible,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            designation,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            workingCompany,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.person_pin,
                                color: Colors.blue,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "Employee ID: $employeeId",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.work,
                                color: Colors.blue,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "Department: $department",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (!isCheckedIn) ...[
              Center(
                child: Column(
                  children: [
                    Text(
                      currentDate,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      currentTime,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildDropdown(
                label: "Select Project",
                value: selectedProject,
                items: projects,
                onChanged: (value) => setState(() => selectedProject = value),
              ),
              _buildDropdown(
                label: "Select Department",
                value: selectedDepartment,
                items: departments,
                onChanged: (value) =>
                    setState(() => selectedDepartment = value),
              ),
              _buildDropdown(
                label: "Select Cost Code",
                value: selectedCostCode,
                items: costCodes,
                onChanged: (value) => setState(() => selectedCostCode = value),
              ),
              _buildDropdown(
                label: "Select Activity",
                value: selectedActivity,
                items: activities,
                onChanged: (value) => setState(() => selectedActivity = value),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: canCheckIn
                    ? () {
                        setState(() {
                          isCheckedIn = true;
                          currentStatus = "Checked-In";
                          checkInTime = currentTime;
                        });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: canCheckIn ? Colors.blue : Colors.grey,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Check-In",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ] else ...[
              Center(
                child: Column(
                  children: [
                    Text(
                      currentDate,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      currentTime,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.label, color: Colors.blue),
                        title: Text(" $selectedProject"),
                      ),
                      ListTile(
                        leading: const Icon(Icons.business, color: Colors.blue),
                        title: Text(" $selectedDepartment"),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.attach_money,
                          color: Colors.blue,
                        ),
                        title: Text(" $selectedCostCode"),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.play_arrow,
                          color: Colors.blue,
                        ),
                        title: Text(" $selectedActivity"),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.access_time,
                          color: Colors.blue,
                        ),
                        title: Text("Check-In Time: $checkInTime"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isCheckedIn = false;
                    currentStatus = "Checked-Out";
                    selectedProject = null;
                    selectedDepartment = null;
                    selectedCostCode = null;
                    selectedActivity = null;
                  });
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Check-Out",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
          ),
          value: value,
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
