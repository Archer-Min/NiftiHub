import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:niftihub/app/data/net/api_user.dart';
import 'package:niftihub/app/routes/app_routes.dart';
import 'package:niftihub/app/utils/mmkv.dart';

import 'my_settings_state.dart';

class MySettingsLogic extends GetxController {
  final MySettingsState state = MySettingsState();

  void logout() {
    try {
      ApiUser.logout();
      MMKVUtil.clear();
    } catch (e) {
      debugPrint(e.toString());
      return;
    }
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.login);
    });
  }
}
