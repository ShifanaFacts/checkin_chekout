import 'package:json_annotation/json_annotation.dart';

part 'loggedUser_data_model.g.dart';

@JsonSerializable()
class LoggedUserModel {
  String? Emp_Name;
  String? Designation;
  String? Department;
  String? Division;
  String? Employe_id;

  LoggedUserModel({
    this.Emp_Name,
    this.Designation,
    this.Department,
    this.Division,
    this.Employe_id,
  });

  factory LoggedUserModel.fromJson(Map<String, dynamic> json) {
    return _$LoggedUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoggedUserModelToJson(this);
}
