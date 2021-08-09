import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:review_system/screens/home/video_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:get/get.dart';

class VideoImageBlock extends StatelessWidget {
  String videoUrl;

  String _imageURL;

  VideoImageBlock({this.videoUrl}) {
    this._imageURL = YoutubePlayer.convertUrlToId(videoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => VideoScreen(
              videoLink: this.videoUrl,
            ));
      },
      child: CachedNetworkImage(
        imageUrl: "https://img.youtube.com/vi/$_imageURL/0.jpg",
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200,
      ),
    );
  }
}
