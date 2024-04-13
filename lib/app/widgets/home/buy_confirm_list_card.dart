import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/widgets/my/AvatarRecTangle.dart';
class BuyConfirmListCard extends StatelessWidget {
  final String imgPath;
  final String title;
  final String price;
  final String num;
  const BuyConfirmListCard({Key? key, required this.imgPath, required this.title, required this.price, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15,top: 10),
      child: Row(
        children: [
          AvatarRecTangle(imgPath: imgPath),
          SizedBox(width: 15,),
          Expanded(
            child: Container(
              height: 170.h,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,style: AppFonts.myPageName,),
                      Text("¥$price",style: AppFonts.myPageName,)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("版本号1/1",style: AppFonts.greyText,),
                      Text("*$num",style: AppFonts.greyText,)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
