import 'package:flutter/material.dart';
import 'package:review_system/constants/movie_links_constants.dart';
import 'package:review_system/constants/string_constants.dart';
import 'package:review_system/screens/home/evening/evening_feedback_form.dart';
import 'package:review_system/widgets/video/video_image_block.dart';

class EveningSection extends StatelessWidget {
  int mainIndex;
  double videoIndex;
  EveningSection(this.mainIndex, this.videoIndex);
  @override
  Widget build(BuildContext context) {
    return [8.5, 16.5, 24.5].contains(this.videoIndex)
        ? Center(
            child: Text(CommonStringConstants.noVideoWarning),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                VideoImageBlock(
                  videoUrl: MovieLinks.getEveningVideoLink(
                    this.mainIndex,
                    this.videoIndex,
                  ),
                ),
                EveningFeedbackForm(),
              ],
            ),
          );
  }
}
