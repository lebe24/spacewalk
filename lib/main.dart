import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:planet/Home.dart';
import 'package:planet/src/services/planet_Ytservices.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // var Post = await Planetvideo().getvideo("Earth");
  // print(Post['contents'].length);

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Home(),
  ));
}
