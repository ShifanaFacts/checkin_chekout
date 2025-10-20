import 'package:json_annotation/json_annotation.dart';

part 'loggedUser_data_model.g.dart';

@JsonSerializable()
class LoggedUserModel {
  String? Emp_Name;
  String? Designation;
  String? Department;
  String? Division;

  LoggedUserModel({
    this.Emp_Name,
    this.Designation,
    this.Department,
    this.Division,
  });

  factory LoggedUserModel.fromJson(Map<String, dynamic> json) {
    return _$LoggedUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoggedUserModelToJson(this);
}
