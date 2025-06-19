import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/presentation/screens/weekly_weather_screen.dart';
import 'package:weather_app/presentation/utils/app_colors.dart';
import 'package:weather_app/presentation/utils/app_icons.dart';
import 'package:weather_app/presentation/utils/custom_text_style.dart';
import 'package:weather_app/presentation/widgets/extra_data_widget.dart';
import 'package:weather_app/presentation/widgets/hourly_weather_widget.dart';
import 'package:weather_app/presentation/widgets/main_today_weather_widget.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TodayWeatherScreen extends StatefulWidget {
  static const path = "/today";
  String cityName = "Seoul";

  TodayWeatherScreen({super.key});

  @override
  State<TodayWeatherScreen> createState() => _TodayWeatherScreenState();
}

class _TodayWeatherScreenState extends State<TodayWeatherScreen>
    with SingleTickerProviderStateMixin {
  final cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<WeatherProvider>(context, listen: false)
        .getTodayWeatherByCityName(cityName: widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        final data = weatherProvider.weatherData;
        if (weatherProvider.isLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: 690.h,
              width: 360.w,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    AppColors.gradientColor1,
                    AppColors.gradientColor2,
                  ])),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Center(
                                      child: customTextStyle(
                                          text: "Search city", fontSize: 15.sp),
                                    ),
                                    content: Padding(
                                      padding: EdgeInsets.all(20.w),
                                      child: SizedBox(
                                        height: 200.h,
                                        child: Column(
                                          children: [
                                            TextField(
                                              controller: cityController,
                                              decoration: InputDecoration(
                                                  hintText: "Enter city",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r))),
                                            ),
                                            SizedBox(height: 30.h),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(250.w, 40.h),
                                                  backgroundColor:
                                                      AppColors.gradientColor1,
                                                ),
                                                onPressed: () {
                                                  // ignore: unnecessary_null_comparison
                                                  if (cityController.text ==
                                                          null ||
                                                      cityController
                                                          .text.isEmpty) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: customTextStyle(
                                                          text:
                                                              "Please, Enter city"),
                                                      backgroundColor:
                                                          Colors.red,
                                                    ));
                                                  }
                                                  widget.cityName =
                                                      cityController.text
                                                          .trim();
                                                  weatherProvider
                                                      .getTodayWeatherByCityName(
                                                          cityName:
                                                              cityController
                                                                  .text
                                                                  .trim());
                                                  Navigator.pop(context);
                                                },
                                                child: customTextStyle(
                                                    text: "Search",
                                                    fontSize: 15.sp)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.search, size: 33.w)),
                        Image.asset(AppIcons.pointIcon,
                            width: 80.w, height: 5.h, fit: BoxFit.fill),
                        Image.asset(AppIcons.menuIcon,
                            width: 35.w, height: 35.h, fit: BoxFit.fill),
                      ],
                    ),
                    customTextStyle(
                        text: data.location!.name!, fontSize: 25.sp),
                    customTextStyle(
                        text: data.location!.country!, fontSize: 25.sp),
                    customTextStyle(
                        text: "${weatherProvider.getWeekdayName(
                          dateStr: weatherProvider
                              .weatherData.current!.lastUpdatedEpoch
                              .toString(),
                        )}, ${weatherProvider.findMonth(dataTime: data.current!.lastUpdatedEpoch.toString())}",
                        fontSize: 18.sp,
                        textColor: Colors.grey),
                    FittedBox(
                      child: MainTodayWeather(
                        imageUrl: data.current!.condition!.icon!,
                        tempC: data.current!.tempC.toString(),
                        condition: data.current!.condition!.text.toString(),
                      ),
                    ),
                    ExtraDataWidget(
                        iconUrl: AppIcons.rainfallIcon,
                        text: "Rainfall",
                        reviewText:
                            "${data.forecast!.forecastday![0].day!.dailyWillItRain.toString()} cm"),
                    ExtraDataWidget(
                        iconUrl: AppIcons.windIcon,
                        text: "Wind",
                        reviewText:
                            "${data.forecast!.forecastday![0].day!.maxwindKph.toString()} km/h"),
                    ExtraDataWidget(
                        iconUrl: AppIcons.humidityIcon,
                        text: "Humidity",
                        reviewText:
                            "${data.forecast!.forecastday![0].day!.avghumidity.toString()} %"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                customTextStyle(text: "Today"),
                                // Divider(color: Colors.black)
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                customTextStyle(text: "Tomorrow"),
                                // Divider()
                              ],
                            )),
                        TextButton(
                            onPressed: () {
                              weatherProvider.getWeeklyWeatherByCityName(
                                  cityName: cityController.text.trim().isEmpty
                                      ? "Seoul"
                                      : cityController.text.trim());
                              context.push(
                                WeeklyWeatherScreen.path,
                              );
                            },
                            child: Column(
                              children: [
                                customTextStyle(text: "Next 7 days"),
                              ],
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.black,
                          height: 1.h,
                          width: 60.w,
                        ),
                        Container(
                          color: Colors.grey,
                          height: 1.h,
                          width: 260.w,
                        )
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 24,
                        itemBuilder: (context, index) {
                          return HourlyWeatherWidget(
                            hour: data
                                .forecast!.forecastday![0].hour![index].time!,
                            iconUrl: data.forecast!.forecastday![0].hour![index]
                                .condition!.icon!,
                            tempC: data
                                .forecast!.forecastday![0].hour![index].tempC
                                .toString(),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
