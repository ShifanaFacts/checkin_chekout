// import 'package:checkin_checkout/data/models/taskmodel.dart';
// import 'package:checkin_checkout/presentation/Tasks/taskdetail.dart';
// import 'package:checkin_checkout/presentation/Tasks/widgets/taskcard.dart';
// import 'package:flutter/material.dart';

// class ChecklistPage extends StatefulWidget {
//   @override
//   _ChecklistPageState createState() => _ChecklistPageState();
// }

// class _ChecklistPageState extends State<ChecklistPage> {
//   String? selectedZone;
//   List<Task> tasks = [
//     Task('Customer A', 'Fix server issue', 'Urgent', '10:00 AM', true),
//     Task('Customer B', 'Install new software', 'Normal', '11:00 AM', false),
//     Task('Customer C', 'Network configuration', 'High', '12:00 PM', true),
//     Task('Customer D', 'System upgrade', 'Normal', '01:00 PM', false),
//     Task('Customer E', 'Backup data', 'Low', '02:00 PM', true),
//   ];

//   List<Task> filteredTasks = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Task Checklist'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 labelText: 'Select Zone',
//                 border: OutlineInputBorder(),
//               ),
//               value: selectedZone,
//               items: ['North Zone', 'South Zone', 'East Zone', 'West Zone']
//                   .map((zone) => DropdownMenuItem(
//                         value: zone,
//                         child: Text(zone),
//                       ))
//                   .toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedZone = value;
//                 });
//               },
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton.icon(
//               onPressed: _refreshTaskList,
//               icon: Icon(Icons.refresh),
//               label: Text('Refresh'),
//             ),
//             SizedBox(height: 16.0),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: tasks.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               TaskDetailScreen(task: tasks[index]),
//                         ),
//                       );
//                       // }
//                     },
//                     child: TaskCard(task: tasks[index]),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _refreshTaskList() {
//     if (selectedZone != null) {
//       setState(() {
//         filteredTasks =
//             tasks.where((task) => task.zone == selectedZone).toList();
//       });
//     } else {
//       // Show a message if no zone is selected
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please select a zone to refresh the task list.'),
//         ),
//       );
//     }
//   }
// }
