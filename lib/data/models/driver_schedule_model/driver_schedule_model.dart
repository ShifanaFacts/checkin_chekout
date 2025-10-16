import 'package:json_annotation/json_annotation.dart';

part 'driver_schedule_model.g.dart';

@JsonSerializable()
class DriverScheduleModel {
  @JsonKey(name: 'tmp_docdate')
  String? serviceTime;
  @JsonKey(name: 'tmp_location')
  String? location;
  @JsonKey(name: 'pickupTime')
  String? pickupTime;
  @JsonKey(name: 'dropoffTime')
  String? dropoffTime;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'tmp_crew_name')
  String? crewName;
  // @JsonKey(name: 'scheduledDateTime ')
  // String? scheduledDateTime;
  // @JsonKey(name: 'serviceTime  ')
  // String? serviceTime;
  // @JsonKey(name: 'isCompleted ')
  // String? isCompleted;
  // @JsonKey(name: 'personName  ')
  // String? personName;
  // @JsonKey(name: 'endTime  ')
  // String? endTime;



  				

  DriverScheduleModel({
    this.serviceTime,
    this.location,
    this.pickupTime,
    this.dropoffTime,
    this.status,
    this.crewName,
    // this.scheduledDateTime,
    // this.serviceTime,
    // this.isCompleted,
    // this.personName,
    // this.endTime,
  });

  factory DriverScheduleModel.fromJson(Map<String, dynamic> json) {
    return _$DriverScheduleModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DriverScheduleModelToJson(this);
}
