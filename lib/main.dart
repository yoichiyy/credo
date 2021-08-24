import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/constants/theme_constants.dart';
import 'package:review_system/screens/home/home_screen.dart';

//form yo system
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    GetMaterialApp(
      title: MainStringConstants.appName,
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: Home(),
    ),
  );
}
