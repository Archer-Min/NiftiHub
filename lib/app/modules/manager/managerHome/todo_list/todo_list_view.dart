import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/widgets/manager/todo_list_card.dart';
import 'package:niftihub/res/assets_res.dart';

import 'todo_list_logic.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<TodoListLogic>();
    // final state = Get.find<TodoListLogic>().state;
    List<String> ids = [
      "bcvhsgvabxhabsjx273261gvwvxh",
      "jkjosgvabxhasajx273332gvwvxj",
      "vkjosgvabxhas35b8n3332gvwvxh",
      "jmjosgvabdassajx2733sddcavnh",
      "lyjosgvuyxhasajx27yy32gvwvxh",
      "rkjosgvabxharajx893332gvwvrg",
      "tkjosgvabxhasa56223332gvwtth",
      "tui0josgvabxhasajx253332gvw9",
      "jtj532vabxhasajxyr3332gvwvxh",
      "jkjosgvabxhasajx273332gvwvxh",
    ];

    List<String> titles = [
      "鱼苗",
      "猫猫虫",
      "乌萨奇",
      "文豪野犬",
      "中原中也",
      "自行车",
      "御喵",
      "山茶花",
      "车厘子",
      "乌蒙山",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(10, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TodoListCard(
                notDone: true,
                imaPath: AssetsRes.COLLECTION_EG_AVATAR,
                title: titles[index],
                id: ids[index],
                onTab: (){
                  Get.toNamed(AppRoutes.check);
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
