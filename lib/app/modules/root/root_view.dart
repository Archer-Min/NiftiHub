import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niftihub/app/modules/home/home_view.dart';
import 'package:niftihub/app/modules/manager/managerHome/manager_home/manager_home_view.dart';
import 'package:niftihub/app/modules/manager/my/manager_my/manager_my_view.dart';
import 'package:niftihub/app/modules/message/message_view.dart';
import 'package:niftihub/app/modules/my/my_view.dart';
import 'package:niftihub/app/modules/show/show_view.dart';
import 'package:niftihub/app/theme/app_colors.dart';
import 'package:niftihub/app/theme/app_string.dart';
import 'package:niftihub/app/utils/mmkv.dart';
import 'package:niftihub/app/widgets/MyTab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'root_logic.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final isManager = MMKVUtil.getBool(AppString.IS_MANAGER);
    return isManager ? ManagerRootPage() : UserRootPage();
  }

  @override
  void dispose() {
    Get.delete<RootLogic>();
    super.dispose();
  }
}

class UserRootPage extends StatefulWidget {
  const UserRootPage({Key? key}) : super(key: key);

  @override
  State<UserRootPage> createState() => _UserRootPageState();
}

class _UserRootPageState extends State<UserRootPage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<RootLogic>();
    final state = Get
        .find<RootLogic>()
        .state;

    late final TabController _tabCtrl = TabController(length: 4, vsync: this);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.rootBg,
      body: TabBarView(
        controller: _tabCtrl,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          ShowPage(),
          MessagePage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: Material(
        child: Obx(() {
          return Container(
            color: logic.appBarColor.value,
            child: StatefulBuilder(
              builder: (_, setState) {
                return TabBar(
                  controller: _tabCtrl,
                  indicator: const BoxDecoration(),
                  labelColor: AppColor.labelColorSelected,
                  unselectedLabelColor: AppColor.labelColorUnSe,
                  onTap: (index) =>
                  {
                    _tabCtrl.animateTo(index),
                    setState(() {})
                  },
                  tabs: [
                    MyTab("assets/image/House.png", AppString.homePage,
                        _tabCtrl.index == 0),
                    MyTab("assets/image/eye.png", AppString.showPage,
                        _tabCtrl.index == 1),
                    MyTab("assets/image/chat.png", AppString.messagePage,
                        _tabCtrl.index == 2),
                    MyTab("assets/image/account.png", AppString.myPage,
                        _tabCtrl.index == 3)
                  ],
                );
              },
            ),
          );
        }),
      ),
    );
  }
}


class ManagerRootPage extends StatefulWidget {
  const ManagerRootPage({Key? key}) : super(key: key);

  @override
  State<ManagerRootPage> createState() => _ManagerRootPageState();
}

class _ManagerRootPageState extends State<ManagerRootPage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<RootLogic>();
    final state = Get
        .find<RootLogic>()
        .state;

    late final TabController _tabCtrl = TabController(length: 2, vsync: this);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.rootBg,
      body: TabBarView(
        controller: _tabCtrl,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ManagerHomePage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: Material(
        child: Obx(() {
          return Container(
            color: logic.appBarColor.value,
            child: StatefulBuilder(
              builder: (_, setState) {
                return TabBar(
                  controller: _tabCtrl,
                  indicator: const BoxDecoration(),
                  labelColor: AppColor.labelColorSelected,
                  unselectedLabelColor: AppColor.labelColorUnSe,
                  onTap: (index) =>
                  {
                    _tabCtrl.animateTo(index),
                    setState(() {})
                  },
                  tabs: [
                    MyTab("assets/image/House.png", AppString.homePage,
                        _tabCtrl.index == 0),
                    MyTab("assets/image/account.png", AppString.myPage,
                        _tabCtrl.index == 1)
                  ],
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

