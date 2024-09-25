import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../routes/app_pages.dart';

class PaymentStatusController extends GetxController {
  late final InitController _initC;

  final isSuccessfully = false.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    isSuccessfully.value = Get.arguments as bool;
  }

  void moveToPayment() => Get.toNamed(Routes.PAYMENT);

  void moveToInvoice() => Get.toNamed(
        Routes.INVOICE,
        arguments: 'Bukti Pembayaran',
      );

  void moveToMain() => Get.offAllNamed(Routes.MAIN);
}
