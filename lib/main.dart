import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/constants/theme_constants.dart';
import 'package:review_system/screens/home/home_screen.dart';

//form yo system
void main() => runApp(
      GetMaterialApp(
        title: MainStringConstants.appName,
        theme: Themes.light,
        darkTheme: Themes.dark,
        home: Home(),
      ),
    );
