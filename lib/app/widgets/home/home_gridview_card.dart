import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/res/assets_res.dart';

class HomeGridViewCard extends StatelessWidget {
  final String imgPath;
  final String title;
  final String total;
  final String price;
  final String sold;
  const HomeGridViewCard({Key? key, required this.imgPath, required this.title, required this.total, required this.price, required this.sold}) : super(key: key);

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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 285.h,
                  height: 285.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.1), // 黑色细边框
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(imgPath, fit: BoxFit.fill,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: AppFonts.myCollectionTitle,),
                      Image.asset(AssetsRes.HEART)
                    ],
                  ),
                ),
                //显示总量
                Stack(
                  children: [
                    Container(
                      height: 50.h,
                      width: 220.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xdfd0cccc),
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: Offset(-1, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text("$total份",style: TextStyle(color: Colors.grey,)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        gradient: gradientColor2,
                      ),
                      child: Center(child: Text("总量", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600))),
                    ),
                  ]
                ),
                //价格
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Text("¥$price",style: AppFonts.myCollectionTitle,),
                      SizedBox(width: 15.w,),
                      Text("已卖出$sold+件",style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ),
                Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Image.asset(AssetsRes.STAR),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
