import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:review_system/constants/string_constants.dart';

class FormUtils {
  static Future<bool> getUserConfirmationOnSave() async {
    bool status = await Get.dialog(
      AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: true);
            },
            child: Text(CommonStringConstants.yes),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: Text(CommonStringConstants.no),
          )
        ],
        title: Text(CommonStringConstants.saveButtonWarnings),
      ),
    );

    return (status ?? false);
  }

  static closeKeyBoard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
