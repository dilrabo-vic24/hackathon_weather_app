import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/utils/app_colors.dart';
import 'package:weather_app/presentation/utils/custom_text_style.dart';

class DailyWeatherWidget extends StatelessWidget {
  final String weekDay;
  final String iconUrl;
  final String tempC;
  const DailyWeatherWidget({
    super.key,
    required this.iconUrl,
    required this.tempC,
    required this.weekDay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.h),
      margin: EdgeInsets.only(bottom: 7.h),
      // height: 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          color: AppColors.lightOrange),
      child: Row(
        children: [
          customTextStyle(text: weekDay, fontWeight: FontWeight.normal),
          const Spacer(),
          customTextStyle(text: "$tempC°"),
          Image.network("https:$iconUrl"),
        ],
      ),
    );
  }
}
