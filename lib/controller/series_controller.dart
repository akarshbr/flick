import 'dart:convert';
import 'dart:developer';

import 'package:flick/model/series_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SeriesController extends ChangeNotifier {
  late SeriesModel seriesModel = SeriesModel();
  static const apiKey = "6d2b9681525d9d62b47c2f7445f894c2";
  bool isLoading = false;
  int? code;

  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://api.themoviedb.org/3/discover/tv?api_key=$apiKey&sort_by=popularity.desc");
    final response = await http.get(url);
    log("${response.statusCode}controller");
    code = response.statusCode;
    Map<String, dynamic> decodedData = {};
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      log("failed");
    }
    seriesModel = SeriesModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
