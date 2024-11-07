import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/helpers/text_helper.dart';
import 'package:privata/services/payment/payment_connect.dart';

import '../../../../../../shared/shared_enum.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../init/controllers/init_controller.dart';

class SubscribeController extends GetxController
    with GetTickerProviderStateMixin {
  late final InitController _initC;
  late final PaymentConnect _paymentCn;

  final formKey = GlobalKey<FormState>();
  final productC = TextEditingController();
  final durationC = TextEditingController();
  final voucherC = TextEditingController();

  final voucherModalC = TextEditingController();

  final productF = FocusNode();
  final durationF = FocusNode();
  final voucherF = FocusNode();

  final product = Rxn<SubscriptionProduct>();
  final duration = RxnString();
  final voucher = ''.obs;
  final voucherModal = ''.obs;

  final isLoading = false.obs;
  final errMsg = ''.obs;

  final isExpandedBottomSheet = false.obs;

  late final AnimationController animBottomSheetC;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _paymentCn = PaymentConnect();
    animBottomSheetC = AnimationController(vsync: this);

    _initTextC();
  }

  void _initTextC() {
    voucherModalC.addListener(setModalVoucher);
  }

  void expandedBottomSheet(bool state) => isExpandedBottomSheet.value = state;

  void setProduct(SubscriptionProduct? value) {
    productC.text = TextHelper.capitalizeEachWords(value?.name) ?? '';
    product.value = value;
    Get.back();
  }

  void setVoucher() {
    voucherC.text = voucherModal.value;
    voucher.value = voucherModal.value;

    voucherModalC.clear();
    voucherModal.value = '';
    Get.back();
  }

  void setModalVoucher() {
    voucherModal.value = voucherModalC.text;
  }

  void setDuration(String? value) {
    durationC.text = value ?? '';
    duration.value = value ?? '';
    Get.back();
  }

  void moveToStatusPayment() => Get.toNamed(Routes.PAYMENT_STATUS);

  void moveToPayment() => Get.toNamed(Routes.PAYMENT);
}
