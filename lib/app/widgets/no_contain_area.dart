import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/res/assets_res.dart';

class NoContainPage extends StatelessWidget {
  final String nothingText;
  final String gotoButtonText;
  final VoidCallback? onPressed;

  const NoContainPage({
    Key? key,
    required this.nothingText,
    required this.gotoButtonText, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
          height: 400.h,
          child: Image.asset(AssetsRes.CHARACTER1, fit: BoxFit.fill),
        ),
        Text(
          nothingText,
          style: AppFonts.nothing,
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 70.h,
            width: 250.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70.0),
              gradient: gradientBtColor,
              boxShadow: [
                BoxShadow(
                  color: AppColor.pink_linear,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                gotoButtonText,
                style: AppFonts.gotoButtonText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
