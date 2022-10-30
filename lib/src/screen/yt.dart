import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  String id;

  VideoScreen({required this.id});
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 244, 243, 243), //change your color here
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color(0xE0000000).withOpacity(1),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 56.0),
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            aspectRatio: 4 / 3,
            progressIndicatorColor: Color.fromARGB(255, 9, 215, 33),
            onReady: () {
              print('Player is ready.');
            },
          ),
        ));
  }
}
