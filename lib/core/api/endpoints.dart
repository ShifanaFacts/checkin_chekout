import 'package:checkin_checkout/core/utils/base_url_service.dart';

class ApiEndPoints {
  static Future<String> loginUrl() async {
    final baseurl = await BaseUrlService.getBaseUrl();
    return "$baseurl/oauth/token";
  }

  static Future<String> logoutUrl() async {
    final baseurl = await BaseUrlService.getBaseUrl();
    return "$baseurl/api/proc";
  }

  static Future<String> getOpenSectionUrl() async {
    final baseurl = await BaseUrlService.getBaseUrl();
    return "$baseurl/api/proc";
  }
}
