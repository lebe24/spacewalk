import 'package:flutter/material.dart';
import 'package:planet/src/screen/Home.dart';
import 'package:planet/src/services/ap.dart';
import './src/Data/plants.dart';

void main() async {
  var b = Planets;
  var s = await plant();

  print(s[6]['name']);
  print(b[0]['Planet']);

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
