import 'package:get/get.dart';

import 'group_logic.dart';

class GroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GroupLogic());
  }
}
