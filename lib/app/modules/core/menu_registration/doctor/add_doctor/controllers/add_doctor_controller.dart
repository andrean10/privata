import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:privata/app/data/db/practice_schedule/practice_schedule_model.dart';
import 'package:privata/utils/constants_strings.dart';

import '../../../../../../helpers/format_date_time.dart';
import '../../../../../init/controllers/init_controller.dart';

class AddDoctorController extends GetxController {
  late final InitController _initC;

  final doctorNameC = TextEditingController();
  final genderC = TextEditingController();
  final strC = TextEditingController();
  final noSTRC = TextEditingController();
  final expireSTRC = TextEditingController();
  final sipC = TextEditingController();
  final noSIPC = TextEditingController();
  final registDateSIPC = TextEditingController();
  final noPhoneC = TextEditingController();
  final emailC = TextEditingController();
  final degreeC = TextEditingController();
  final lastDegreeC = TextEditingController();
  final medicalJobC = TextEditingController();
  final specialistC = TextEditingController();
  final subSpecialistC = TextEditingController();
  final estimateConsultTimeC = TextEditingController();

  final practiceScheduleModel = List.generate(
    Day.values.length,
    (index) => PracticeScheduleModel(
      day: Day.values[index].name,
      startTextC: RxList([TextEditingController()]),
      endTextC: RxList([TextEditingController()]),
    ),
  );

  final formKey = GlobalKey<FormState>();

  final doctorNameF = FocusNode();
  final genderF = FocusNode();
  final strF = FocusNode();
  final noSTRF = FocusNode();
  final expireSTRF = FocusNode();
  final sipF = FocusNode();
  final noSIPF = FocusNode();
  final registDateSIPF = FocusNode();
  final noPhoneF = FocusNode();
  final emailF = FocusNode();
  final degreeF = FocusNode();
  final lastDegreeF = FocusNode();
  final medicalJobF = FocusNode();
  final specialistF = FocusNode();
  final subSpecialistF = FocusNode();
  final estimateConsultTimeF = FocusNode();

  final doctorName = ''.obs;
  final gender = ''.obs;
  final str = ''.obs;
  final noSTR = ''.obs;
  final expireSTR = ''.obs;
  final sip = ''.obs;
  final noSIP = ''.obs;
  final registDateSIP = ''.obs;
  final noPhone = ''.obs;
  final email = ''.obs;
  final degree = ''.obs;
  final lastDegree = ''.obs;
  final medicalJob = ''.obs;
  final specialist = ''.obs;
  final subSpecialist = ''.obs;
  final estimateConsultTime = ''.obs;

  final indexSpecialist = 0.obs;

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
  }

  void _initTextController() {
    doctorNameC.addListener(setDoctorName);
    // genderC.addListener(setGender);
    // strC.addListener(setStr);
    noSTRC.addListener(setNoSTR);
    // expireSTRC.addListener(setExpireSTR);
    // sipC.addListener(setSip);
    noSIPC.addListener(setNoSIP);
    // registDateSIPC.addListener(setRegistDateSIP);
    noPhoneC.addListener(setNoPhone);
    emailC.addListener(setEmail);
    degreeC.addListener(setDegree);
    lastDegreeC.addListener(setLastDegree);
    medicalJobC.addListener(setMedicalJob);
    specialistC.addListener(setSpecialist);
    subSpecialistC.addListener(setSubSpecialist);
    estimateConsultTimeC.addListener(setEstimateConsultTime);
  }

  void setDoctorName() => doctorName.value = doctorNameC.text;

  // void setGender() => gender.value = genderC.text;

  // void setStr() => str.value = strC.text;

  void setNoSTR() => noSTR.value = noSTRC.text;

  // void setExpireSTR() => expireSTR.value = expireSTRC.text;

  // void setSip() => sip.value = sipC.text;

  void setNoSIP() => noSIP.value = noSIPC.text;

  // void setRegistDateSIP() => registDateSIP.value = registDateSIPC.text;

  void setNoPhone() => noPhone.value = noPhoneC.text;

  void setEmail() => email.value = emailC.text;

  void setDegree() => degree.value = degreeC.text;

  void setLastDegree() => lastDegree.value = lastDegreeC.text;

  void setMedicalJob() => medicalJob.value = medicalJobC.text;

  void setSpecialist() => specialist.value = specialistC.text;

  void setSubSpecialist() => subSpecialist.value = subSpecialistC.text;

  void setEstimateConsultTime() =>
      estimateConsultTime.value = estimateConsultTimeC.text;

  void selectedGender(dynamic value) => gender.value = value;

  void selectedStr(dynamic value) => str.value = value;

  void selectedSip(dynamic value) => sip.value = value;

  void selectedDegree(dynamic value) => degree.value = value;

  void selectedMedicalJob(dynamic value) => medicalJob.value = value;

  void selectedSpecialist(dynamic value) {
    if (value != indexSpecialist.value) {
      indexSpecialist.value = value;
    }
  }

  void setExpiresDate(DateTime value) {
    expireSTRC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: value.toString(),
    );
  }

  void setRegistDate(DateTime value) {
    registDateSIPC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: value.toString(),
    );
  }

  List<String>? filterSubSpecialist(int index) {
    final data =
        ConstantsStrings.dataSubSpecialist.entries.firstWhere((element) {
      _initC.logger.d('debug: element.key = ${element.key}');
      return element.key == index;
    }).value;

    _initC.logger.d('debug: data filter sub specialist = $data');

    if (data.isNotEmpty) {
      return data;
    }

    return null;
  }

  void addItemDay(PracticeScheduleModel item) {
    item.startTextC.add(TextEditingController());
    item.endTextC.add(TextEditingController());
  }

  void removeItemDay(PracticeScheduleModel item, int index) {
    item.startTextC.removeAt(index);
    item.endTextC.removeAt(index);
  }

  Future<void> onTapTimePicker({
    required BuildContext context,
    required TextEditingController textC,
  }) async {
    try {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        // initialEntryMode: TimePickerEntryMode.dial,
      );

      if (time != null) {
        textC.text = time.format(context);
      }
    } catch (e) {
      _initC.logger.e('Error: onTapTimePicker = $e');
    }
  }
}
