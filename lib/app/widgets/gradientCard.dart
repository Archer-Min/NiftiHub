import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';

class GradientCard extends StatelessWidget {
  final double height;
  final double weight;
  final Widget? child;
  const GradientCard({Key? key, required this.height, required this.weight, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //这地方因为gridview没有用了，为什么不知道
      height: height.h,
      width: weight.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        gradient: gradientBtColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0xdfd0cccc),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0.5, 0.5),
          ),
        ],
      ),
      child: child,
    );
  }
}
