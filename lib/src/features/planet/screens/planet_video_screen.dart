import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlanetVideoScreen extends StatefulWidget {
  const PlanetVideoScreen({super.key, required this.id});

  final String id;
  @override
  State<PlanetVideoScreen> createState() => _PlanetVideoScreenState();
}

class _PlanetVideoScreenState extends State<PlanetVideoScreen> {
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
      body: Stack(
        children: [
          RiveAnimation.asset(
            'assets/rive/cosmos.riv',
            fit: BoxFit.cover,
          ),
          Center(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Color(0xFF09D721),
            ),
          ),
        ],
      ),
    );
  }
}
