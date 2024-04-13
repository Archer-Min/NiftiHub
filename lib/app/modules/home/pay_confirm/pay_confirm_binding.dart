import 'package:get/get.dart';

import 'pay_confirm_logic.dart';

class PayConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PayConfirmLogic());
  }
}
