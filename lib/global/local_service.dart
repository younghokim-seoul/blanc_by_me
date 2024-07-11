import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static String PREF_PERMISSION = "PREF_PERMISSION";
  static String PREF_LOGIN_EMAIL = "PREF_LOGIN_EMAIL";
  static String PREF_LOGIN_PWD = "PREF_LOGIN_PWD";

  static void savePermission(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(PREF_PERMISSION, value);
  }

  static Future<String> getPermission() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(PREF_PERMISSION);
    if (value == null || value.isEmpty) {
      return "";
    }
    return value;
  }

  static void setUserPwd(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(PREF_LOGIN_PWD, value);
  }

  static Future<String> getUserPwd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(PREF_LOGIN_PWD);
    if (value == null || value.isEmpty) {
      return "";
    }
    return value;
  }

  static void setUserEmail(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(PREF_LOGIN_EMAIL, value);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(PREF_LOGIN_EMAIL);
    if (value == null || value.isEmpty) {
      return "";
    }
    return value;
  }
}
