import 'package:checkin_checkout/data/models/driver_schedule_model/driver_schedule_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver_schedule_model_data.g.dart';

@JsonSerializable()
class DriverScheduleModelData {
  List<DriverScheduleModel>? dataset;

  DriverScheduleModelData({this.dataset});

  factory DriverScheduleModelData.fromJson(Map<String, dynamic> json) =>
      _$DriverScheduleModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$DriverScheduleModelDataToJson(this);
}
