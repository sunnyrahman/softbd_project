import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageController extends GetxController {
  StorageController._();

  static final StorageController _shared = StorageController._();
  factory StorageController.initialize(
          {required SharedPreferences pref, bool enableLog = false}) =>
      _shared
        ..prefs = pref
        .._isInitialized = true
        ..isLog = enableLog;

  factory StorageController.instance() {
  log("Okay here is shared!!");
    assert(_shared._isInitialized == true,
        "⚠️ Please initialize the controller first");
        
    return _shared;
  }

  late SharedPreferences prefs;
  bool? _isInitialized;
  bool isLog = false;
  StorageController({required this.prefs, bool enableLog = false}) : isLog = enableLog;

  

  String get email => prefs.getString("email") ?? "";
  void updateEmail(String email) {
    prefs.setString("email", email);
    update();
  }

  String get password => prefs.getString("password") ?? "";
  void updatepassword(String newPassword) {
    prefs.setString("password", newPassword);
    update();
  }

  String get fcmToken => prefs.getString("fcmToken") ?? "";
  void updateFCMToken(String newToken) {
    prefs.setString("fcmToken", newToken);
    update();
  }

  bool get permissionsAccepted => prefs.getBool("permissions") ?? false;
  void updatePermissionStatus(bool permission) {
    prefs.setBool("permissions", permission);
    update();
  }

  int? get userId => prefs.getInt('user_id');
  void updateUserId(int userId) => prefs.setInt('user_id', userId);

  bool _isUserLoggedIn = false;
  bool get userLoggedIn => prefs.getBool("user_loggedin") ?? _isUserLoggedIn;
  void updateUserLoginStatus(bool userLoggedin) {
    _isUserLoggedIn = userLoggedin;
    log("user loggedin: @=> $userLoggedIn");
    prefs.setBool("user_loggedin", userLoggedin);
    update();
  }

  String _userType = "notAUser";
  String get userType => prefs.getString("user_type") ?? _userType;
  void updateUserType(String userType) {
    _userType = userType;
    prefs.setString("user_type", userType);
    log("excat user type: @=> $userType");
    update();
  }
}
