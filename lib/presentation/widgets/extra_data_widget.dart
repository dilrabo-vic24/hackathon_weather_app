import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/utils/app_colors.dart';
import 'package:weather_app/presentation/utils/custom_text_style.dart';

class ExtraDataWidget extends StatelessWidget {
  final String iconUrl;
  final String text;
  final String reviewText;
  const ExtraDataWidget(
      {super.key,
      required this.iconUrl,
      required this.text,
      required this.reviewText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        color: AppColors.lightOrange,
      ),
      child: Row(
        children: [
          Container(
            width: 38.w,
            height: 38.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
              color: AppColors.whiteColor,
            ),
            child: Image.asset(iconUrl,
                width: 35.w, height: 35.h, fit: BoxFit.contain),
          ),
          SizedBox(width: 10.w),
          customTextStyle(text: text, fontWeight: FontWeight.w700),
          const Spacer(),
          customTextStyle(text: reviewText),
        ],
      ),
    );
  }
}
