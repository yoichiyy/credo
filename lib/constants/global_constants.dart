import 'package:flutter/material.dart';
import 'package:review_system/models/user_models/user.dart';

ValueNotifier<Map> videoIndex = ValueNotifier<Map>({
  "main": 1,
  "video": 1.0,
});

TabController homePageTabController;

User userGloabal;

String sheetURL =
    "https://script.google.com/macros/s/AKfycbwmV273Q9_eC2zGJWFJk_TSaHPyeOSASLW5qXwAE8nafEd-r4KJER8_WrAC5vAz4ds8/exec";
