import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';

class PutUpBt extends StatelessWidget {
  final double width;
  final double fontSize;
  final String text;
  const PutUpBt({Key? key, required this.width, required this.fontSize, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: gradientColor2,
        boxShadow: [AppColor.shadow],
      ),
      child: Center(child: Text(text, style: TextStyle(fontSize: fontSize.sp,color: Colors.white,fontWeight: FontWeight.w600))),
    );
  }
}
