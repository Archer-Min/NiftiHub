import 'package:get/get.dart';

import 'private_setting_logic.dart';

class PrivateSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivateSettingLogic());
  }
}
