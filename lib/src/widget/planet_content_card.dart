import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';

const double minHeight = 150;
const double iconStartSize = 44;
const double iconEndSize = 120;
const double iconStartMarginTop = 36;
const double iconEndMarginTop = 80;
const double iconsVerticalSpacing = 24;
const double iconsHorizontalSpacing = 16;

class ContentCard extends StatefulWidget {
  ContentCard({super.key, required this.content, required this.load});

  final dynamic content;
  final bool load;

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double? get maxHeight => MediaQuery.of(context).size.height * 0.85;

  double? get headerTopMargin =>
      lerp(20, 20 + MediaQuery.of(context).padding.top);

  double? get headerFontSize => lerp(14, 24);

  double? get itemBorderRadius => lerp(8, 24);

  double? get iconLeftBorderRadius => itemBorderRadius;

  double? get iconRightBorderRadius => lerp(8, 0);

  double? get iconSize => lerp(iconStartSize, iconEndSize);

  double iconTopMargin(int index) =>
      lerp(iconStartMarginTop,
          iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize))! +
      headerTopMargin!;

  double? iconLeftMargin(int index) =>
      lerp(index * (iconsHorizontalSpacing + iconStartSize), 0);

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

  double? lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta! / maxHeight!;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight!;
    if (flingVelocity < 0.0)
      _controller.fling(velocity: max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: min(-2.0, -flingVelocity));
    else
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
            height: lerp(minHeight, maxHeight!),
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
                  child: Stack(
                    children: [
                      widget.load
                          ? ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                // ...[1, 2, 3, 4].map((e) => _builditem())
                                ...widget.content['contents']
                                    .map((e) => _builditem(e))
                              ],
                            )
                          : CircularProgressIndicator()
                    ],
                  ),
                )));
      },
    );
  }

  Widget _builditem(dynamic e) {
    // widget.content['contents'];
    // Post['contents'][0]['video']['thumbnails'][0]['url']
    int index = widget.content['contents'].indexOf(e);

    print(e['video']['thumbnails'][0]['url'].toString());
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.46),
          borderRadius: BorderRadius.circular(32)),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(13),
      // child: Image.network(
      //   'https://i.ytimg.com/vi/B1zYYFJC87A/hq720_2.jpg?sqp=-oaymwE2COgCEMoBSFXyq4qpAygIARUAAIhCGABwAcABBvABAfgBtgiAAoAPigIMCAAQARhyIF4oRTAP&rs=AOn4CLDvzbQKup-8zWicAySOgy4CGduv1w',
      //   errorBuilder:
      //       (BuildContext context, Object exception, StackTrace? stackTrace) {
      //     return Text('Failed to load image');
      //   },
      // ),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        width: 500,
        height: 600,
        imageUrl: e['video']['thumbnails'][0]['url'].toString(),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.book),
      ),
    );
  }
}
