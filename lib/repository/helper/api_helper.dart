import 'dart:convert';
import 'dart:developer';

import 'package:flick/config/app_config.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static getData({required String endpoint}) async {
    log("Api Helper class -> getData");
    final url = Uri.parse(AppConfig.baseURL + endpoint);
    log("final URL -> $url");
    try {
      var response = await http.get(url);
      log("API called -> status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        log(decodedData.toString());
        var data = {"status": 1, "data": decodedData};
        return data;
      } else {
        log("API failed");
        var data = {"status": 0, "data": null};
        return data;
      }
    } catch (e) {
      log("$e");
    }
  }
}
