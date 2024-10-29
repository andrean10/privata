import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:privata/app/data/db/menu/menu_model.dart';
import 'package:privata/app/modules/core/menu_cashier/cashier/controllers/cashier_controller.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../../../utils/constants_assets.dart';
import '../../menu_registration/rj/controllers/rj_controller.dart';

class MainController extends GetxController {
  late final InitController _initC;
  late final RJController rjC;
  late final CashierController cashierC;

  String? name;
  String? email;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final currentIndex = 0.obs;
  final appBarActions = <Widget>[].obs;

  final menu = [
    MenuModel(
      iconAsset: ConstantsAssets.icDashboard,
      label: 'Dashboard',
    ),
    MenuModel(
      iconAsset: ConstantsAssets.icPendaftaran,
      label: 'Pendaftaran',
    ),
    MenuModel(
      iconAsset: ConstantsAssets.icRME,
      label: 'Rekam Medis Elektronik',
    ),
    MenuModel(
      iconAsset: ConstantsAssets.icCashier,
      label: 'Kasir',
    ),
    MenuModel(
      iconAsset: ConstantsAssets.icSettings,
      label: 'Setting',
    )
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

    if (Get.isRegistered<RJController>()) {
      rjC = Get.find<RJController>();
    }

    if (Get.isRegistered<CashierController>()) {
      cashierC = Get.find<CashierController>();
    }

    name = _initC.localStorage.read<String>(ConstantsKeys.createdName);
    email = _initC.localStorage.read<String>(ConstantsKeys.email);
  }

  void setDestination(int page) {
    currentIndex.value = page;
    scaffoldKey.currentState?.closeDrawer();
  }

  Future<XFile?> pickFile(ImageSource source) async {
    try {
      final xFile = await ImagePicker().pickImage(source: source);
      return xFile;
    } on Exception catch (e) {
      _initC.logger.e('error: pickImage = $e');
    }
    return null;
  }
}
