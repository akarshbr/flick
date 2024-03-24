import 'dart:developer';

import 'package:flick/config/app_config.dart';
import 'package:flick/core/utils/app_utils.dart';
import 'package:flick/repository/api/movie_screen/service/movie_service.dart';
import 'package:flutter/material.dart';

import '../../../repository/api/movie_screen/model/movie_model.dart';

class MovieController extends ChangeNotifier {
  late MovieModel movieModel = MovieModel();
  bool isLoading = false;

  fetchMovieData(context) async {
    isLoading = true;
    notifyListeners();
    log("Movie controller -> fetchMovieData()");
    MovieService.fetchMovie(AppConfig.apiKey).then((value) {
      if (value["status"] == 1) {
        movieModel = MovieModel.fromJson(value["data"]);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("Error", context: context);
      }
      notifyListeners();
    });
  }
}
