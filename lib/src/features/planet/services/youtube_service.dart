import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const _rapidApiHost = 'youtube-v2.p.rapidapi.com';

// Pass at build/run time: --dart-define=RAPIDAPI_KEY=your_key_here
const _rapidApiKey = String.fromEnvironment('RAPIDAPI_KEY');

class YoutubeService {
  static const _header = {
    'x-rapidapi-key': _rapidApiKey,
    'x-rapidapi-host': _rapidApiHost,
  };

  Future<dynamic> fetchVideosForPlanet(String planet) async {
    if (_rapidApiKey.isEmpty) {
      debugPrint(
          'RAPIDAPI_KEY is not set. Pass --dart-define=RAPIDAPI_KEY=your_key_here.');
      return null;
    }

    try {
      final client = http.Client();
      final uri = Uri.https(_rapidApiHost, '/search/', {
        'query': '$planet planet',
        'lang': 'en',
        'order_by': 'this_month',
        'country': 'us',
      });
      final response = await client.get(uri, headers: _header);

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
