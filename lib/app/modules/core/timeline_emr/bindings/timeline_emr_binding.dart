import 'package:get/get.dart';

import '../controllers/timeline_emr_controller.dart';

class TimelineEmrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimelineEmrController>(
      () => TimelineEmrController(),
    );
  }
}
