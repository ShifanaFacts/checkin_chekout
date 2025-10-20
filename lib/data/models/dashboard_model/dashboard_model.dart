import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel {
  @JsonKey(name: 'jsonResult')
  List<DashboardItem>? jsonResult;

  DashboardModel({this.jsonResult});

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    // Handle case where jsonResult is a String
    if (json['jsonResult'] is String) {
      try {
        // Decode the JSON string into a List<dynamic>
        final decoded = jsonDecode(json['jsonResult'] as String);
        if (decoded is List) {
          json['jsonResult'] = decoded;
        } else {
          throw FormatException('jsonResult is not a valid JSON array');
        }
      } catch (e) {
        print('Error decoding jsonResult: $e');
        json['jsonResult'] = null; // or handle as needed
      }
    }
    return _$DashboardModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);
}

@JsonSerializable()
class DashboardItem {
  @JsonKey(name: 'Key')
  String? key;

  @JsonKey(name: 'Description')
  String? description;

  DashboardItem({this.key, this.description});

  factory DashboardItem.fromJson(Map<String, dynamic> json) =>
      _$DashboardItemFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardItemToJson(this);
}
