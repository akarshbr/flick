import 'dart:convert';
import 'dart:developer';

import 'package:flick/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpService extends ChangeNotifier {
  late MovieModel movieModel;
  static const apiKey = "6d2b9681525d9d62b47c2f7445f894c2";
  bool isLoading = false;
  int? code;

  void fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&include_adult=true&sort_by=popularity.desc");
    final response = await http.get(url);
    code = response.statusCode;
    log("${response.statusCode}");
    Map<String, dynamic> decodedData = {};
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      throw Exception("failed");
    }
    movieModel = MovieModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
