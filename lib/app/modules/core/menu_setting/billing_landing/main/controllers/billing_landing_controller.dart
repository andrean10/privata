import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../../../../shared/shared_enum.dart';
import '../../../../../../data/db/transaction/transaction_model.dart';
import '../../../../../../routes/app_pages.dart';

class BillingLandingController extends GetxController {
  late final InitController _initC;

  final state = BillingState.inActive.obs;

  final data = TransactionModel(
    noInvoice: 'INV128382329323',
    transactionDate: DateTime(2022, 9, 20, 10, 49),
    visitor: 140,
    maxVisitor: 200,
    endTransaction: DateTime(2040, 10, 30),
    channelPayment: 'Bank Transfer (BCA)',
    total: 800000,
    isPurchased: false,
  );

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

  void moveToDetailLanding(TransactionModel data) {
    Get.toNamed(Routes.DETAIL_BILLING_LANDING, arguments: data);
  }

  void moveToPackages() => Get.toNamed(Routes.SUBSCRIBE);
}
