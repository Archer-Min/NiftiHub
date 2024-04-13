import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/modules/home/pay_confirm/CountdownTimeWidget.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/my/AvatarRecTangle.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/res/assets_res.dart';

import 'pay_confirm_logic.dart';

class PayConfirmPage extends StatefulWidget {
  const PayConfirmPage({Key? key}) : super(key: key);

  @override
  State<PayConfirmPage> createState() => _PayConfirmPageState();
}

class _PayConfirmPageState extends State<PayConfirmPage> {
  String selectedPayment = '微信'; // 默认选中微信

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PayConfirmLogic>();
    final state = Get.find<PayConfirmLogic>().state;

    return Scaffold(
      body: Stack(
        children: [
          GradientBackground2(),
          Column(
            children: [
              MyAppBar(title: "支付订单",),
              SizedBox(height: 80.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("¥",style: TextStyle(fontSize: 35.sp),),
                  Text("900",style: AppFonts.payPriceText,),
                ],
              ),
              SizedBox(height: 30.h,),
              CountdownTimerWidget(),
              SizedBox(height: 50.h,),
              Container(
                padding: EdgeInsets.only(top: 25.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.payWayBg
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("支付方式",style: AppFonts.fontSize28PF,),
                          Divider(),
                        ],
                      ),
                    ),
                    buildRadioButton("微信支付",AssetsRes.WEICHAT),
                    buildRadioButton("支付宝支付",AssetsRes.ZHIFUBAO),
                    buildRadioButton("平台支付",AssetsRes.PLATFORM_PAY),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 30.h,
            left: 60.h,
            right: 60.h,
            child: GestureDetector(
              onTap: (){ },
              child: Container(
                height: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  gradient: gradientColor2,
                  boxShadow: [AppColor.shadow],
                ),
                child: Center(child: Text("确认支付 ¥900", style: TextStyle(fontSize: 38.sp,color: Colors.white,fontWeight: FontWeight.w600))),
              ),
            )
          )
        ],
      ),
    );
  }

  Widget buildRadioButton(String value,String imgPath) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedPayment = value;
        });
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: RadioListTile(
              title: Text(value,style: AppFonts.fontSize28PF,),
              value: value,
              groupValue: selectedPayment,
              onChanged: (newValue) {
                setState(() {
                  selectedPayment = newValue.toString();
                });
              },
              secondary: selectedPayment == value
                  ? Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16.0,
                ),
              )
                  : Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 10,
            child: Container(
                child: Image.asset(imgPath),
              decoration: BoxDecoration(
                color: AppColor.payWayBg
              ),
            ),
          ),
        ]
      ),
    );
  }

}
