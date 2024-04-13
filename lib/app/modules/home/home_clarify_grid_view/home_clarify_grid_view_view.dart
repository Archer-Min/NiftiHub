import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/widgets/home/home_gridview_card.dart';
import 'package:niftihub/app/widgets/my/my_collection_card.dart';
import 'package:niftihub/res/assets_res.dart';

import 'home_clarify_grid_view_logic.dart';

class HomeClarifyGridViewPage extends StatelessWidget {
  final List<Map<String, String>> list;
  const HomeClarifyGridViewPage({Key? key, required this.list,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<HomeClarifyGridViewLogic>();
    // final state = Get.find<HomeClarifyGridViewLogic>().state;

    return Container(
      height: 600.h,
      child: HomeGridView(list: list,),
    );
  }
}

class HomeGridView extends StatelessWidget {
  final List<Map<String, String>> list;
  const HomeGridView({Key? key, required this.list}) : super(key: key);

  // final List<Map<String, String>> list = [
  Widget _listdata(context,index){
    return HomeGridViewCard(
      imgPath: list[index]["imgPath"]!,
      title: list[index]["title"]!,
      total: list[index]["total"]!,
      price: list[index]["price"]!,
      sold: list[index]["sold"]!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15,mainAxisExtent: 300),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // 执行页面跳转操作
            // 例如，使用Get.to()进行页面跳转
            Get.toNamed(AppRoutes.priceList);
          },
          child: _listdata(context, index),
        );
      },
    );
  }
}

