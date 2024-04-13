import 'package:get/get.dart';

import 'show3_d_logic.dart';

class Show3DBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Show3DLogic());
  }
}
