import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/utils/app_colors.dart';
import 'package:weather_app/presentation/utils/custom_text_style.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final String hour;
  final String iconUrl;
  final String tempC;
  const HourlyWeatherWidget({
    super.key, required this.hour, required this.iconUrl, required this.tempC,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.h, bottom: 6.h),
      margin: EdgeInsets.only(right: 6.w),
      height: 100.h,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(30.r)),
          color: AppColors.lightOrange),
      child: Column(
        children: [
          customTextStyle(
              text: hour
                  .substring(11),
              textColor: Colors.grey),
          Image.network(
              "https:$iconUrl"),
          customTextStyle(
              text:
                  "$tempC°")
        ],
      ),
    );
  }
}