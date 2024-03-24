import 'dart:developer';

import 'package:flick/repository/helper/api_helper.dart';

class SeriesService {
  static Future<dynamic> fetchSeries(apiKey) async {
    try {
      var decodedData = await ApiHelper.getData(endpoint: "discover/tv?api_key=$apiKey");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
