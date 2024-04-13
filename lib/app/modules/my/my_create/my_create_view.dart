import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/widgets/my/my_dropdown_selector.dart';
import 'package:niftihub/app/widgets/no_contain_area.dart';
import 'package:niftihub/res/assets_res.dart';

import 'my_create_logic.dart';

class MyCreatePage extends StatelessWidget {
  const MyCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<MyCreateLogic>();
    // final state = Get.find<MyCreateLogic>().state;

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
          NoContainPage(
            nothingText: AppString.noCreate, gotoButtonText: AppString.createButton,
            onPressed: (){
              Get.toNamed(AppRoutes.create);
            },
          )
        ],
      ),
    );
  }
}
