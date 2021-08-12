import 'package:flutter/material.dart';

class SettingMenuOptionButton extends StatelessWidget {
  String title;
  Function onTap;
  SettingMenuOptionButton({this.onTap, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: this.onTap,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(this.title),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
