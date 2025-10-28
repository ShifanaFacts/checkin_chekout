import 'package:json_annotation/json_annotation.dart';

part 'checkin_view_model.g.dart';

@JsonSerializable()
class CheckinVieModel {
  String? PJCTALLOC;
  String? EMPCOST;
  String? ACTALLOC;
  String? JOBMST_DESC;
  String? Dept;
  String? checkintime;
  String? checkouttime;
  String? partytype;

  CheckinVieModel({
    this.PJCTALLOC,
    this.EMPCOST,
    this.ACTALLOC,
    this.JOBMST_DESC,
    this.Dept,
    this.checkintime,
    this.checkouttime,
    this.partytype,
  });

  factory CheckinVieModel.fromJson(Map<String, dynamic> json) =>
      _$CheckinVieModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckinVieModelToJson(this);

  void operator [](String other) {}
}
