import 'dart:convert';
import 'package:requests/requests.dart';

plantInfo() async {
  dynamic jsonResponse;
  const String url =
      'https://planets-info-by-newbapi.p.rapidapi.com/api/v1/planet/list';

  Map<String, String> header = {
    'X-RapidAPI-Key': '23724cec06msh87881299a984296p1d1ef2jsn577eca766cea',
    'X-RapidAPI-Host': 'planets-info-by-newbapi.p.rapidapi.com',
  };

  final response = await Requests.get(url, headers: header);

  if (response.statusCode == 200) {
    jsonResponse = jsonDecode(response.body);
  } else {
    throw Exception('Failed to load');
  }

  return jsonResponse;
}


Planetvideo(String planet) async {
  dynamic jsonResponse;

  final url = 'https://youtube138.p.rapidapi.com/search/?q=Planet`$planet`%20Mars&hl=en&gl=US';

  Map<String, String> header = {
    'X-RapidAPI-Key': '23724cec06msh87881299a984296p1d1ef2jsn577eca766cea',
    'X-RapidAPI-Host': 'youtube138.p.rapidapi.com',
  };

  final response = await Requests.get(url, headers: header);

  if (response.statusCode == 200) {
    jsonResponse = jsonDecode(response.body);
  } else {
    throw Exception('Failed to load');
  }

  return jsonResponse;
}
