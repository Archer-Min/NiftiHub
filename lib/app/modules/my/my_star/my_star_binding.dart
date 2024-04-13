import 'package:get/get.dart';

import 'my_star_logic.dart';

class MyStarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyStarLogic());
  }
}
