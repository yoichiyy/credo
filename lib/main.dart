import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/constants/theme_constants.dart';
import 'package:review_system/screens/home_screen.dart';

void main() => runApp(
      GetMaterialApp(
        title: StringConstants.appName,
        theme: Themes.light,
        darkTheme: Themes.dark,
        home: Home(),
      ),
    );
