import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:planet/src/screen/Home.dart';
import 'package:planet/src/services/api.dart';
import 'package:requests/requests.dart';

void main() async {
  final ApiServices t = ApiServices();

  // var url = 'https:wft-geo-db.p.rapidapi.com/v1/geo/cities';

  // Map<String, String> header = {
  //   'X-RapidAPI-Key': '23724cec06msh87881299a984296p1d1ef2jsn577eca766cea',
  //   'X-RapidAPI-Host': 'wft-geo-db.p.rapidapi.com'
  // };

  // var response = await Requests.get(url, headers: header);

  // dynamic jsonResponse;

  // if (response.statusCode == 200) {
  //   jsonResponse = jsonDecode(response.body);

  //   print("========");
  // } else {
  //   print('Request failed with status: ${response.statusCode}');
  // }

  var x = t.planet();
  print('object');
  print(x.toString());

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
