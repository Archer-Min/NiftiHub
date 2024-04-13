import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/widgets/image_preview.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/res/assets_res.dart';

import 'show_detail_logic.dart';

class ShowDetailPage extends StatelessWidget {
  const ShowDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ShowDetailLogic>();
    final state = Get.find<ShowDetailLogic>().state;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: AppColor.gradientBgDark),
            child: Image.asset(AssetsRes.SHOW_DETAIL_BG_DARK,
              fit: BoxFit.fill,
            ),
          ),
          MyAppBar(title: "未来雪 再贩 超神款",),
          SafeArea(child: Padding(
            padding: EdgeInsets.only(left:50.h,right:50.h,top: 150.h,bottom: 350.h),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0x8f000000),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    height: 560.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0x8f000000),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 380.h,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(AssetsRes.FUFU),
                            ),
                          ),
                          onTap: (){
                            Get.toNamed(AppRoutes.show3D);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 5; i++)
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Image.asset(AssetsRes.STAR),
                              ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Center(child: Image.asset(AssetsRes.CHAOSHEN)),
                        Align(
                          alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: GestureDetector(
                                onTap: (){
                                  Get.to(ImagePreview(Image.asset(AssetsRes.FUFU).image));
                                },
                                  child: Container(height:40.h,child: Image.asset(AssetsRes.DA))),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 30),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Container(
                            height: 350.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              Text("参考价格:",style: TextStyle(color: Colors.white),),
                              Text("参数:",style: TextStyle(color: Colors.white),),
                              Text("品牌:",style: TextStyle(color: Colors.white),),
                            ],),
                          ),
                        ),
                        Container(
                          height: 350.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("2000元",style: TextStyle(color: Colors.white),),
                            Row(
                              children: [
                              Column(children: [
                                Text("尺寸",style: TextStyle(color: Colors.white),),
                                Text("420mm",style: TextStyle(color: Colors.white),),
                              ],),
                              SizedBox(width: 10,),
                              Column(children: [
                                Text("官方价",style: TextStyle(color: Colors.white),),
                                Text("2340元",style: TextStyle(color: Colors.white),)
                              ],)
                            ],),
                              Text("DanDan",style: TextStyle(color: Colors.white),)
                          ],),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
