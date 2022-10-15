import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:planet/src/widget/widget.dart';
import '../Data/plants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/Splash4.png'))),
        child: SafeArea(
            child: Container(
          // color: Colors.red,
          child: Column(
            children: [
              const Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 108.0),
                child: Text(
                  'Space Walk',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: '',
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 158.0),
                child: Center(
                    child: Card3d(
                  number: Planets.length,
                  index: currentIndex,
                  planets: Planets,
                )),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
