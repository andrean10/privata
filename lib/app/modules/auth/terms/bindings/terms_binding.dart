import 'package:get/get.dart';

import '../controllers/terms_controller.dart';

class TermsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsController>(() => TermsController());
  }
}
