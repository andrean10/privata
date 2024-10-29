import 'package:get/get.dart';

import '../../../../../../data/db/transaction/transaction_model.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../../init/controllers/init_controller.dart';

class DetailBillingLandingController extends GetxController {
  late final InitController _initC;
  late final TransactionModel data;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    data = Get.arguments as TransactionModel;
  }

  void moveToInvoice() => Get.toNamed(
        Routes.INVOICE,
        arguments: 'Invoice',
      );
}
