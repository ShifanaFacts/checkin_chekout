import 'package:json_annotation/json_annotation.dart';

part 'apiresponsemodel.g.dart';

@JsonSerializable()
class ApiResponseModel {
  dynamic data;

  ApiResponseModel({
    this.data,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseModelToJson(this);
}
