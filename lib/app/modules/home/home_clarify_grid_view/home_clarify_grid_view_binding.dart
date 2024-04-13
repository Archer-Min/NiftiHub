import 'package:get/get.dart';

import 'home_clarify_grid_view_logic.dart';

class HomeClarifyGridViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeClarifyGridViewLogic());
  }
}
