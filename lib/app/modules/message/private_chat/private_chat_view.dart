import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/theme/app_fonts.dart';
import 'package:niftihub/app/widgets/avatar/avatar_view.dart';
import 'package:niftihub/app/widgets/base_search_bar.dart';

import 'private_chat_logic.dart';

class PrivateChatPage extends StatelessWidget {
  const PrivateChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<PrivateChatLogic>();
    // final state = Get.find<PrivateChatLogic>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseSearchBar(hintText: "搜索用户", onSearch: (){}),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("在线好友",style: AppFonts.myPageName,),
          ),
          Row(
            children: [
              AvatarComponent(height: 120,)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("信息",style: AppFonts.myPageName,),
          ),

        ],
      ),
    );
  }
}
