import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/widgets/BaseAvatar.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/TheSlider.dart';
import 'package:niftihub/app/widgets/my/my_star_card.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:niftihub/app/widgets/total_sale_tag.dart';
import 'package:niftihub/res/assets_res.dart';

import 'collection_detail_logic.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CollectionDetailLogic>();
    final state = Get.find<CollectionDetailLogic>().state;

    return Scaffold(
      bottomNavigationBar:
        Container(
          width: double.infinity,
          height: 120.h,
          color: AppColor.bottomBar,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("¥900",style: AppFonts.detailPriceText,),
                Image.asset(AssetsRes.CHAT3),
                Image.asset(AssetsRes.STAR2),
                Row(
                  children: [
                    Container(
                      height: 65.h,
                      width: 235.w,
                      decoration: BoxDecoration(
                        color: AppColor.buttonBorder,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0), // 左上角圆角
                          bottomLeft: Radius.circular(20.0), // 左下角圆角
                        ),
                      ),
                      child: Center(child: Text(AppString.putShopping,style: AppFonts.buyAndPayBtText,)),
                    ),
                    GestureDetector(
                      onTap: (){Get.toNamed(AppRoutes.buyConfirm);},
                      child: Container(
                        height: 65.h,
                        width: 235.w,
                        decoration: BoxDecoration(
                          gradient: AppColor.gradientBuyBt,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0), // 左上角圆角
                            bottomRight: Radius.circular(20.0), // 左下角圆角
                          ),
                        ),
                        child: Center(child: Text(AppString.buyNow,style: AppFonts.buyAndPayBtText,)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      body: Stack(
        children: [
          GradientBackground2(),
          SafeArea(
            child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios), // 设置新的返回图标
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      backgroundColor: Colors.transparent,
                      expandedHeight: 400.0,
                      pinned: false,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          width: double.infinity,
                          child: Image.asset(AssetsRes.COLLECTION_EXAMPLE,fit: BoxFit.fill,),
                        ),
                      ),
                    ),
                  ];
                },
                body: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(23.0),
                      topRight: Radius.circular(23.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("¥900",style: AppFonts.detailPriceText,),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.lightBlue
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:3,right: 13.0,top: 3,bottom: 3),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10.0),
                                            child: Container(
                                              height: 50.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                gradient: gradientColor2
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Image.asset(AssetsRes.CHAT2,fit: BoxFit.fill,),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "加入群聊",
                                            style: AppFonts.tagFont,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("初夏siki",style: AppFonts.detailPriceText,),
                                  SizedBox(width: 8,),
                                  Icon(Icons.copy,color: AppColor.labelColorSelected, size: 35.sp,)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: TagBt(tag: "潮玩区"),
                              ),
                              Row(
                                children: [
                                  TotalAndSaleContainer(tag:"总量",total: "68888"),
                                  SizedBox(width: 40,),
                                  TotalAndSaleContainer(tag: "销量", total: "5999")
                                ],
                              ),
                            ],
                          ),
                        ),
                        TheSlider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                          child: Row(
                            children: [
                              BaseAvatar(imgPath: AssetsRes.EXAMPLE2,height: 100,),
                              SizedBox(width: 20,),
                              Expanded(child: Text("小原子氮",style: AppFonts.myPageName,)),
                              TagBt(tag: "其他寄售"),
                              Icon(Icons.arrow_forward_ios,color: Colors.grey,)
                            ],
                          ),
                        ),
                        TheSlider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("持有信息",style: AppFonts.myPageName,),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Container(child: Text("持有者",style: AppFonts.greyText,),width: 120.w,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text("bcnn***j"),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(child: Text("Token ID",style: AppFonts.greyText,),width: 120.w,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text("bcvhsgvabxhabsjx273261gvwvx"),
                                  ),
                                  Icon(Icons.copy,size: 25.sp,)
                                ],
                              )
                            ],
                          ),
                        ),
                        TheSlider(),
                        //作品详情
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(child: Image.asset(AssetsRes.ZUOPINXQ)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("作品描述",style: AppFonts.myPageName,),
                              Text("捕捉了初夏时节的绚丽景象，将大自然的美妙与数字艺术的创新相结合。整个作品呈现出一种清新、活泼、充满生机的氛围，仿佛置身于初夏时节的花海中。",style: AppFonts.greyText,),
                              SizedBox(height: 10,),
                              Text("作者介绍",style: AppFonts.myPageName,),
                              Text(AppString.introEg1,style: AppFonts.greyText,),
                            ],
                          ),
                        ),
                        TheSlider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("交易须知",style: AppFonts.myPageName,),
                              Text(AppString.introEg2,style: AppFonts.greyText,),
                            ],
                          ),
                        ),
                        TheSlider(),
                        //作品评论
                        Container(
                          decoration: BoxDecoration(
                            gradient: AppColor.gradientPink
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Center(child: Image.asset(AssetsRes.ZUOPINPL)),
                              ),
                              //评论输入框
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                                child: Container(
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                    color: AppColor.commentInputBg,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.grey, width: 0.3),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: BaseAvatar(imgPath: AssetsRes.EXAMPLE2,height: 60,)
                                      ),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: "喜欢作品就说点什么吧～",
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){},
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColor.searchBtColor,
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                          child: Text(
                                            "发送",
                                            style: TextStyle(color: Colors.white, fontSize: 28.sp),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //评论列表
                              Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
          ),
        ]
      ),
      // body: Stack(
      //   children: [
      //     Container(
      //       width: double.infinity,
      //       child: Image.asset(AssetsRes.COLLECTION_EXAMPLE),
      //     ),
      //     // MyAppBar(),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     width: double.infinity,
          //     height: 1000.h,
          //     decoration: const BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(23.0),
          //         topRight: Radius.circular(23.0),
          //       ),
          //     ),
          //   ),
          // ),
      //     // Background image with AnimatedOpacity
      //     // AnimatedOpacity(
      //     //   opacity: state.isAppBarVisible.value ? 1.0 : 0.0,
      //     //   duration: Duration(milliseconds: 500),
      //     //   child: Container(
      //     //     width: double.infinity,
      //     //     child: Image.asset(
      //     //       AssetsRes.COLLECTION_EXAMPLE,
      //     //       fit: BoxFit.cover,
      //     //     ),
      //     //   ),
      //     // ),
      //     // Background image with AnimatedOpacity
      //     AnimatedOpacity(
      //       opacity: state.isAppBarVisible.value ? 1.0 : 0.0,
      //       duration: Duration(milliseconds: 500),
      //       child: Container(
      //         width: double.infinity,
      //         child: Image.asset(
      //           AssetsRes.COLLECTION_EXAMPLE,
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      //     // NestedScrollView with SliverAppBar
      //     NestedScrollView(
      //       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //         return <Widget>[
      //           SliverAppBar(
      //             expandedHeight: 200.0,
      //             pinned: true,
      //             flexibleSpace: FlexibleSpaceBar(
      //               title: Text('My Collection'),
      //             ),
      //           ),
      //         ];
      //       },
      //       body: SingleChildScrollView(
      //         child: AnimatedPositioned(
      //           duration: Duration(milliseconds: 500),
      //           left: 0,
      //           right: 0,
      //           bottom: state.isAppBarVisible.value ? 0 : -1000.h, // Adjust the value as needed
      //           child: Container(
      //             height: 1000.h,
      //             decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(23.0),
      //                 topRight: Radius.circular(23.0),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     // MyAppBar
      //     Positioned(
      //       top: 0,
      //       left: 0,
      //       right: 0,
      //       child: MyAppBar(),
      //     ),
      //   ],
      // ),
    );
  }
}
