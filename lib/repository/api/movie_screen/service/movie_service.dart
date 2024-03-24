import 'dart:developer';

import 'package:flick/repository/helper/api_helper.dart';

class MovieService {
  static Future<dynamic> fetchMovie(apiKey) async {
    try {
      var decodedData = await ApiHelper.getData(endpoint: "discover/movie?api_key=$apiKey");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
