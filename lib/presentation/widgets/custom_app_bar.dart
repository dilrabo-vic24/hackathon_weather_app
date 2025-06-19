import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/utils/app_colors.dart';
import 'package:weather_app/presentation/utils/app_icons.dart';
import 'package:weather_app/presentation/utils/custom_text_style.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({
    super.key,
    required this.cityController,
  });

  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: customTextStyle(
                                          text:
                                              "Please, Enter city"),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
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
            icon: Icon(
              Icons.search,
              size: 33.w,
            )),
        Image.asset(
          AppIcons.pointIcon,
          width: 80.w,
          height: 5.h,
          fit: BoxFit.fill,
        ),
        Image.asset(
          AppIcons.menuIcon,
          width: 35.w,
          height: 35.h,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}