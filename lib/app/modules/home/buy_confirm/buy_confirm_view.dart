import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/TheSlider.dart';
import 'package:niftihub/app/widgets/home/buy_confirm_list_card.dart';
import 'package:niftihub/app/widgets/my/AvatarRecTangle.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/res/assets_res.dart';

import 'buy_confirm_logic.dart';

class BuyConfirmPage extends StatelessWidget {
  const BuyConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<BuyConfirmLogic>();
    final state = Get.find<BuyConfirmLogic>().state;

    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 120.h,
        decoration: BoxDecoration(
          color: AppColor.blue_linear
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("总额",style: AppFonts.appBarTitleText,),
                  SizedBox(width: 8,),
                  Text("¥900",style: TextStyle(fontSize: 45.sp,color: Color(0xff0E80BB)),),
                ],
              ),
              GestureDetector(
                onTap: (){Get.toNamed(AppRoutes.payConfirm);},
                child: Container(
                  height: 60.h,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: gradientColor2,
                    boxShadow: [AppColor.shadow]
                  ),
                  child: Center(child: Text("确认支付", style: TextStyle(fontSize: 30.sp,color: Colors.white,fontWeight: FontWeight.w600))),
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GradientBackground2(),
          Column(
            children: [
              MyAppBar(title: "确认订单",),
              TheSlider(),
              BuyConfirmListCard(imgPath: AssetsRes.EXAMPLE2, title: "初夏siki", price: "900", num: "1"),
              BuyConfirmListCard(imgPath: AssetsRes.EXAMPLE2, title: "迪士尼", price: "9000", num: "2"),
            ],
          )
        ],
      ),
    );
  }
}
