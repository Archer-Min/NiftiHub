import 'package:get/get.dart';

import 'manager_home_logic.dart';

class ManagerHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManagerHomeLogic());
  }
}
