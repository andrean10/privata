import 'package:get/get.dart';

import '../controllers/rme_controller.dart';

class RmeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RmeController>(() => RmeController());
  }
}
