import 'package:flutter/material.dart';
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/constants/movie_title_constants.dart';

class TableOfContents extends StatefulWidget {
  @override
  _TableOfContentsState createState() => _TableOfContentsState();
}

class _TableOfContentsState extends State<TableOfContents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: MovieTitleConstants().mainIndexes.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMainTitle(index),
              _buildListViewOfContent(MovieTitleConstants().mainIndexes[index]),
            ],
          );
        },
      ),
    );
  }

  _buildMainTitle(index) {
    return Container(
      width: double.infinity,
      color: Colors.brown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              MovieTitleConstants.getMainTitle(index),
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  _buildListViewOfContent(mainIndex) {
    return ListView.builder(
      itemCount: MovieTitleConstants().movieIndexes.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _buildContent(mainIndex, index);
      },
    );
  }

  _buildContent(mainIndex, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          videoIndex.value = index;
          // Get.back();
          homePageTabController.animateTo(0);
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                MovieTitleConstants().movieIndexes[index].toString(),
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  MovieTitleConstants.getContentTitle(mainIndex, index),
                  textScaleFactor: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
