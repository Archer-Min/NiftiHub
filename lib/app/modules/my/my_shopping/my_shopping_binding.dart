import 'package:get/get.dart';

import 'my_shopping_logic.dart';

class MyShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyShoppingLogic());
  }
}
