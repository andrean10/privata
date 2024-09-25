import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

class MedicalPrescriptionController extends GetxController {
  late final InitController _initC;

  final formKey = GlobalKey<FormState>();
  final medicineNameC = TextEditingController();
  final medicineUnitC = TextEditingController();
  final drinkingRulesC = TextEditingController();

  final medicineNameF = FocusNode();
  final medicineUnitF = FocusNode();
  final drinkingRulesF = FocusNode();

  final medicineName = ''.obs;
  final medicineUnit = ''.obs;
  final drinkingRules = ''.obs;
  final amountMedicine = 0.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _initTextC();
  }

  void _initTextC() {
    medicineNameC.addListener(setMedicineName);
    drinkingRulesC.addListener(setDrinkingRules);
  }

  void setMedicineName() => medicineName.value = medicineNameC.text;

  void incrementAmountMedicine() => amountMedicine.value++;

  void decrementAmountMedicine() => amountMedicine.value--;

  void setMedicineUnit(String? value) {
    medicineUnitC.text = value ?? '';
    medicineUnit.value = value ?? '';
    Get.back();
  }

  void setDrinkingRules() => drinkingRules.value = drinkingRulesC.text;

  void nextFocus(FocusNode node) => node.requestFocus();

  void confirm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    FocusScope.of(Get.context!).unfocus();

    await Future.delayed(3.seconds);
    isLoading.value = false;
  }
}
