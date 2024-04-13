import 'package:get/get.dart';

import 'my_settings_logic.dart';

class MySettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MySettingsLogic());
  }
}
