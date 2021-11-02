import 'package:flutter/material.dart';
import 'package:review_system/models/user_models/user.dart';

ValueNotifier<Map> videoIndex = ValueNotifier<Map>({
  "main": 1,
  "video": 1.0,
});

TabController homePageTabController;

User userGloabal;

String sheetURL =
    "https://script.google.com/macros/s/AKfycbzRL9acmsQ1-2Dj-s6En1Bdbl-QONEvBFPz5nbXK5tN5fz00n4-ajXzwiPugFD4XTKg/exec";
