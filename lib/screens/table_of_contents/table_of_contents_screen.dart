import 'package:flutter/material.dart';
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:get/get.dart';
import 'package:review_system/widgets/general_widgets.dart';

class TableOfContents extends StatelessWidget {
  List _pages = List.generate(24, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          GeneralWidgets().appBar(TableOfContentsStringConstants.appBarTitle),
      body: ListView.builder(
        itemCount: _pages.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _buildContent(_pages[index]);
        },
      ),
    );
  }

  _buildContent(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          videoIndex.value = index;
          Get.back();
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[400],
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              Text(
                index.toString(),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                TableOfContentsStringConstants.getContentTitle(index),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
