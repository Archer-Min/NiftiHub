import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/res/assets_res.dart';

class MyCollectionCard extends StatelessWidget {
  final String imgPath;
  final String title;
  const MyCollectionCard({Key? key,required this.title, required this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        //这地方因为gridview没有用了，为什么不知道
        // height: 380.h,
        // width: 300.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          gradient: gradientBtColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0xdfd0cccc),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: 280.w,
                  height: 280.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.1), // 黑色细边框
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(imgPath, fit: BoxFit.fill,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: AppFonts.myCollectionTitle,),
                      Image.asset(AssetsRes.HEART)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
