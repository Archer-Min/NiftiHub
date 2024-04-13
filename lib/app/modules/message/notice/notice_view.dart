import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/res/assets_res.dart';

import 'notice_logic.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<NoticeLogic>();
    // final state = Get.find<NoticeLogic>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("通知",style: AppFonts.myPageName,),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffF6FCFE),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                child: Row(
                  children: [
                    Container(
                      height: 130.h,
                      width: 130.h,
                      decoration: BoxDecoration(
                        gradient: gradientColor3,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(AssetsRes.GIFT),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("活动公告",style: AppFonts.myPageName,),
                        Text("藏品《法老王》合成公告",style: AppFonts.fontSize28,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffF6FCFE),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                child: Row(
                  children: [
                    Container(
                      height: 130.h,
                      width: 130.h,
                      decoration: BoxDecoration(
                        gradient: gradientColor3,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(AssetsRes.GIFT),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("活动公告",style: AppFonts.myPageName,),
                        Text("藏品《法老王》合成公告",style: AppFonts.fontSize28,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffF6FCFE),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                child: Row(
                  children: [
                    Container(
                      height: 130.h,
                      width: 130.h,
                      decoration: BoxDecoration(
                        gradient: gradientColor3,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(AssetsRes.GIFT),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("活动公告",style: AppFonts.myPageName,),
                        Text("藏品《法老王》合成公告",style: AppFonts.fontSize28,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
