import 'package:json_annotation/json_annotation.dart';

import 'amineties_model.dart';

part 'amineties_model_data.g.dart';

@JsonSerializable()
class AminetiesModelData {
  List<AminetiesModel>? dataset;

  AminetiesModelData({this.dataset});

  factory AminetiesModelData.fromJson(Map<String, dynamic> json) =>
      _$AminetiesModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$AminetiesModelDataToJson(this);
}
