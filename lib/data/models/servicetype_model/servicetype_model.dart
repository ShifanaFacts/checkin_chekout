import 'package:checkin_checkout/data/models/amenities_model/amenities_model.dart';
import 'package:checkin_checkout/data/models/valueobjectmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'servicetype_model.g.dart';

@JsonSerializable()
class ServiceTypeModel extends ListItemModel {
  @override
  String code;
  @override
  String desc;
  List<AmenitiesModel>? attachments;

  ServiceTypeModel({required this.code, required this.desc, this.attachments});

  factory ServiceTypeModel.fromJson(Map<String, dynamic> json) {
    return _$ServiceTypeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServiceTypeModelToJson(this);
}
