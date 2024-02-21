import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/movie_model.dart';

class MovieController extends ChangeNotifier {
   late MovieModel movieModel=MovieModel();

  static const apiKey = "6d2b9681525d9d62b47c2f7445f894c2";
  bool isLoading = false;

  void fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&include_adult=true&sort_by=popularity.desc");
    final response = await http.get(url);
    log("${response.statusCode}");
    Map<String, dynamic> decodedData = {};
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      log("failed");
    }
    movieModel = MovieModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
