import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';

class GradientBt extends StatelessWidget {
  final String text;
  const GradientBt({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 90.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: gradientColor2,
      ),
      child: Center(child: Text(text, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600))),
    );
  }
}
