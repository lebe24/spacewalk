import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:planet/src/screen/DetailPage.dart';
import 'package:planet/memo/Explore.dart';

class Card3d extends StatefulWidget {
  Card3d({
    super.key,
    required this.number,
    required this.index,
    required this.planets,
  });

  dynamic planets;
  final int number;
  int index;

  @override
  State<Card3d> createState() => _Card3dState();
}

class _Card3dState extends State<Card3d> {
  @override
  Widget build(BuildContext context) {
    return Gallery3D(
      itemCount: widget.number,
      // ellipseHeight: 100,
      width: 400,
      height: 300,
      isClip: false,
      itemConfig: const GalleryItemConfig(
        width: 230,
        height: 600,
        radius: 0,
        isShowTransformMask: false,
        // shadows: [
        //   BoxShadow(
        //       color: Color(0x90000000), offset: Offset(2, 0), blurRadius: 5)
        // ]
      ),
      currentIndex: widget.index,
      onItemChanged: (index) {
        setState(() {
          widget.index = index;
        });
      },
      onClickItem: (index) => print("currentIndex:$index"),
      itemBuilder: ((context, index) {
        // print(widget.planets[index]);
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, a, b) => DetailPage(
                        infoPlanet: widget.planets[index],
                        num: index+ 1
             )),
            );
          },
          child: PlanetCard(widget.planets[index]['Planet'],
              index+1,
              widget.planets[index]['img']),
        );
      }),
    );
  }
}

Widget PlanetCard(String name, int pos, String iconImage) {
  return Stack(
    children: [
      Column(
        children: [
          const SizedBox(height: 50),
          Container(
            width: 750,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 27,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Space',
                      style: const TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        color: Colors.white60,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 22, height: 22),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: Hero(
          tag: pos,
          child: Image.asset(
            iconImage,
            height: 150,
          ),
        ),
      ),
      Positioned(
        right: 24,
        bottom: 60,
        child: Text(
          pos.toString(),
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 100,
            color: Colors.white.withOpacity(0.3),
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    ],
  );
}


