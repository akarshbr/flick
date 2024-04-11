import 'dart:developer';

import 'package:flick/repository/helper/api_helper.dart';

class SeriesService {
  static Future<dynamic> fetchSeries(apiKey) async {
    try {
      var decodedData = await ApiHelper.getData(endpoint: "discover/tv?api_key=$apiKey&without_genres=10768,10767,10763");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
