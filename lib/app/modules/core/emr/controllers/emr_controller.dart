import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/data/models/item/item_model.dart';
import 'package:privata/app/data/models/rj/item_rj/item_rj_model.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../routes/app_pages.dart';
import 'search_action_controller.dart';

class EmrController extends GetxController {
  late final InitController _initC;

  final patientComplaintC = TextEditingController();
  final heightC = TextEditingController();
  final weightC = TextEditingController();
  final temperatureC = TextEditingController();
  final pulseC = TextEditingController();
  final breathC = TextEditingController();
  final systoleC = TextEditingController();
  final bloodSugarC = TextEditingController();
  final diastoleC = TextEditingController();

  final patientComplaintF = FocusNode();
  final heightF = FocusNode();
  final weightF = FocusNode();
  final temperatureF = FocusNode();
  final pulseF = FocusNode();
  final breathF = FocusNode();
  final systoleF = FocusNode();
  final bloodSugarF = FocusNode();
  final diastoleF = FocusNode();

  final patientComplaint = ''.obs;
  final height = ''.obs;
  final weight = ''.obs;
  final temperature = ''.obs;
  final pulse = ''.obs;
  final breath = ''.obs;
  final systole = ''.obs;
  final bloodSugar = ''.obs;
  final diastole = ''.obs;

  final listAction = <ItemModel>[].obs;
  final listDrugs = <ItemModel>[].obs;

  final itemRJ = Rxn<ItemRJModel>();

  final actionChip = [
    'Diagnosa',
    'Tindakan',
    'Obat',
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

    _initTextController();
    _prepareView();
  }

  void _initTextController() {
    patientComplaintC.addListener(setPatientComplaint);
    heightC.addListener(setHeight);
    weightC.addListener(setWeight);
    temperatureC.addListener(setTemperature);
    pulseC.addListener(setPulse);
    breathC.addListener(setBreath);
    systoleC.addListener(setSystole);
    bloodSugarC.addListener(setBloodSugar);
    diastoleC.addListener(setDiastole);
  }

  void _prepareView() {
    final args = Get.arguments;

    // set data
    if (args is ItemRJModel) {
      itemRJ.value = args;
      patientComplaint.value = args.complaint ?? '';
    }
  }

  void setPatientComplaint() => patientComplaint.value = patientComplaintC.text;

  void setHeight() => height.value = heightC.text;

  void setWeight() => weight.value = weightC.text;

  void setTemperature() => temperature.value = temperatureC.text;

  void setPulse() => pulse.value = pulseC.text;

  void setBreath() => breath.value = breathC.text;

  void setSystole() => systole.value = systoleC.text;

  void setBloodSugar() => bloodSugar.value = bloodSugarC.text;

  void setDiastole() => diastole.value = diastoleC.text;

  void moveToTimelineEMR() => Get.toNamed(Routes.TIMELINE_EMR);

  void showActionDialog({required SearchType type}) async {
    final data = await Get.toNamed(
      Routes.SEARCH_ACTION_DIALOG,
      arguments: type,
    );

    if (data != null) {
      if (type == SearchType.action) {
        listAction.addAll(data);
      }

      if (type == SearchType.drugs) {
        listDrugs.addAll(data);
      }
    }
  }
}
