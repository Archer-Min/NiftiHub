import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';

class MyPageButton extends StatelessWidget {

  const MyPageButton({Key? key, required this.text, required this.iconPath}) : super(key: key);

  final String text;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 300.w,
      decoration: BoxDecoration(
        color: AppColor.buttonFill,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColor.buttonBorder, width: 1.0.w),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, fit: BoxFit.fill,),
            SizedBox(width: 6.w,),
            Text(text, style: AppFonts.fontSize26,),
          ],
        ),
      ),
    );
  }
}
