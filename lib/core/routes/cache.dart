import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const String secretKeyOfEncrip = 'your_secret_key';

  static Future<void> saveDataCompanyUser(
      {String? company, String? companyUrl,}) async {
    try {
      final data = {
        'companyUrl': companyUrl ?? '',
        'company': company ?? '',
       
      };
      final jsonString = json.encode(data);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(secretKeyOfEncrip, jsonString);
    } catch (e) {
      // Handle JSON encoding error
      // print('Error saving data: $e');
    }
  }

  static Future<Map<String, dynamic>?> getDataCompanyUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(secretKeyOfEncrip);
      if (jsonString != null) {
        return json.decode(jsonString) as Map<String, dynamic>;
      } else {
        return null; // Return null if no data is found
      }
    } catch (e) {
      // Handle JSON decoding error
      // print('Error retrieving data: $e');
      return null;
    }
  }

  static Future<void> clearDataCompanyUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(secretKeyOfEncrip);
  }
}
