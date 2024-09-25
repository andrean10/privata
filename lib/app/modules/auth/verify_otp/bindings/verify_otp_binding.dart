import 'package:get/get.dart';
import 'package:privata/app/modules/timer/controllers/timer_controller.dart';

import '../controllers/verify_otp_controller.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyOtpController>(() => VerifyOtpController());
    Get.lazyPut(() => TimerController(1.minutes.inSeconds));
  }
}
