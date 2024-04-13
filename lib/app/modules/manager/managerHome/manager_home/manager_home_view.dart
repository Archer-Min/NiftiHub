import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/modules/home/home_clarify_grid_view/home_clarify_grid_view_view.dart';
import 'package:niftihub/app/modules/manager/managerHome/done_list/done_list_view.dart';
import 'package:niftihub/app/modules/manager/managerHome/todo_list/todo_list_view.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/base_search_bar.dart';

import 'manager_home_logic.dart';

class ManagerHomePage extends StatelessWidget {
  const ManagerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<ManagerHomeLogic>();
    // final state = Get.find<ManagerHomeLogic>().state;

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
                          Text("待办",style: TextStyle(fontSize: 18),),
                          Text("已办",style: TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Expanded(
                      child: TabBarView(
                        children: [
                          TodoListPage(),
                          DoneListPage(),
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
