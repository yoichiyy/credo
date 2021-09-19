import 'package:flutter/material.dart';
import 'package:review_system/constants/movie_links_constants.dart';
import 'package:review_system/screens/home/morning/morning_feedback_form.dart';
import 'package:review_system/screens/home/morning/morning_special_feedback_form.dart';
import 'package:review_system/widgets/video/video_image_block.dart';

class MorningSection extends StatelessWidget {
  int mainIndex;
  double videoIndex;
  MorningSection(this.mainIndex, this.videoIndex);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          VideoImageBlock(
            videoUrl: MovieLinks.getMorningVideoLinks(
              this.mainIndex,
              this.videoIndex,
            ),
          ),
          [8.5, 16.5, 24.5].contains(this.videoIndex)
              ? MorningSpecialFeedbackForm()
              : MorningFeedbackForm()
        ],
      ),
    );
  }
}
