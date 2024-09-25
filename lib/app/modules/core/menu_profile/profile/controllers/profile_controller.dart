import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/modules/widgets/snackbar/snackbar.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../../../data/models/menu/menu_model.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../widgets/dialog/dialogs.dart';

class ProfileController extends GetxController {
  late final InitController _initC;

  final menuProfile = [
    MenuModel(
      icon: Icons.person_rounded,
      label: 'Profile Saya',
      onPressed: () {},
    ),
    MenuModel(
      icon: Icons.card_membership_rounded,
      label: 'Langganan',
      onPressed: () {},
    ),
    MenuModel(
      icon: Icons.print_rounded,
      label: 'Pengaturan Printer',
    ),
    MenuModel(
      icon: Icons.exit_to_app_rounded,
      label: 'Logout',
    ),
  ];

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

  Future<XFile?> pickFile(ImageSource source) async {
    try {
      final xFile = await ImagePicker().pickImage(source: source);
      return xFile;
    } on Exception catch (e) {
      _initC.logger.e('error: pickImage = $e');
    }
  }

  void onTap({
    required BuildContext context,
    required int index,
  }) async {
    switch (index) {
      case 0:
        profile();
      case 1:
        _moveToBilling();
      case 2:
        _moveToPrinterSettings();
      case 3:
        _showDialogLogout(context);
    }
  }

  void profile() {}

  Future<void> _showDialogLogout(BuildContext context) async {
    final state = await Dialogs.logout(context: context);

    if (state ?? false) {
      logOut();
    }
  }

  Future<void> logOut() async {
    final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);

    if (token != null) {
      try {
        final res = await _initC.authCn.logout(token);

        await _initC.auth.signOut();
        await _initC.localStorage.erase();

        if (res.isOk) {
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

  void _moveToBilling() => Get.toNamed(Routes.BILLING_LANDING);

  void _moveToPrinterSettings() => Get.toNamed(Routes.PRINTER_SETTINGS);

  void moveToLogin() => Get.offAllNamed(Routes.LOGIN);
}
