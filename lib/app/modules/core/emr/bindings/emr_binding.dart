import 'package:get/get.dart';

import '../controllers/emr_controller.dart';

class EmrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmrController>(() => EmrController());
  }
}
