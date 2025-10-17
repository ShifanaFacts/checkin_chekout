import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  String? userdesig;
  String? userdept;
  String? employeeId;
  String? department;
  String? username;
  String? DID;
  String? profileImage;

  UserDataModel({
    required this.userdesig,
    required this.userdept,
    required this.employeeId,
    required this.department,
    required this.username,
    required this.DID,
    required this.profileImage,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return _$UserDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}
