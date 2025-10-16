class ScheduledTaskModel {
  final String description;
  final String location;
  final String details;
  final String personName;
  final String status;
  final String crewName;
  final String pickupPlace;
  final DateTime destinationReachTime;
  final DateTime scheduledDateTime;
  final DateTime pickupTime;
  final DateTime serviceTime;
  final DateTime endTime;
  final bool isCompleted;

  ScheduledTaskModel({
    required this.description,
    required this.location,
    required this.details,
    required this.personName,
    required this.status,
    required this.crewName,
    required this.pickupPlace,
    required this.destinationReachTime,
    required this.scheduledDateTime,
    required this.pickupTime,
    required this.serviceTime,
    required this.endTime,
    required this.isCompleted,
  });
}
