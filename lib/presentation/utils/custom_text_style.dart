import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextStyle({
  required String text,
  Color? textColor,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    style: TextStyle(
      color: textColor ?? Colors.black,
      fontSize: fontSize ?? 16.sp,
      fontWeight: fontWeight ?? FontWeight.bold,
    ),
  );
}
