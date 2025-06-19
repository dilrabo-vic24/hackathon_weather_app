import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/utils/custom_text_style.dart';

class MainTodayWeather extends StatelessWidget {
  final String imageUrl;
  final String tempC;
  final String condition;
  const MainTodayWeather({
    super.key,
    required this.imageUrl,
    required this.tempC,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Row(
        children: [
          Image.network(
            "https:$imageUrl",
            width: 160.w,
            height: 150.h,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextStyle(text: "$tempC °C", fontSize: 50.sp),
              customTextStyle(text: condition, fontSize: 22.sp)
            ],
          )
        ],
      ),
    );
  }
}
