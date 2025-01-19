import 'dart:convert';
import 'dart:developer';

import 'package:hackathon_flutter/common/utils/constants/network_constants.dart';
import 'package:hackathon_flutter/data/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  Future<WeatherModel> getTodayWeatherByCityName(
      {required String cityName}) async {
    // final url = Uri.parse(
    //     "${NetworkConstants.baseUrl}$cityName&days=1&key=${NetworkConstants.apiKey}");
    //https://api.weatherapi.com/v1/forecast.json?q=Tashkent&days=1&key=ba2cba6a35824cffa4463250251901

    final url = Uri.parse(
        "https://api.weatherapi.com/v1/forecast.json?q=$cityName&days=1&key=ba2cba6a35824cffa4463250251901");
    try {
      final response = await http.get(url);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        WeatherModel weather = WeatherModel.fromJson(body);
        return weather;
      } else {
        throw Exception("Errorrrr happened while getting data");
      }
    } catch (e) {
      log("error ${e.toString()}");
      throw Exception(e);
    }
  }

  Future<WeatherModel> getWeeklyWeatherByCityName(
      {required String cityName}) async {
    final url = Uri.parse(
        "${NetworkConstants.baseUrl}/forecast.json?q=$cityName&days=7&key=${NetworkConstants.apiKey}");
    //https://api.weatherapi.com/v1/forecast.json?q=Tashkent&days=7&key=ba2cba6a35824cffa4463250251901

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        WeatherModel weather = WeatherModel.fromJson(body);
        return weather;
      } else {
        throw Exception("Error happened while getting data");
      }
    } catch (e) {
      log("error ${e.toString()}");
      throw Exception(e);
    }
  }
  
}
