import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:planet/src/features/planet/screens/planet_video_screen.dart';

const double _minHeight = 150;

class PlanetVideoListCard extends StatefulWidget {
  const PlanetVideoListCard({super.key, required this.content, required this.load});

  final dynamic content;
  final bool load;

  @override
  State<PlanetVideoListCard> createState() => _PlanetVideoListCardState();
}

class _PlanetVideoListCardState extends State<PlanetVideoListCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double? get _maxHeight => MediaQuery.of(context).size.height * 0.85;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double? _lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta! / _maxHeight!;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / _maxHeight!;
    if (flingVelocity < 0.0) {
      _controller.fling(velocity: max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _controller.fling(velocity: min(-2.0, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
            height: _lerp(_minHeight, _maxHeight!),
            right: 20,
            left: 20,
            bottom: 70,
            child: GestureDetector(
                onTap: _toggle,
                onVerticalDragUpdate: _handleDragUpdate,
                onVerticalDragEnd: _handleDragEnd,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(62),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF0E6CC7),
                        Color(0xFF4B0384),
                      ],
                    ),
                  ),
                  child: widget.load
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...widget.content['videos']
                                .map((e) => _buildItem(e))
                          ],
                        )
                      : Center(child: CircularProgressIndicator()),
                )));
      },
    );
  }

  Widget _buildItem(dynamic e) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.46),
          borderRadius: BorderRadius.circular(32)),
      padding: EdgeInsets.all(7),
      margin: EdgeInsets.all(13),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => PlanetVideoScreen(
              id: e['video_id']
            )
          )),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: e['thumbnails'][0]['url'].toString(),
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
