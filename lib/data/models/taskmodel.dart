class Task {
  final String customerName;
  final String taskDescription;
  final String taskType;
  final String taskTime;
  final String zone;
  final bool isCompleted;

  Task(this.customerName, this.taskDescription, this.taskType, this.taskTime,
      this.zone, this.isCompleted);
}

// const exportTasks =  List<Task> [
//     Task('Customer A', 'Fix server issue', 'Urgent', '10:00 AM', 'North Zone',
//         true),
//     Task('Customer B', 'Install new software', 'Normal', '11:00 AM',
//         'North Zone', false),
//     Task('Customer C', 'Network configuration', 'High', '12:00 PM',
//         'South Zone', true),
//     Task('Customer D', 'System upgrade', 'Normal', '01:00 PM', 'East Zone',
//         false),
//     Task('Customer E', 'Backup data', 'Low', '02:00 PM', 'West Zone', true),
//   ];
