import 'dart:convert';
import 'dart:developer';

import 'package:flick/repository/api/movie_screen/model/cast_crew_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CastCrewController extends ChangeNotifier {
  late CastCrewModel castCrewModel=CastCrewModel();
  static const apiKey = "6d2b9681525d9d62b47c2f7445f894c2";

  fetchCastCrewDetails(int? movieId) async {
    final url = Uri.parse("https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey");
    final response = await http.get(url);
    log("${response.statusCode}");
    Map<String, dynamic> decodedData = {};
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      throw Exception("failed");
    }
    castCrewModel = CastCrewModel.fromJson(decodedData);
    notifyListeners();
  }
}
