import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/widgets/forms/feedback_form.dart';

class Home extends StatelessWidget {
  _changeTheme(i) {
    if (i == 0) Get.changeThemeMode(ThemeMode.light);
    if (i == 1) Get.changeThemeMode(ThemeMode.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              // onTap: _changeTheme,
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.star),
                ),
                // Tab(
                //   icon: Icon(FontAwesomeIcons.video),
                // ),
              ],
            ),
            title: Text(StringConstants.appName),
          ),
          body: TabBarView(
            children: [
              FeedbackForm(),
              // FeedbackForm(),
            ],
          ),
        ),
      ),
    );
  }
}
