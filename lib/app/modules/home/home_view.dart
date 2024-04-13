import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/modules/home/home_clarify_grid_view/home_clarify_grid_view_view.dart';
import 'package:niftihub/app/modules/home/home_manghe/home_manghe_view.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/base_search_bar.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niftihub/res/assets_res.dart';

import 'home_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>HomeLogic());
    final logic = Get.find<HomeLogic>();
    final state = Get.find<HomeLogic>().state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GradientBackground(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 1200.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23.0),
                  topRight: Radius.circular(23.0),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
              left: 10,
              right: 10,
              child: Container(
                width: double.infinity,
                height: 1300.h,
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                        child: TabBar(
                          labelColor: AppColor.selectedIndexColor, // 设置选中标签的颜色
                          unselectedLabelColor: Colors.black, // 设置未选中标签的颜色
                          indicatorColor: AppColor.selectedIndexColor,

                          tabs: [
                            Text("推荐",style: TextStyle(fontSize: 18),),
                            Text("新春区",style: TextStyle(fontSize: 18),),
                            Text("盲盒区",style: TextStyle(fontSize: 18),),
                            Text("卡牌区",style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      Expanded(
                        child: TabBarView(
                          children: [
                            HomeClarifyGridViewPage(list: state.recommendList),
                            HomeClarifyGridViewPage(list: state.springList),
                            HomeManghePage(),
                            HomeClarifyGridViewPage(list: state.kapaiList),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Column(
                  children: [
                    BaseSearchBar(hintText: AppString.homeSearchHintText, onSearch: (){}),
                ],),
              ))
        ],
      ),
    );
  }
}
