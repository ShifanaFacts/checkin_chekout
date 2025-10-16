import 'package:json_annotation/json_annotation.dart';

import 'linen_model.dart';

part 'linen_model_data.g.dart';

@JsonSerializable()
class LinenModelData {
  List<LinenModel>? dataset;

  LinenModelData({this.dataset});

  factory LinenModelData.fromJson(Map<String, dynamic> json) =>
      _$LinenModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$LinenModelDataToJson(this);
}
