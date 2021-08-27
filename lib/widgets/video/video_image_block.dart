import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:review_system/screens/home/video_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:get/get.dart';

class VideoImageBlock extends StatefulWidget {
  String videoUrl;
  String _imageURL;

  VideoImageBlock({this.videoUrl}) {
    this._imageURL = YoutubePlayer.convertUrlToId(videoUrl);
  }

  @override
  _VideoImageBlockState createState() => _VideoImageBlockState();
}

class _VideoImageBlockState extends State<VideoImageBlock> {
  YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl),
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        // hideControls: true,
      ),
    );
  }

  @override
  void deactivate() {
    _youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Get.to(() => VideoScreen(
      //         videoLink: this.widget.videoUrl,
      //       ));
      // },
      // child: CachedNetworkImage(
      //   imageUrl: "https://img.youtube.com/vi/${widget._imageURL}/0.jpg",
      //   fit: BoxFit.fill,
      //   width: double.infinity,
      // ),
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _youtubePlayerController,
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
            ],
          );
        },
      ),
    );
  }
}
