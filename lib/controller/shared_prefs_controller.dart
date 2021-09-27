import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/models/user_models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

class SharedPrefs {
  // static String userUid;

  static void markLoggeddIn({@required User user}) {
    prefs.setBool("loggedIn", true);
    prefs.setString("uid", user.userId);
  }

  static bool isLoggedIn() {
    return prefs.getBool("loggedIn") ?? false;
  }

  static String getUserId() {
    return prefs.getString("uid") ?? "";
  }

  static void markLoggedOut() {
    prefs.setBool("loggedIn", false);
    prefs.setString("uid", "");
    userGloabal = null;
  }
}
