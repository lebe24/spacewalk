import 'package:flutter/material.dart';
import 'package:planet/src/features/planet/widgets/planet_gallery_card.dart';
import 'package:rive/rive.dart';

class PlanetHomeScreen extends StatelessWidget {
  const PlanetHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'SpaceWalk',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),
          )),
          PlanetGalleryCard(),
          SizedBox(
            width: 200,
            height: 200,
            child: RiveAnimation.asset(
              'assets/rive/space_coffee.riv',
            ),
          )
        ],
      ),
    );
  }
}
