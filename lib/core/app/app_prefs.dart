import 'dart:convert';

import 'package:apple_gadget_task/data/model/shared_pref_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_CRENDENTIAL= "PREFS_KEY_CRENDENTIAL";


class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<void> saveCredential(SharedPrefDto value) async {
    await _sharedPreferences.setString(PREFS_KEY_CRENDENTIAL, jsonEncode(value.toJson()));
  }

  SharedPrefDto? getCredential() {
    String? jsonString = _sharedPreferences.getString(PREFS_KEY_CRENDENTIAL);
    SharedPrefDto? data =
    jsonString != null ? SharedPrefDto.fromJson(jsonDecode(jsonString)) : null;
    return data;
  }

Future<void> logout() async {
  _sharedPreferences.remove(PREFS_KEY_CRENDENTIAL);
}
}