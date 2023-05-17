import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:planet/src/data/planet_data.dart';
import 'package:planet/src/screen/planet_info.dart';

class Card3d extends StatelessWidget {
  const Card3d({super.key});

  @override
  Widget build(BuildContext context) {
    return Gallery3D(
      delayTime: 7000,
      itemCount: Planets.length,
      width: 300,
      height: 300,
      isClip: false,
      currentIndex: 0,
      itemConfig: const GalleryItemConfig(
        width: 230,
        height: 600,
        radius: 0,
        isShowTransformMask: false,
      ),
      itemBuilder: ((context, index) => PlanetCard(
            name: Planets[index]['Planet'],
            position: Planets[index]['num'],
            planetimg: Planets[index]['img'],
            desc: Planets[index]['des'],
          )),
    );
  }
}

class PlanetCard extends StatelessWidget {
  PlanetCard(
      {super.key,
      required this.desc,
      required this.planetimg,
      required this.position,
      required this.name});

  late String planetimg, name, desc;
  late int position;

  @override
  Widget build(BuildContext context) {
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
                  side: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(22),
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
                        desc,
                        style: const TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 10,
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
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => PlanetInfo(
                  tag: planetimg,
                )
              ));
            },
            child: Hero(
              tag: planetimg,
              child: Image.asset(
                planetimg,
                height: 150,
              ),
            ),
          ),
        ),
        Positioned(
          right: 24,
          bottom: 60,
          child: Text(
            position.toString(),
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
}
