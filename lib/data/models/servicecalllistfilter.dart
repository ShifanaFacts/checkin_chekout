import 'package:checkin_checkout/data/models/property_model/property_model.dart';

class ServiceCallListFilter {
  // Define the fields as mutable if needed (change final to non-final if values are expected to change)
  DateTime fromdate;
  DateTime todate;
  PropertyModel? property;

  // Private constructor
  ServiceCallListFilter._internal()
      : fromdate = DateTime.now().add(const Duration(days: -60)),
        todate = DateTime.now(),
        property = null;

  static final ServiceCallListFilter _instance =
      ServiceCallListFilter._internal();

  factory ServiceCallListFilter() {
    return _instance;
  }
}
