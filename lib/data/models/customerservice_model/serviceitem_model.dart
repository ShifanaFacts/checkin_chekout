import 'package:checkin_checkout/data/models/valueobjectmodel.dart';

class ServiceItem {
  final String serviceNumber;
  final String property;
  final DateTime serviceDateTime;
  final String status;
  List<ValueObjectModel> selectedServiceNames = [];
  List<ValueObjectModel> selectedAmenities = [];
  List<ValueObjectModel> selectedLinen = [];

  ServiceItem({
    required this.serviceNumber,
    required this.property,
    required this.serviceDateTime,
    required this.status,
    required this.selectedServiceNames,
    required this.selectedAmenities,
    required this.selectedLinen,
  });
}
