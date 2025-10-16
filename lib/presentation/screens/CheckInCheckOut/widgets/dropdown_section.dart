import 'package:flutter/material.dart';

class DropdownSection extends StatelessWidget {
  final String? selectedProject;
  final String? selectedDepartment;
  final String? selectedCostCode;
  final String? selectedActivity;

  final List<String> projects;
  final List<String> departments;
  final List<String> costCodes;
  final List<String> activities;

  final ValueChanged<String?> onProjectChanged;
  final ValueChanged<String?> onDepartmentChanged;
  final ValueChanged<String?> onCostCodeChanged;
  final ValueChanged<String?> onActivityChanged;

  const DropdownSection({
    super.key,
    required this.selectedProject,
    required this.selectedDepartment,
    required this.selectedCostCode,
    required this.selectedActivity,
    required this.projects,
    required this.departments,
    required this.costCodes,
    required this.activities,
    required this.onProjectChanged,
    required this.onDepartmentChanged,
    required this.onCostCodeChanged,
    required this.onActivityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _dropdown(
          "Select Project",
          selectedProject,
          projects,
          onProjectChanged,
        ),
        _dropdown(
          "Select Department",
          selectedDepartment,
          departments,
          onDepartmentChanged,
        ),
        _dropdown(
          "Select Cost Code",
          selectedCostCode,
          costCodes,
          onCostCodeChanged,
        ),
        _dropdown(
          "Select Activity",
          selectedActivity,
          activities,
          onActivityChanged,
        ),
      ],
    );
  }

  Widget _dropdown(
    String label,
    String? value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
        ),
      ),
    );
  }
}
