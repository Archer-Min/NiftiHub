import 'package:get/get.dart';

import 'price_list_logic.dart';

class PriceListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PriceListLogic());
  }
}
