import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/modules/message/group/group_view.dart';
import 'package:niftihub/app/modules/message/notice/notice_view.dart';
import 'package:niftihub/app/modules/message/private_chat/private_chat_view.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/widgets/GradientBackground.dart';
import 'package:niftihub/app/widgets/my_app_bar.dart';

import 'message_logic.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<MessageLogic>();
    // final state = Get.find<MessageLogic>().state;

    return Scaffold(
      body: Stack(
        children: [
          GradientBackground2(),
          Column(
            children: [
              MyAppBar(title: "消息",),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 1000.h,
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 12),
                            child: TabBar(
                                labelColor: AppColor.selectedIndexColor,
                                unselectedLabelColor: Colors.black,
                                indicatorColor: AppColor.selectedIndexColor,
                                tabs: [
                                  Text("公告",style: TextStyle(fontSize: 18),),
                                  Text("群聊",style: TextStyle(fontSize: 18),),
                                  Text("消息",style: TextStyle(fontSize: 18),),
                                ]
                            ),
                          ),
                        ),
                        Expanded(child: TabBarView(
                          children: [
                            NoticePage(),
                            GroupPage(),
                            PrivateChatPage()
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
