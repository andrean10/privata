import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../../routes/app_pages.dart';

class WalkthroughController extends GetxController {
  late final InitController _initC;
  late final PageController pageC;
  final currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    pageC = PageController();
    pageC.addListener(setCurrentPage);
  }

  void setCurrentPage() {
    currentPage.value = pageC.page?.toInt() ?? 0;

    _initC.logger.d('debug: current page: $currentPage');
  }

  Future<void> moveToLogin() async {
    await _savedPref();
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    pageC.dispose();
    super.onClose();
  }

  Future<void> _savedPref() async {
    await _initC.localStorage.write(ConstantsKeys.isFirstUsingApp, false);
  }
}
