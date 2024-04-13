import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/widgets/my/my_dropdown_selector.dart';
import 'package:niftihub/app/widgets/no_contain_area.dart';

import 'my_shopping_logic.dart';

class MyShoppingPage extends StatelessWidget {
  const MyShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<MyShoppingLogic>();
    // final state = Get.find<MyShoppingLogic>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
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
          NoContainPage(nothingText: AppString.noShopping, gotoButtonText: AppString.shoppingButton)
        ],
      ),
    );
  }
}
