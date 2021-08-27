import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/screens/home/evening/evening_section.dart';
import 'package:review_system/screens/home/morning/morning_section.dart';
import 'package:review_system/screens/table_of_contents/table_of_contents_screen.dart';
import 'package:review_system/screens/user_management/settings_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    homePageTabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: _buildAppbar(),
        body: ValueListenableBuilder(
          valueListenable: videoIndex,
          builder: (BuildContext context, dynamic value, Widget child) {
            print(value);
            return TabBarView(
              controller: homePageTabController,
              children: [
                MorningSection(value["main"], value['video']),
                EveningSection(value["main"], value['video']),
                TableOfContents(),
                Settings(),
              ],
            );
          },
        ),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: TabBar(
        controller: homePageTabController,
        tabs: [
          Tab(
            icon: Icon(FontAwesomeIcons.cloudSun),
          ),
          Tab(
            icon: Icon(FontAwesomeIcons.cloudMoon),
          ),
          Tab(
            icon: Icon(FontAwesomeIcons.bars),
          ),
          Tab(
            icon: Icon(FontAwesomeIcons.cog),
          ),
        ],
      ),
      // actions: [
      //   InkWell(
      //     onTap: () => Get.to(() => TableOfContents()),
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(Icons.menu),
      //     ),
      //   ),
      //   InkWell(
      //     onTap: () => Get.to(() => Settings()),
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(Icons.settings),
      //     ),
      //   )
      // ],
      // bottom:
      // title: Text(HomeStringConstants.appBarTitle),
    );
  }
}
