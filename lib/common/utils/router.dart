import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_flutter/presentation/screens/today_weather_screen.dart';
import 'package:hackathon_flutter/presentation/screens/weekly_weather_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(initialLocation: "/", routes: <RouteBase>[
  GoRoute(
    path: "/",
    builder: (context, state) => TodayWeatherScreen(),
  ),
  GoRoute(
    path: TodayWeatherScreen.path,
    builder: (context, state) => TodayWeatherScreen(),
  ),
  GoRoute(
    path: WeeklyWeatherScreen.path,
    builder: (context, state) => const WeeklyWeatherScreen(),
  ),
]);
