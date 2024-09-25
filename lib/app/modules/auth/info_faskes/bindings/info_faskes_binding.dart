import 'package:get/get.dart';

import '../controllers/info_faskes_controller.dart';

class InfoFaskesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoFaskesController>(() => InfoFaskesController());
  }
}
