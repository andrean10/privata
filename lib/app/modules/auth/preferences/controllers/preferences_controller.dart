import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../../utils/constants_keys.dart';
import '../../../../routes/app_pages.dart';
import '../../../widgets/snackbar/snackbar.dart';

class PreferencesController extends GetxController {
  late final InitController _initC;

  final longClinicOperatingC = TextEditingController();
  final numberVisitorC = TextEditingController();

  final longClinicOperatingF = FocusNode();
  final numberVisitorF = FocusNode();

  final longClinicOperating = ''.obs;
  final numberVisitor = ''.obs;

  final isActiveRMD = false.obs;
  final isActiveStock = false.obs;

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

  void confirm() {}

  void setActiveRMD(bool value) => isActiveRMD.value = value;

  void setActiveStock(bool value) => isActiveStock.value = value;

  void moveToFaskesInfo() => Get.toNamed(Routes.INFO_FASKES);

  Future<void> logOut() async {
    final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);

    if (token != null) {
      try {
        final res = await _initC.authCn.logout(token);

        await _initC.localStorage.erase();

        if (res.isOk) {
          _moveToLogin();
        } else {
          Snackbar.failed(
            context: Get.context!,
            content:
                'Gagal logout, sepertinya token anda telah berubah tetap logout?',
            action: SnackBarAction(
              label: 'Iya',
              onPressed: _moveToLogin,
            ),
            duration: const Duration(minutes: 1),
          );
        }
      } catch (e) {
        Snackbar.failed(
          context: Get.context!,
          content: 'Ada kesalahan saat ingin logout, coba lagi',
        );
        _initC.logger.e('error: $e');
      }
    }
  }

  void _moveToLogin() => Get.offAllNamed(Routes.LOGIN);
}
