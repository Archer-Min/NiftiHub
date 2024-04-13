import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/res/assets_res.dart';

import 'my_settings_logic.dart';

class MySettingsPage extends StatelessWidget {
  const MySettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MySettingsLogic>();
    final state = Get.find<MySettingsLogic>().state;

    return Scaffold(
      body: Stack(
        children: [
          GradientBackground2(),
          Column(
            children: [
              MyAppBar(title: "设置",),
              SizedBox(height: 40,),
              SettingsItem("个人资料", AssetsRes.ACCOUNT),
              SettingsItem("绑定手机号", AssetsRes.CALL),
              GestureDetector(
                child: SettingsItem("隐私设置", AssetsRes.LOCK),
                onTap: (){
                  Get.toNamed(AppRoutes.privateSetting);
                },
              ),
              SettingsItem("账户安全", AssetsRes.SHIELD),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: (){
                  showToast("成功退出登录",context: context);
                  logic.logout();
                },
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(child: Text("退出登录",style: TextStyle(color: Colors.blue,fontSize: 33.sp),)),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.0, // 设置边框宽度
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget SettingsItem(String title, String iconPath){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffD5F5FF),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(iconPath),
                  SizedBox(width: 10,),
                  Text(title,style: TextStyle(fontSize: 33.sp),),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
