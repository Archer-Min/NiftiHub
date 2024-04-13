import 'package:get/get.dart';

import 'todo_list_logic.dart';

class TodoListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoListLogic());
  }
}
