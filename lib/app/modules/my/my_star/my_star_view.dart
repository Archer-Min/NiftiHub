import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/widgets/my/my_dropdown_selector.dart';
import 'package:niftihub/app/widgets/my/my_star_card.dart';
import 'package:niftihub/app/widgets/no_contain_area.dart';

import 'my_star_logic.dart';

class MyStarPage extends StatelessWidget {
  const MyStarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<MyStarLogic>();
    // final state = Get.find<MyStarLogic>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyDropdownSelector(tag: "作品",),
              MyDropdownSelector(tag: "价格",),
              MyDropdownSelector(tag: "时间",),
              MyDropdownSelector(tag: "筛选",),
              Icon(Icons.search)
            ],
          ),
          MyStarCard(title: "菠萝吹雪", price: 300, starNum: 80, tag: "潮玩区"),
          //NoContainPage(nothingText: AppString.noStar, gotoButtonText: AppString.shoppingButton)
        ],
      ),
    );
  }
}
