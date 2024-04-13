import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/widgets/home/price_list_card.dart';
import 'package:niftihub/app/widgets/manager/todo_list_card.dart';
import 'package:niftihub/res/assets_res.dart';

import 'done_list_logic.dart';

class DoneListPage extends StatelessWidget {
  const DoneListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<DoneListLogic>();
    // final state = Get.find<DoneListLogic>().state;

    List<String> ids = [
      "rkjosgvabxharajx893332gvwvrg",
      "tkjosgvabxhasa56223332gvwtth",
      "tui0josgvabxhasajx253332gvw9",
      "jtj532vabxhasajxyr3332gvwvxh",
      "jkjosgvabxhasajx273332gvwvxh",
    ];

    List<String> titles = [
      "乌萨奇",
      "文豪野犬",
      "中原中也",
      "车厘子",
      "乌蒙山",
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TodoListCard(
                notDone: false,
                imaPath: AssetsRes.COLLECTION_EG_AVATAR,
                title: titles[index],
                id: ids[index],
                onTab: (){

                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
