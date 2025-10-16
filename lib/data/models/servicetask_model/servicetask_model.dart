import 'package:json_annotation/json_annotation.dart';

part 'servicetask_model.g.dart';

@JsonSerializable()
class ServiceTaskModel {

   @JsonKey(name: 'tmp_name')
  String? name;
  @JsonKey(name: 'tmp_imageType')
  String? imageType;
  @JsonKey(name: 'tmp_attkey')
  String? attkey;
  @JsonKey(name: 'tmp_uploadTime')
  DateTime? uploadTime;
  @JsonKey(name: 'tmp_imagePath')
  String? imagePath;

  ServiceTaskModel({
    required this.name,
    required this.imageType,
    required this.attkey,
    this.uploadTime,
    this.imagePath,
   
  });



  factory ServiceTaskModel.fromJson(Map<String, dynamic> json) {
    return _$ServiceTaskModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ServiceTaskModelToJson(this);
}








