import 'package:get/get.dart';

import '../controllers/visit_registration_controller.dart';

class VisitRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitRegistrationController>(
      () => VisitRegistrationController(),
    );
  }
}
