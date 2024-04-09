import 'dart:developer';

import 'package:flick/config/app_config.dart';
import 'package:flick/core/utils/app_utils.dart';
import 'package:flick/presentation/movie_details_screen/view/movie_details_screen.dart';
import 'package:flick/repository/api/movie_screen/service/movie_service.dart';
import 'package:flutter/material.dart';

import '../../../repository/api/movie_details_screen/model/movie_details_model.dart';
import '../../../repository/api/movie_screen/model/movie_model.dart';

class MovieController extends ChangeNotifier {
  MovieModel movieModel = MovieModel();
  MovieDetailsModel movieDetailsModel = MovieDetailsModel();
  bool isLoading = false;
  bool isLoadingMD = false;

  fetchMovies(context) async {
    isLoading = true;
    notifyListeners();
    log("Movie controller -> fetchMovies()");
    MovieService.fetchMovies(AppConfig.apiKey).then((value) {
      if (value["status"] == 1) {
        movieModel = MovieModel.fromJson(value["data"]);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("Error", context: context);
      }
      notifyListeners();
    });
  }

  fetchMovieDetails(context, movieID) async {
    isLoadingMD = true;
    notifyListeners();
    log("Movie controller -> fetchMovieDetails()");
    MovieService.fetchMovieDetails(AppConfig.apiKey, movieID).then((value) {
      if (value["status"] == 1) {
        movieDetailsModel = MovieDetailsModel.fromJson(value["data"]);
        isLoadingMD = false;
      } else {
        AppUtils.oneTimeSnackBar("Failed to fetch data", context: context);
      }
      notifyListeners();
    });
  }
}
