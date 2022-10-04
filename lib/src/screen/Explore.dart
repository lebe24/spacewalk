import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  dynamic infoPlanet;
  Explore({super.key, required this.infoPlanet});

  @override
  Widget build(BuildContext context) {
    print(infoPlanet['Planet']);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/Detail-bg.png'))),
      ),
    );
  }
}
