import 'package:get/get.dart';

import 'manager_my_logic.dart';

class ManagerMyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManagerMyLogic());
  }
}
