import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:planet/src/screen/Home.dart';


void main() async {

WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp( const MaterialApp(
    
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
