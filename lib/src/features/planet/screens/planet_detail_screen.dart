import 'package:flutter/material.dart';
import 'package:planet/src/features/planet/services/youtube_service.dart';
import 'package:planet/src/features/planet/widgets/planet_detail_hero.dart';
import 'package:planet/src/features/planet/widgets/planet_video_list_card.dart';
import 'package:rive/rive.dart';

class PlanetDetailScreen extends StatefulWidget {
  const PlanetDetailScreen(
      {super.key,
      required this.tag,
      required this.name,
      required this.desc,
      required this.position});

  final String tag, name, desc;
  final String position;

  @override
  State<PlanetDetailScreen> createState() => _PlanetDetailScreenState();
}

class _PlanetDetailScreenState extends State<PlanetDetailScreen> {
  dynamic _videos;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadVideos();
  }

  void _loadVideos() async {
    _videos = await YoutubeService().fetchVideosForPlanet(widget.name);
    if (_videos != null) {
      setState(() => _isLoading = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          RiveAnimation.asset(
            'assets/rive/cosmos.riv',
            fit: BoxFit.cover,
          ),
          PlanetDetailHero(
            tag: widget.tag,
            desc: widget.desc,
            position: widget.position,
          ),
          PlanetVideoListCard(content: _videos, load: _isLoading),
        ],
      ),
    );
  }
}
