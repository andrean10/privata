import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/routes/app_pages.dart';

class WelcomeController extends GetxController {
  late final InitController _initC;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }
  }

  void moveToMain() => Get.offAllNamed(Routes.MAIN);
}
