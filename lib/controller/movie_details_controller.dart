import 'dart:convert';
import 'dart:developer';

import 'package:flick/model/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieDetailsController extends ChangeNotifier {
  late MovieDetailsModel movieDetailsModel=MovieDetailsModel();
  static const apiKey = "6d2b9681525d9d62b47c2f7445f894c2";
  bool isLoading = false;
  int? code;

  fetchMovieDetails(int? movieID) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://api.themoviedb.org/3/movie/$movieID?api_key=$apiKey");
    final response = await http.get(url);
    log("${response.statusCode}");
    Map<String, dynamic> decodedData = {};
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      throw Exception("failed");
    }
    movieDetailsModel = MovieDetailsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
