import 'package:get/get.dart';

import 'login_logic.dart';

class ManagerLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManagerLoginLogic());
  }
}
