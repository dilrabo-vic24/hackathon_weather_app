import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/utils/app_colors.dart';
import 'package:weather_app/presentation/utils/app_icons.dart';
import 'package:weather_app/presentation/utils/custom_text_style.dart';

class TomorrowWidget extends StatelessWidget {
  final String tomorrowTemp;
  final String iconUrl;
  final String rainfall;
  final String wind;
  final String humidity;
  const TomorrowWidget({
    super.key,
    required this.tomorrowTemp,
    required this.iconUrl,
    required this.rainfall,
    required this.wind,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          color: AppColors.lightOrange),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 27.h),
        child: Column(
          children: [
            Row(
              children: [
                customTextStyle(text: "Tomorrow", fontSize: 20.sp),
                const Spacer(),
                customTextStyle(text: "$tomorrowTemp°", fontSize: 20.sp),
                Image.network("https:$iconUrl")
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          color: AppColors.whiteColor,
                        ),
                        child: Image.asset(AppIcons.rainfallIcon,
                            width: 35.w, height: 35.h, fit: BoxFit.contain),
                      ),
                      customTextStyle(text: "$rainfall cm"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          color: AppColors.whiteColor,
                        ),
                        child: Image.asset(AppIcons.windIcon,
                            width: 35.w, height: 35.h, fit: BoxFit.contain),
                      ),
                      customTextStyle(text: "$wind km/hm"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          color: AppColors.whiteColor,
                        ),
                        child: Image.asset(AppIcons.humidityIcon,
                            width: 35.w, height: 35.h, fit: BoxFit.contain),
                      ),
                      customTextStyle(text: "$humidity %"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
