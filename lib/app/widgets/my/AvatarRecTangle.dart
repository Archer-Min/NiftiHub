import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AvatarRecTangle extends StatelessWidget {
  final String imgPath;
  const AvatarRecTangle({Key? key, required this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: 180.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Image.asset(imgPath!,fit: BoxFit.fill,),
    );
  }
}
