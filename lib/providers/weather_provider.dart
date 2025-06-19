import 'package:flutter/material.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/repositories/weather_repo.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherRepo weatherRepo;
  bool isLoading = false;

  WeatherModel weatherData = WeatherModel();
  WeatherModel weatherDataWeekly = WeatherModel();

  WeatherProvider({required this.weatherRepo});

  Future<void> getTodayWeatherByCityName({required String cityName}) async {
    isLoading = true;
    notifyListeners();
    final response =
        await weatherRepo.getTodayWeatherByCityName(cityName: cityName);

    // ignore: unnecessary_null_comparison
    if (response != null) {
      weatherData = response;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getWeeklyWeatherByCityName({required String cityName}) async {
    isLoading = true;
    notifyListeners();
    final response =
        await weatherRepo.getWeeklyWeatherByCityName(cityName: cityName);

    // ignore: unnecessary_null_comparison
    if (response != null) {
      weatherDataWeekly = response;
    }
    isLoading = false;
    notifyListeners();
  }

  String? findMonth({required String dataTime}) {
    String dateTime = "2025-01-10 15:28";

    String monthNumber = dateTime.substring(5, 7);
    String day = dateTime.substring(8, 10);

    Map<String, String> monthNames = {
      "01": "Jan",
      "02": "Feb",
      "03": "Mar",
      "04": "Apr",
      "05": "May",
      "06": "Jun",
      "07": "Jul",
      "08": "Aug",
      "09": "Sep",
      "10": "Oct",
      "11": "Nov",
      "12": "Dec",
    };

    String? monthName = monthNames[monthNumber];
    return "$monthName $day";
  }

  String getWeekdayName({required String dateStr}) {
    DateTime date = DateTime.parse(dateStr);

    List<String> weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    return weekdays[date.weekday - 1];
  }
}
