import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../init/controllers/init_controller.dart';

class ForgotPasswordController extends GetxController {
  late final InitController _initC;

  final formKey = GlobalKey<FormState>();
  final emailC = TextEditingController();

  final emailF = FocusNode();

  final email = ''.obs;

  final isLoading = false.obs;
  final errMsg = RxnString();

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

  void confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();

    isLoading.value = true;

    Future.delayed(3.seconds, () {
      isLoading.value = false;
      moveToVerifyForgotPassword();
    });

    // _checkUser();
  }

  void moveToVerifyForgotPassword() =>
      Get.toNamed(Routes.VERIFY_FORGOT_PASSWORD);

  void moveToLogin() => Get.back();
}
