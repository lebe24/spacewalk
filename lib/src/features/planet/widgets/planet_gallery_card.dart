import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:planet/src/features/planet/data/planet_repository.dart';
import 'package:planet/src/features/planet/screens/planet_detail_screen.dart';

const double _cardTopOffset = 20;

class PlanetGalleryCard extends StatelessWidget {
  const PlanetGalleryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Gallery3D(
      delayTime: 7000,
      itemCount: planets.length,
      width: 300,
      height: 250,
      isClip: false,
      currentIndex: 0,
      itemConfig: const GalleryItemConfig(
        width: 230,
        height: 250,
        radius: 0,
        isShowTransformMask: false,
      ),
      itemBuilder: ((context, index) => PlanetGalleryCardItem(
            name: planets[index]['Planet'],
            position: planets[index]['num'].toString(),
            planetImg: planets[index]['img'],
            desc: planets[index]['des'],
          )),
    );
  }
}

class PlanetGalleryCardItem extends StatelessWidget {
  const PlanetGalleryCardItem({
    super.key,
    required this.desc,
    required this.planetImg,
    required this.position,
    required this.name,
  });

  final String planetImg, name, desc, position;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: _cardTopOffset),
            // Expanded fills whatever height Gallery3D actually hands this
            // item (driven by its `height` param, not just itemConfig.height),
            // so the card can never grow taller than the slot and overflow.
            Expanded(
              child: Container(
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 56),
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
                        const SizedBox(height: 8),
                        // Flexible + scrollable so longer descriptions or a
                        // larger text-scale factor never overflow the card.
                        Flexible(
                          child: SingleChildScrollView(
                            child: Text(
                              desc,
                              style: const TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 10,
                                color: Colors.white60,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                builder: (_) => PlanetDetailScreen(
                  tag: planetImg,
                  name: name,
                  position: position,
                  desc: desc,
                )
              ));
            },
            child: Hero(
              tag: planetImg,
              child: Image.asset(
                planetImg,
                height: 150,
              ),
            ),
          ),
        ),
        Positioned(
          right: 24,
          bottom: 60,
          child: Text(
            position,
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
