import 'package:checkin_checkout/data/models/valueobjectmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'linen_model.g.dart';

@JsonSerializable()
class LinenModel extends ListItemModel {
  @override
  String code;
  @override
  String desc;
  String? unit;
  int? qty;

  LinenModel({required this.code, required this.desc, this.unit, this.qty});

  factory LinenModel.fromJson(Map<String, dynamic> json) {
    return _$LinenModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LinenModelToJson(this);
}
