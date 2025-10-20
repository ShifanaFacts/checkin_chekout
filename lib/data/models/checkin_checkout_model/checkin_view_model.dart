import 'package:json_annotation/json_annotation.dart';

part 'checkin_view_model.g.dart';

@JsonSerializable()
class CheckinVieModel {
  String? JOBMST_DOCNO;
  String? JOBMST_DESC;
  String? COST_DESC;
  String? ACT_DOCNO;
  String? DEPT_DESC;
  String? checkintime;
  String? checkouttime;
  String? partytype;

  CheckinVieModel({
    this.checkintime,
    this.JOBMST_DOCNO,
    this.JOBMST_DESC,
    this.ACT_DOCNO,
    this.DEPT_DESC,
    this.checkouttime,
    this.partytype,
  });

  factory CheckinVieModel.fromJson(Map<String, dynamic> json) =>
      _$CheckinVieModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckinVieModelToJson(this);
}
