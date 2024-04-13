import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/res/assets_res.dart';

import 'private_setting_logic.dart';

class PrivateSettingPage extends StatelessWidget {
  const PrivateSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PrivateSettingLogic>();
    final state = Get.find<PrivateSettingLogic>().state;

    return Scaffold(
      body: Stack(
        children: [
          GradientBackground2(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(title: "隐私设置",),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("作品与藏品",style: TextStyle(fontSize: 33.sp,color: Colors.grey),),
              ),
              SettingsItem("我的创作", AssetsRes.CREATION),
              SettingsItem("我的藏品", AssetsRes.COLLECTION),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("用户关系",style: TextStyle(fontSize: 33.sp,color: Colors.grey),),
              ),
              SettingsItem("我的关注", AssetsRes.PEOPLE1),
              SettingsItem("我的粉丝", AssetsRes.USERS),
            ],
          ),
        ],
      ),
    );;
  }

  // Widget SettingsItem(String title, String iconPath){
  //   return Container(
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       color: Color(0xffD5F5FF),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: Row(
  //               children: [
  //                 Image.asset(iconPath),
  //                 SizedBox(width: 10,),
  //                 Text(title,style: TextStyle(fontSize: 33.sp),),
  //               ],
  //             ),
  //           ),
  //           Text("仅自己可见",style: TextStyle(fontSize: 33.sp,color: Colors.grey),),
  //           Icon(Icons.arrow_forward_ios)
  //         ],
  //       ),
  //     ),
  //   );
  // }

}

class SettingsItem extends StatefulWidget {
  final String title;
  final String iconPath;

  const SettingsItem(this.title, this.iconPath);

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  String visibility = "仅自己可见";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(widget.title+"列表",style: TextStyle(fontSize: 34.sp,fontWeight: FontWeight.w600),),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(AssetsRes.UNLOCK),
                        SizedBox(width: 8,),
                        Text('所有人可见'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        visibility = '所有人可见';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(AssetsRes.USERS),
                        SizedBox(width: 8,),
                        Text('仅粉丝可见'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        visibility = '仅粉丝可见';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(AssetsRes.LOCK),
                        SizedBox(width: 8,),
                        Text('仅自己可见'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        visibility = '仅自己可见';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
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
                    Image.asset(widget.iconPath),
                    SizedBox(width: 10,),
                    Text(widget.title,style: TextStyle(fontSize: 33.sp),),
                  ],
                ),
              ),
              Text(visibility, style: TextStyle(fontSize: 33.sp, color: Colors.grey)),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
