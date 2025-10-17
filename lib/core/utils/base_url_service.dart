import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseUrlService {
  static const String _key = 'baseurl';

  /// Save base URL
  static Future<void> saveBaseUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, url);
  }

  /// Load base URL (returns '' if not set)
  static Future<String> getBaseUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? '';
  }

  /// Check and redirect if base URL missing
  static Future<void> ensureBaseUrl(BuildContext context) async {
    final url = await getBaseUrl();
    if (url.isEmpty) {
      // Navigate to settings page
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil('/settings', (route) => false);
    }
  }
}
