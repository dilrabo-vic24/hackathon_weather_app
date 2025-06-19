import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/presentation/screens/today_weather_screen.dart';
import 'package:weather_app/presentation/utils/app_colors.dart';
import 'package:weather_app/presentation/utils/custom_text_style.dart';
import 'package:weather_app/presentation/widgets/daily_weather_widget.dart';
import 'package:weather_app/presentation/widgets/tomorrow_widget.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class WeeklyWeatherScreen extends StatelessWidget {
  static const path = "/weekly";
  const WeeklyWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final String cityName = GoRouter.of(context).state!.extra as String;
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        final tomorrowData =
            weatherProvider.weatherDataWeekly.forecast!.forecastday![1].day;
        final weeklyData = weatherProvider.weatherDataWeekly.forecast!;
        if (weatherProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  AppColors.gradientColor1,
                  AppColors.gradientColor2,
                ])),
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.go(TodayWeatherScreen.path);
                          },
                          icon: Icon(Icons.arrow_back_ios_new)),
                      customTextStyle(text: "Next 7 Days")
                    ],
                  ),
                  TomorrowWidget(
                    tomorrowTemp: tomorrowData!.avgtempC.toString(),
                    wind: tomorrowData.maxwindKph.toString(),
                    humidity: tomorrowData.avghumidity.toString(),
                    iconUrl: tomorrowData.condition!.icon!,
                    rainfall: tomorrowData.dailyWillItRain.toString(),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return DailyWeatherWidget(
                        iconUrl: weeklyData
                            .forecastday![index].day!.condition!.icon!,
                        tempC: weeklyData.forecastday![index].day!.avgtempC
                            .toString(),
                        weekDay: weatherProvider.getWeekdayName(
                            dateStr:
                                weeklyData.forecastday![index].date.toString()),
                      );
                    },
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
