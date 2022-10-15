import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'yAzRJTI1EJo',
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
            color: Color.fromARGB(255, 10, 10, 10), //change your color here
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color.fromARGB(0, 226, 225, 225).withOpacity(1),
        ),
        body: Stack(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            color: Color.fromARGB(255, 207, 22, 22),
            height: double.infinity,
            child: Padding(
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
            ),
          ),
        ]));
  }
}