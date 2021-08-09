import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.white,
    buttonColor: Colors.blue,
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.yellow),
    tabBarTheme: TabBarTheme(),
  );
  static final dark = ThemeData(
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    buttonColor: Colors.red,
    primaryColor: Colors.grey,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.amber),
  );
}
