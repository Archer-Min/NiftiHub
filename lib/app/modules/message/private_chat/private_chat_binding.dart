import 'package:get/get.dart';

import 'private_chat_logic.dart';

class PrivateChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivateChatLogic());
  }
}
