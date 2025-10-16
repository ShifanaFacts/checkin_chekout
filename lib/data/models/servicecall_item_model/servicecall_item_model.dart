import 'package:checkin_checkout/data/models/amenities_model/amenities_model.dart';
import 'package:checkin_checkout/data/models/linen_model/linen_model.dart';
import 'package:checkin_checkout/data/models/property_model/property_model.dart';
import 'package:checkin_checkout/data/models/servicetype_model/servicetype_model.dart';
import 'package:checkin_checkout/data/models/reporting_model/reporting_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'servicecall_item_model.g.dart';

@JsonSerializable()
class ServiceCallItemModel {
  String? servicedoctype;
  String? serviceNumber;
  DateTime? serviceDateTime;
  String? property;
  String? status;
  String? servicetypes;
  String? amenitiesdetails;
  String? linendetails;
  String? crewName;
  DateTime? scheduleddatetime;
  List<ServiceTypeModel>? servicetypeslist;
  List<AmenitiesModel>? aminetieslist;
  List<LinenModel>? linenlist;
  List<Reportingmodel>? reportlist;
  PropertyModel? propertyobject;
  String? trackingStatus;
  String? taskStartedTime;
  String? taskEndedTime;
  double? rating;

  ServiceCallItemModel(
      {this.servicedoctype,
      this.serviceNumber,
      this.serviceDateTime,
      this.property,
      this.status,
      this.servicetypes,
      this.amenitiesdetails,
      this.linendetails,
      this.crewName,
      this.scheduleddatetime,
      this.servicetypeslist,
      this.aminetieslist,
      this.linenlist,
      this.reportlist,
      this.propertyobject,
      this.trackingStatus,
      this.taskStartedTime,
      this.taskEndedTime,
      this.rating});

  factory ServiceCallItemModel.fromJson(Map<String, dynamic> json) {
    return _$ServiceCallItemModelFromJson(json);
  }

  factory ServiceCallItemModel.fromJsontables(Map<String, dynamic> json) {
    List service = json['Table'];
    dynamic table;
    if (service.isNotEmpty) table = json['Table'][0];
    return ServiceCallItemModel(
      servicedoctype: table != null ? table['servicedoctype'] : "",
      trackingStatus: table != null ? table['trackingStatus'] : "",
      taskStartedTime: table != null ? table['taskStartTime'] : "",
      taskEndedTime: table != null ? table['taskEndTime'] : "",
      serviceNumber: table != null ? table['serviceNumber'] : "",
      serviceDateTime: table != null
          ? DateTime.parse(table['serviceDateTime'])
          : DateTime.now(),
      property: table != null ? table['property'] : "",
      status: table != null ? table['status'] : "",
      servicetypes: table != null ? table['servicetypes'] : "",
      amenitiesdetails: table != null ? table['amenitiesdetails'] : "",
      linendetails: table != null ? table['linendetails'] : "",
      crewName: table != null ? table['crewName'] : "",
      rating: table != null ? table['rating'] : null,
      scheduleddatetime: table != null
          ? DateTime.parse(table['scheduleddatetime'])
          : DateTime.now(),
      servicetypeslist: (json['Table1'] as List<dynamic>?)
          ?.map((item) => ServiceTypeModel.fromJson(item))
          .toList(),
      aminetieslist: (json['Table2'] as List<dynamic>?)
          ?.map((item) => AmenitiesModel.fromJson(item))
          .toList(),
      linenlist: (json['Table4'] as List<dynamic>?)
          ?.map((item) => LinenModel.fromJson(item))
          .toList(),
      reportlist: (json['Table5'] as List<dynamic>?)
          ?.map((item) => Reportingmodel.fromJson(item))
          .toList(),
      propertyobject: (json['Table3'] as List<dynamic>?)?.map((item) {
        return PropertyModel.fromJson(item);
      }).firstOrNull,
    );
  }

  Map<String, dynamic> toJson() => _$ServiceCallItemModelToJson(this);
}
