import 'package:get/get.dart';

import 'create_logic.dart';

class CreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateLogic());
  }
}
