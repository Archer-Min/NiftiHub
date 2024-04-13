import 'package:get/get.dart';

import 'my_create_logic.dart';

class MyCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCreateLogic());
  }
}
