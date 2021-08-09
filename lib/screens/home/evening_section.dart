import 'package:flutter/material.dart';
import 'package:review_system/constants/movie_links_constants.dart';
import 'package:review_system/screens/home/feedback_form.dart';
import 'package:review_system/screens/home/video_screen.dart';
import 'package:review_system/widgets/video/video_image_block.dart';

class EveningSection extends StatelessWidget {
  int videoIndex;
  EveningSection(this.videoIndex);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoImageBlock(
          videoUrl: EveingVideosLinks.getVideoLinks(this.videoIndex),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView(
            shrinkWrap: true,
            children: [FeedbackForm()],
          ),
        ),
      ],
    );
  }
}
