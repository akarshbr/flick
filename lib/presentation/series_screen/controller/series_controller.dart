import 'dart:developer';

import 'package:flick/config/app_config.dart';
import 'package:flick/core/utils/app_utils.dart';
import 'package:flick/repository/api/movie_screen/model/cast_crew_model.dart';
import 'package:flick/repository/api/series_screen/model/series_details_model.dart';
import 'package:flick/repository/api/series_screen/model/series_model.dart';
import 'package:flick/repository/api/series_screen/service/series_service.dart';
import 'package:flutter/material.dart';

class SeriesController extends ChangeNotifier {
  SeriesModel seriesModel = SeriesModel();
  SeriesDetailsModel seriesDetailsModel = SeriesDetailsModel();
  CastCrewModel castCrewModel =CastCrewModel();
  bool isLoading = false;
  bool isLoadingSD = false;
  bool isLoadingCC =false;
  bool isCast =true;

  fetchSeries(context) async {
    isLoading = true;
    notifyListeners();
    log("Series Controller -> fetchSeriesData()");
    SeriesService.fetchSeries(AppConfig.apiKey).then((value) {
      if (value["status"] == 1) {
        seriesModel = SeriesModel.fromJson(value["data"]);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("Error", context: context);
      }
      notifyListeners();
    });
  }

  fetchSeriesDetails(context, seriesId) async {
    isLoadingSD = true;
    notifyListeners();
    log("Series Controller -> fetchSeriesDetails()");
    SeriesService.fetchSeriesDetails(AppConfig.apiKey, seriesId).then((value) {
      if (value["status"] == 1) {
        seriesDetailsModel = SeriesDetailsModel.fromJson(value["data"]);
        isLoadingSD = false;
      } else {
        AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }

  fetchSeriesCastCrew(context, movieId) async {
    isLoadingCC = true;
    notifyListeners();
    log("Movie controller -> fetchMovieCastCrew()");
    SeriesService.fetchSeriesCastCrew(AppConfig.apiKey, movieId).then((value) {
      if (value["status"] == 1) {
        castCrewModel = CastCrewModel.fromJson(value["data"]);
        isLoadingCC = false;
      } else {
        AppUtils.oneTimeSnackBar("Failed to fetch cast and crew", context: context);
      }
      notifyListeners();
    });
  }
}
