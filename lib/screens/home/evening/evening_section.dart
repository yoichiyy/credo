import 'package:flutter/material.dart';
import 'package:review_system/constants/movie_links_constants.dart';
import 'package:review_system/screens/home/evening/evening_feedback_form.dart';
import 'package:review_system/widgets/video/video_image_block.dart';

class EveningSection extends StatelessWidget {
  int mainIndex;
  int videoIndex;
  EveningSection(this.mainIndex, this.videoIndex);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          VideoImageBlock(
            videoUrl:
                MovieLinks.getEveningVideoLink(this.mainIndex, this.videoIndex),
          ),
          EveningFeedbackForm(),
        ],
      ),
    );
  }
}
