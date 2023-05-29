import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlanetDetail extends StatelessWidget {
  PlanetDetail({super.key, required this.tag , required this.position, required this.desc});

  String tag,position,desc;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            right: -70,
            child: Hero(
              tag: tag,
              child: Image.asset(
                tag,
                fit: BoxFit.contain,
                width: 300,
                height: 250,
              ),
            )),
        Positioned(
            top: 100,
            left: 0,
            child: Text(
              position.toString(),
              style: TextStyle(
                  color: Colors.white.withOpacity(0.2),
                  fontSize: 400,
                  fontWeight: FontWeight.bold),
            )),
        Center(
            child: Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ))
      ],
    );
  }
}
