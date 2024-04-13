import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/res/assets_res.dart';

class MyStarCard extends StatelessWidget {
  final String? imgPath = AssetsRes.EXAMPLE2;
  final String title;
  final double price;
  final int starNum;
  final String tag;
  const MyStarCard({Key? key, required this.title, required this.price, required this.starNum, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            height: 180.h,
            width: 180.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Image.asset(imgPath!,fit: BoxFit.fill,),
          ),
          SizedBox(width: 20.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppFonts.myPageName,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("$starNum人收藏",style: TextStyle(color: Colors.grey),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width: 150.w,
                      child: Text("¥$price",style: AppFonts.myPageName,)),
                  SizedBox(width: 10.w,),
                  TagBt(tag: "找相似",),
                  TagBt(tag: tag)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class TagBt extends StatelessWidget {
  final String tag;
  const TagBt({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 50.h,
        width: 130.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(77, 182, 237, 255),
          border: Border.all(color: const Color(0xff3AB8FA), width: 1.0.w),
        ),
        child: Center(
          child: Text(tag, style: AppFonts.tagBtText,),
        ),
      ),
    );
  }
}

