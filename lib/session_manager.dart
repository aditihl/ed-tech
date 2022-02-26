// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SessionManager {
//   static const PREFIX = "io.habilelabs.edvance.pref";
//   static const String PREF_KEY_ROLE = '$PREFIX.PREF_KEY_ROLE';
//
//
//   static final SessionManager _singleton = new SessionManager._internal();
//
//   Future<SharedPreferences>? _mPref;
//
//   factory SessionManager() {
//     return _singleton;
//   }
//
//   SessionManager._internal() {
//     _initPref();
//   }
//
//   _initPref() {
//     _mPref = SharedPreferences.getInstance();
//   }
//
//   Future<bool> setStringData(String key, String value) async {
//     final SharedPreferences? _prefs = await _mPref;
//     return _prefs!.setString(key, value);
//   }
//
//   Future<String> getStringData(String key) async {
//     final SharedPreferences? _prefs = await _mPref;
//     return _prefs!.getString(key);
//   }
//
// Future<bool> setUserRole(String role){
//     return setStringData(PREF_KEY_ROLE, role);
// }
//
//
//   Future<String> getUserRole(String role){
//     return getStringData(PREF_KEY_ROLE);
//   }
// }
