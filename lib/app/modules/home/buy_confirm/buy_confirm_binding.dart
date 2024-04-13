import 'package:get/get.dart';

import 'buy_confirm_logic.dart';

class BuyConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuyConfirmLogic());
  }
}
