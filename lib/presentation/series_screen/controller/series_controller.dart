import 'dart:developer';

import 'package:flick/config/app_config.dart';
import 'package:flick/core/utils/app_utils.dart';
import 'package:flick/repository/api/series_screen/model/series_model.dart';
import 'package:flick/repository/api/series_screen/service/series_service.dart';
import 'package:flutter/material.dart';

class SeriesController extends ChangeNotifier {
  late SeriesModel seriesModel = SeriesModel();
  bool isLoading = false;

  fetchSeriesData(context) async {
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
}
