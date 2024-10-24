import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/data/db/menu/menu_model.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

class MainController extends GetxController {
  late final InitController _initC;
  final currentIndex = 0.obs;

  final menu = [
    MenuModel(
      icon: Icons.dashboard_rounded,
      label: 'Dashboard',
    ),
    MenuModel(
      icon: Icons.person_add_rounded,
      label: 'Pendaftaran',
    ),
    MenuModel(
      icon: Icons.medical_services_rounded,
      label: 'RME',
    ),
    MenuModel(
      icon: Icons.shopping_cart_rounded,
      label: 'Kasir',
    ),
    MenuModel(
      icon: Icons.person_rounded,
      label: 'Profile',
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
  }

  void setDestination(int value) => currentIndex.value = value;
}
