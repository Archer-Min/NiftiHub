import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/modules/root/root_logic.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/widgets/base_search_bar.dart';
import 'package:niftihub/res/assets_res.dart';

import 'show_logic.dart';

class ShowPage extends StatefulWidget {

  const ShowPage({Key? key}) : super(key: key);

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  final appBarColorController = Get.put(RootLogic());
  var isDark = false.obs;

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<ShowLogic>();
    // final state = Get.find<ShowLogic>().state;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Obx(() {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: isDark.value ? AppColor.gradientBgDark : AppColor
                      .gradientBgLight),
              child: Image.asset(
                isDark.value ? AssetsRes.SHOW_BG_DARK : AssetsRes.SHOW_BG_LIGHT,
                fit: BoxFit.fill,
              ),
            );
          }),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 20),
              child: Obx(() {
                return Column(
                  children: [
                    BaseSearchBar(hintText: "搜索名称", onSearch: () {}),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Image.asset(isDark.value
                              ? AssetsRes.SHOW_TITLE_DARK
                              : AssetsRes.SHOW_TITLE_LIGHT),
                        ),
                        GestureDetector(
                            child: Icon(Icons.sunny,
                              color: isDark.value? Colors.white:Colors.orange,),
                            onTap: () {
                              if (isDark.value) {
                                appBarColorController.changeColor(
                                    AppColor.primaryColor);
                              } else {
                                appBarColorController.changeColor(
                                    AppColor.primaryDark);
                              }
                              isDark.value = !isDark.value;
                            }
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: double.infinity,
                      height: 1100.h,
                      child: ShowGridView(gradient: isDark.value? showCardGradientDark:gradientBtColor,),
                    )
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class ShowGridView extends StatelessWidget {
  final LinearGradient gradient;
  const ShowGridView({Key? key, required this.gradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15,mainAxisExtent: 270),
        itemBuilder: (context, index){
          return ShowCard(gradient: gradient,);
        }
    );
  }
}

class ShowCard extends StatelessWidget {
  final LinearGradient gradient;
  const ShowCard({Key? key, required this.gradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: GestureDetector(
        onTap: (){
          Get.toNamed(AppRoutes.showDetail);
        },
        child: Container(
          //这地方因为gridview没有用了，为什么不知道
          // height: 380.h,
          // width: 300.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            gradient: gradient,
            boxShadow: const [
              BoxShadow(
                color: Color(0xdfd0cccc),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 280.h,
                    height: 280.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.1), // 黑色细边框
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(AssetsRes.EXAMPLE1, fit: BoxFit.fill,),
                  ),
                  SizedBox(height: 20,),
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
                  SizedBox(height: 10,),
                  Center(child: Image.asset(AssetsRes.CHAOSHEN))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


