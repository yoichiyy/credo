import 'package:flutter/material.dart';
import 'package:review_system/constants/movie_links_constants.dart';
import 'package:review_system/screens/home/feedback_form.dart';
import 'package:review_system/widgets/video/video_image_block.dart';

class MorningSection extends StatelessWidget {
  int videoIndex;
  MorningSection(this.videoIndex);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          VideoImageBlock(
            videoUrl: MorningVideosLinks.getVideoLinks(this.videoIndex),
          ),
          FeedbackForm()
        ],
      ),
    );
  }
}
