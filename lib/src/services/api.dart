import 'dart:convert';

import 'package:requests/requests.dart';

class ApiServices {
  final String url =
      'https://planets-info-by-newbapi.p.rapidapi.com/api/v1/planet/list';
  final String baseURL = 'https://youtube.googleapis.com/youtube/v3/';

  Map<String, String> header = {
    'X-RapidAPI-Key': '23724cec06msh87881299a984296p1d1ef2jsn577eca766cea',
    'X-RapidAPI-Host': 'planets-info-by-newbapi.p.rapidapi.com',
  };

  // Planet Json
  dynamic planet() async {
    dynamic jsonResponse;

    try {
      var response = await Requests.get(url, headers: header);

      if (response.statusCode == 200) {
        jsonResponse = jsonDecode(response.body);
        print(jsonResponse.length);
      }
    } catch (e) {
      print(e);
    }

    return jsonResponse;
  }
}
