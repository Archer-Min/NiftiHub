import 'package:get/get.dart';

import 'show_detail_logic.dart';

class ShowDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowDetailLogic());
  }
}
