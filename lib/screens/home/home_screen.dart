import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/screens/home/evening_section.dart';
import 'package:review_system/screens/home/morning_section.dart';
import 'package:review_system/screens/table_of_contents/table_of_contents_screen.dart';
import 'package:review_system/screens/user_management/settings_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: _buildAppbar(),
          body: ValueListenableBuilder(
            valueListenable: videoIndex,
            builder: (BuildContext context, dynamic value, Widget child) {
              print(value);
              return TabBarView(
                children: [
                  MorningSection(value),
                  EveningSection(value),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      actions: [
        InkWell(
          onTap: () => Get.to(() => TableOfContents()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          ),
        ),
        InkWell(
          onTap: () => Get.to(() => Settings()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          ),
        )
      ],
      bottom: TabBar(
        tabs: [
          Tab(
            icon: Icon(FontAwesomeIcons.sun),
          ),
          Tab(
            icon: Icon(FontAwesomeIcons.moon),
          ),
        ],
      ),
      title: Text(HomeStringConstants.appBarTitle),
    );
  }
}
