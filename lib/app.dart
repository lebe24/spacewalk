import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:planet/src/features/planet/screens/planet_home_screen.dart';

class SpaceWalkApp extends StatefulWidget {
  const SpaceWalkApp({super.key});

  @override
  State<SpaceWalkApp> createState() => _SpaceWalkAppState();
}

class _SpaceWalkAppState extends State<SpaceWalkApp> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/background.png'))),
      child: PlanetHomeScreen(),
    ));
  }
}
