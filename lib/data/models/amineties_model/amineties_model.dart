import 'package:checkin_checkout/data/models/valueobjectmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'amineties_model.g.dart';

@JsonSerializable()
class AminetiesModel extends ListItemModel {
  @override
  String code;
  @override
  String desc;
  String? unit;
  int? qty;

  AminetiesModel({required this.code, required this.desc, this.unit, this.qty});

  factory AminetiesModel.fromJson(Map<String, dynamic> json) {
    return _$AminetiesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AminetiesModelToJson(this);
}
