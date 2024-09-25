import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../routes/app_pages.dart';

class RmeController extends GetxController with GetTickerProviderStateMixin {
  late final InitController _initC;

  late final TabController tabC;

  final searchC = TextEditingController();

  final search = RxnString();

  final status = RxnString();

  final listTab = [
    'Hari Ini',
    'Semua',
  ];

  final dataPasien = ['Andre', 'Sabda', 'Azis'];

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    tabC = TabController(length: 2, vsync: this);

    _initTextC();
  }

  void _initTextC() {
    searchC.addListener(setSearch);
  }

  void setSearch() => search.value = searchC.text;

  void onChangedStatus(String? value) => status.value = value;

  Future<List<String>> getData(String? filter) async {
    try {
      if (filter != null && filter.isNotEmpty) {
        await Future.delayed(3.seconds);
        return dataPasien
            .where(
              (element) => element.toLowerCase().contains(filter.toLowerCase()),
            )
            .toList();
      }
    } catch (e) {
      _initC.logger.e('Error: $e');
    }

    return [];
  }

  void moveToEMR() => Get.toNamed(Routes.EMR);

  void moveToTimelineEMR() => Get.toNamed(Routes.TIMELINE_EMR);

  void clearSearch() {
    searchC.clear();
    search.value = null;
  }
}
