import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../../helpers/format_date_time.dart';
import '../../../../../routes/app_pages.dart';

class CashierController extends GetxController {
  late final InitController _initC;

  final dateC = TextEditingController();
  final dateF = FocusNode();

  final isFilter = false.obs;
  final isLoading = false.obs;
  final isFabVisible = true.obs;

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

  void setFilter() => isFilter.toggle();

  void setDate(DateTime value) {
    dateC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: value.toString(),
    );
  }

  Future<void> filter() async {
    if (!isLoading.value) {
      isLoading.value = true;

      try {
        await Future.delayed(3.seconds);
        isLoading.value = false;
      } catch (e) {
        _initC.logger.e('Error: $e');
      }
    }
  }

  void clearData() {
    dateC.clear();
    dateF.unfocus();
  }

  void moveToPage(bool state) {
    if (state) {
    } else {
      Get.toNamed(Routes.TRANSACTION);
    }
  }

  bool onNotification(ScrollNotification notification) {
    if (notification is ScrollStartNotification) {
      isFabVisible.value = false;
    } else if (notification is ScrollEndNotification) {
      isFabVisible.value = true;
    }
    return true;
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    await Future.delayed(5.seconds);
    isLoading.value = false;
  }
}
