import 'package:get/get.dart';

import '../controllers/rj_controller.dart';

class RJBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RJController>(() => RJController());
  }
}
