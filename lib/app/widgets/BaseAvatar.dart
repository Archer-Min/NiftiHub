import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BaseAvatar extends StatelessWidget {
  final String imgPath;
  final double height;
  const BaseAvatar({Key? key, required this.imgPath, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      height: height.h,
      child: Image.asset(imgPath,fit: BoxFit.fill,),
    );
  }
}
