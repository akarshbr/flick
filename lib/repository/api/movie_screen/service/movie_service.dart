import 'dart:developer';

import 'package:flick/repository/helper/api_helper.dart';

class MovieService {
  static Future<dynamic> fetchMovies(apiKey) async {
    try {
      var decodedData = await ApiHelper.getData(endpoint: "discover/movie?api_key=$apiKey");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> fetchMovieDetails(apiKey, movieID) async {
    try {
      var decodedData = await ApiHelper.getData(endpoint: "movie/$movieID?api_key=$apiKey");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> fetchMovieCastCrew(apiKey, movieId) async {
    try {
      var decodedData = await ApiHelper.getData(endpoint: "movie/$movieId/credits?api_key=$apiKey");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
