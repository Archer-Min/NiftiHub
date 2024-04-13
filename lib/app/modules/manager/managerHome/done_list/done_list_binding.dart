import 'package:get/get.dart';

import 'done_list_logic.dart';

class DoneListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoneListLogic());
  }
}
