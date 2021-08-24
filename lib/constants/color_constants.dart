import 'package:flutter/material.dart';

class FeedbackFormFieldColorConstants {
  static getFeelingColors(int value) {
    List<Color> _options = [
      Color(0xffff8c00),
      Color(0xff87ceeb),
      Color(0xff5f9ea0),
      Color(0xff708090),
      Color(0xff9400d3),
    ];
    return _options[value];
  }

  static getMotivationColors(int value) {
    List<Color> _options = [
      Color(0xffffdead),
      Color(0xffff8c00),
      Color(0xffadff2f),
      Color(0xff5f9ea0),
      Color(0xff9400d3),
      Color(0xfffa8072),
      Color(0xffafeeee),
      Color(0xff87ceeb),
      Color(0xffffff00),
      Color(0xff708090),
      Color(0xfff0fff0),
    ];
    return _options[value];
  }
}
