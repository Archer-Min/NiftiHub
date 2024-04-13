import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/modules/my/my_collection/my_collection_view.dart';
import 'package:niftihub/app/modules/my/my_create/my_create_view.dart';
import 'package:niftihub/app/modules/my/my_shopping/my_shopping_view.dart';
import 'package:niftihub/app/modules/my/my_star/my_star_view.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/avatar/avatar_view.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/app/widgets/my_page_button.dart';
import 'package:niftihub/res/assets_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_logic.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<MyLogic>();
    // final state = Get.find<MyLogic>().state;

    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          Image.asset(AssetsRes.MY_BG,fit: BoxFit.fill,),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 900.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23.0),
                  topRight: Radius.circular(23.0),
                ),
              ),
              child: const DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: TabBar(
                        indicatorColor: AppColor.myIconColor,
                        tabs: [
                          TheTab(
                            imagePath: AssetsRes.MY_CREATE_ICON,
                            text: AppString.myCreate,
                          ),
                          TheTab(
                            imagePath: AssetsRes.MY_COLLECTION_ICON,
                            text: AppString.myCollection,
                          ),
                          TheTab(
                            imagePath: AssetsRes.MY_STAR_ICON,
                            text: AppString.myStar,
                          ),
                          TheTab(
                            imagePath: AssetsRes.MY_SHOPPING_ICON,
                            text: AppString.myShopping,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          MyCreatePage(),
                          MyCollectionPage(),
                          MyStarPage(),
                          MyShoppingPage()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15,right:15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyAppBar(),
                Row(
                  children: [
                    AvatarComponent(height: 160,),
                    SizedBox(width: 15.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "菠萝吹雪",
                              style: AppFonts.myPageName,
                            ),
                            SizedBox(width: 300.w,),
                            GestureDetector(
                              child: Image.asset(AssetsRes.SETTING_ICON),
                              //进入设置页面
                              onTap: (){
                                Get.toNamed(AppRoutes.settings);
                              },
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            children: [
                              Text(
                                "bcvhsgvabxhabsjx273261gvwvxh",
                                style: AppFonts.fontSize24,
                              ),
                              Icon(Icons.copy,color: AppColor.labelColorSelected, size: 20.sp,)
                            ],
                          ),
                        ),
                        Text("粉丝 20  关注 10",style: AppFonts.fontSize24,),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text("点击编辑个人简介",style: AppFonts.fontSize24,),
                      Icon(Icons.edit, size: 20.sp,),
                      Spacer(),
                      Image.asset(AssetsRes.USER_ICON)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyPageButton(text: AppString.myOrder, iconPath: AssetsRes.MY_ORDER_ICON),
                      MyPageButton(text: AppString.myMoney, iconPath: AssetsRes.MY_MONEY_BAG_ICON)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


}

class TheTab extends StatelessWidget {
  final String imagePath;
  final String text;

  const TheTab({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: LayoutBuilder(
        builder: (_, constraints){
          return Column(
            children: [
              Image.asset(
                imagePath,
                color: AppColor.myIconColor,
                width: constraints.constrainWidth() * 0.6,
                height: constraints.constrainWidth() * 0.6,
              ),
              Text(
                text,
                style: TextStyle(color: AppColor.myIconColor, fontSize: 28.sp),
              )
            ],
          );
      }),
    );
  }
}



