import 'package:get/get.dart';

import 'avatar_logic.dart';

class AvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AvatarLogic());
  }
}
