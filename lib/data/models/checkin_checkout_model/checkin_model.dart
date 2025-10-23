import 'package:json_annotation/json_annotation.dart';

part 'checkin_model.g.dart';

@JsonSerializable()
class CheckinModel {
  String? checkintime;
  String? checkintimedesc;
  bool? status;
  String? empdocno;

  CheckinModel({
    this.checkintime,
    this.checkintimedesc,
    this.status,
    this.empdocno,
  });

  factory CheckinModel.fromJson(Map<String, dynamic> json) {
    return _$CheckinModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CheckinModelToJson(this);
}
