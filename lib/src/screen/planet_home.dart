import 'package:flutter/material.dart';
import 'package:planet/src/widget/card.dart';
import 'package:rive/rive.dart';

class Planet extends StatelessWidget {
  const Planet({super.key});

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
          Card3d(),
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
