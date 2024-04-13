import 'package:get/get.dart';

import 'show_logic.dart';

class ShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowLogic());
  }
}
