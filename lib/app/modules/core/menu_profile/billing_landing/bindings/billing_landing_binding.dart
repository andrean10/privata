import 'package:get/get.dart';

import '../controllers/billing_landing_controller.dart';

class BillingLandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillingLandingController>(
      () => BillingLandingController(),
    );
  }
}
