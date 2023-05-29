import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';


class Planetvideo {

  Map<String, String> header = {
    'X-RapidAPI-Key': '23724cec06msh87881299a984296p1d1ef2jsn577eca766cea',
    'X-RapidAPI-Host': 'youtube138.p.rapidapi.com',
  };

  Future getvideo(String planet) async {
    try {
      var client = http.Client();
      var uri = Uri.parse(
          'https://youtube138.p.rapidapi.com/search/?q=Planet`$planet`%20Mars&hl=en&gl=US');
      var response = await client.get(uri, headers: header);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
