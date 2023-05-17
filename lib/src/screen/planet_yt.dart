import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlanetYt extends StatefulWidget {
  const PlanetYt({super.key});

  @override
  State<PlanetYt> createState() => _PlanetYtState();
}

class _PlanetYtState extends State<PlanetYt> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'gQDByCdjUXw',
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
