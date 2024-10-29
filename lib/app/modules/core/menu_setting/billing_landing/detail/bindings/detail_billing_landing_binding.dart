import 'package:get/get.dart';

import '../controllers/detail_billing_landing_controller.dart';

class DetailBillingLandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBillingLandingController>(
      () => DetailBillingLandingController(),
    );
  }
}
