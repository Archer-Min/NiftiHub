import 'package:get/get.dart';

import 'collection_detail_logic.dart';

class CollectionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollectionDetailLogic());
  }
}
