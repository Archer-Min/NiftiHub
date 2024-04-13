import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/widgets/my/my_collection_card.dart';
import 'package:niftihub/app/widgets/my/my_dropdown_selector.dart';
import 'package:niftihub/app/widgets/no_contain_area.dart';
import 'package:niftihub/res/assets_res.dart';

import 'my_collection_logic.dart';

class MyCollectionPage extends StatelessWidget {
  const MyCollectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<MyCollectionLogic>();
    // final state = Get.find<MyCollectionLogic>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyDropdownSelector(tag: "系列",),
              MyDropdownSelector(tag: "价格",),
              MyDropdownSelector(tag: "时间",),
              MyDropdownSelector(tag: "筛选",),
              Icon(Icons.search)
            ],
          ),
          //NoContainPage(nothingText: AppString.noCollection, gotoButtonText: AppString.buyButton)
          Container(
            height: 665.h,
              child: CollectionGridview())
          //MyCollectionCard(title: "title", imgPath: AssetsRes.EXAMPLE1)
        ],
      ),
    );
  }
}

class CollectionGridview extends StatefulWidget{


  const CollectionGridview({super.key});

  @override
  State<CollectionGridview> createState() => _CollectionGridviewState();
}

class _CollectionGridviewState extends State<CollectionGridview> {
  final List<Map<String, String>> list = [
    {"imgPath": AssetsRes.EXAMPLE1, "title": "原子弹"},
    {"imgPath": AssetsRes.EXAMPLE1, "title": "猫猫虫"},
    {"imgPath": AssetsRes.EXAMPLE1, "title": "回旋镖"},
    {"imgPath": AssetsRes.EXAMPLE1, "title": "一闪一闪亮晶晶"},
    {"imgPath": AssetsRes.EXAMPLE1, "title": "别打了"},
    {"imgPath": AssetsRes.EXAMPLE1, "title": "什么鬼"},
  ];

  Widget _listdata(context,index){
    return MyCollectionCard(imgPath: list[index]["imgPath"]!, title: list[index]["title"]!);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15,mainAxisExtent: 200),
      itemBuilder: _listdata,
    );
  }
}
