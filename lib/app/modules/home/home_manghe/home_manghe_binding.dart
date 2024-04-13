import 'package:get/get.dart';

import 'home_manghe_logic.dart';

class HomeMangheBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeMangheLogic());
  }
}
