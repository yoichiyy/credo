import 'package:flutter/material.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/screens/user_management/login_screen.dart';
import 'package:review_system/widgets/general_widgets.dart';

import 'package:get/get.dart';
import 'package:review_system/widgets/settings_widgets/menu_option_button.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  _handleLoginButtonBPress() {
    Get.to(() => LoginForm());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralWidgets().appBar(SettingsPageStringConstants.appBarTitle),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingMenuOptionButton(
              onTap: _handleLoginButtonBPress,
              title: SettingsPageStringConstants.loginButtonTitle,
            )
          ],
        ),
      ),
    );
  }
}
