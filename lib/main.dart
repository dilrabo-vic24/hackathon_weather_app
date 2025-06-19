import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/utils/router.dart';
import 'package:weather_app/data/repositories/weather_repo.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => WeatherProvider(weatherRepo: WeatherRepo()),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      ensureScreenSize: true,
      // minTextAdapt: true,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: TodayWeatherScreen(),
        routerConfig: router,
      ),
    );
  }
}
