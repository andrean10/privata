import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/modules/widgets/snackbar/snackbar.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../../../data/db/menu/menu_model.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../widgets/dialog/dialogs.dart';

class SettingController extends GetxController {
  late final InitController _initC;

  String? name;
  String? email;

  final menuProfile = [
    MenuModel(
      iconData: Icons.person_rounded,
      label: 'Profile Saya',
      onPressed: () {},
    ),
    // MenuModel(
    //   icon: Icons.card_membership_rounded,
    //   label: 'Langganan',
    //   onPressed: () {},
    // ),
    MenuModel(
      iconData: Icons.dataset_rounded,
      label: 'Data Master',
    ),
    MenuModel(
      iconData: Icons.print_rounded,
      label: 'Pengaturan Printer',
    ),
    MenuModel(
      iconData: Icons.exit_to_app_rounded,
      label: 'Logout',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _init();

    name = _initC.localStorage.read<String>(ConstantsKeys.createdName);
    email = _initC.localStorage.read<String>(ConstantsKeys.email);
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }
  }

  void onTap({
    required BuildContext context,
    required int index,
  }) async {
    switch (index) {
      // // case 1:
      // //   _moveToBilling();
      case 0:
        break;
      case 1:
        // _moveToPrinterSettings();
        break;
      case 2:
        _moveToPrinterSettings();
        break;
      case 3:
        _showDialogLogout(context);
        break;
    }
  }

  Future<void> _showDialogLogout(BuildContext context) async {
    Dialogs.logout(
      context: context,
      initC: _initC,
    );
  }

  Future<void> logOut() async {
    final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);

    if (token != null) {
      try {
        final res = await _initC.authCn.logout(token);

        if (res.isOk) {
          // clear cache login
          await _initC.localStorage.erase();
          await _initC.localStorage.write(ConstantsKeys.isFirstUsingApp, false);
          moveToLogin();
        } else {
          Snackbar.failed(
            context: Get.context!,
            content:
                'Gagal logout, sepertinya token anda telah berubah tetap logout?',
            action: SnackBarAction(
              label: 'Iya',
              onPressed: moveToLogin,
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

  // void _moveToBilling() => Get.toNamed(Routes.BILLING_LANDING);

  void _moveToPrinterSettings() => Get.toNamed(Routes.PRINTER_SETTINGS);

  void moveToLogin() => Get.offAllNamed(Routes.LOGIN);
}
