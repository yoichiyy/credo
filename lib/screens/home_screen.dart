import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:review_system/constants/string_constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (i) {
              if (i == 0) Get.changeThemeMode(ThemeMode.light);
              if (i == 1) Get.changeThemeMode(ThemeMode.dark);
            },
            tabs: [
              Tab(
                icon: Icon(FontAwesomeIcons.sun),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.moon),
              ),
            ],
          ),
          title: Text(StringConstants.appName),
        ),
        body: TabBarView(
          children: [
            Text(
              StringConstants.homeTabMorning,
            ),
            Text(
              StringConstants.homeTabEvening,
            ),
          ],
        ),
      ),
    ));
  }
}
