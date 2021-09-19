import 'package:flutter/material.dart';
import 'package:review_system/models/user_models/user.dart';

ValueNotifier<Map> videoIndex = ValueNotifier<Map>({
  "main": 1,
  "video": 1.0,
});

TabController homePageTabController;

User userGloabal;

String sheetURL =
    "https://script.google.com/macros/s/AKfycbxePy_F77xK5RAjGz45fdGGvo9LGnsnwJ1_rodB4ReoUWrYFws21EBp9dsQltRPQExl/exec";
