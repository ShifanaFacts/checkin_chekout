import 'package:checkin_checkout/data/models/valueobjectmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'amenities_model.g.dart';

@JsonSerializable()
class AmenitiesModel extends ListItemModel {
  @override
  String code;
  @override
  String desc;
  String? unit;
  int? qty;

  AmenitiesModel({required this.code, required this.desc, this.unit, this.qty});

  factory AmenitiesModel.fromJson(Map<String, dynamic> json) {
    return _$AmenitiesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AmenitiesModelToJson(this);
}
