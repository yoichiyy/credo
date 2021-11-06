import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:review_system/constants/global_constants.dart';
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
      // appBar: GeneralWidgets().appBar(SettingsPageStringConstants.appBarTitle),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FirebaseAuth.instance.currentUser == null
                ? SettingMenuOptionButton(
                    onTap: _handleLoginButtonBPress,
                    title: SettingsPageStringConstants.loginButtonTitle,
                  )
                : _buildLoggedInTab()
          ],
        ),
      ),
    );
  }

  _buildLoggedInTab() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(LoginFormStringConstants.loggedInMessage),
            SizedBox(
              height: 5,
            ),
            Text(LoginFormStringConstants.ID +
                " " +
                FirebaseAuth.instance.currentUser.email),
          ],
        ),
        Spacer(),
        TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            homePageTabController.animateTo(0);
          },
          child: Text(LoginFormStringConstants.logOutButtonTitle),
        )
      ],
    );
  }
}
