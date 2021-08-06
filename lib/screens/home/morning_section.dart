import 'package:flutter/material.dart';
import 'package:review_system/constants/movie_links_constants.dart';
import 'package:review_system/screens/home/feedback_form.dart';
import 'package:review_system/screens/home/video_screen.dart';

class MorningSection extends StatelessWidget {
  int videoIndex;
  MorningSection(this.videoIndex);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoScreen(
          videoLink: MorningVideosLinks.getVideoLinks(this.videoIndex),
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
