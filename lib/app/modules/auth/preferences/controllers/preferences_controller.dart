import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../../services/onboarding/onboarding_connect.dart';
import '../../../../../utils/constants_keys.dart';
import '../../../../helpers/helper.dart';
import '../../../../routes/app_pages.dart';

class PreferencesController extends GetxController {
  late final InitController _initC;
  late final OnBoardingConnect _onboardingConn;

  InitController get initC => _initC;

  String? _linkId;

  // final longClinicOperatingC = TextEditingController();
  // final numberVisitorC = TextEditingController();

  // final longClinicOperatingF = FocusNode();
  // final numberVisitorF = FocusNode();

  final longClinicOperating = RxnString();
  final numberVisitor = RxnString();

  final isActiveRMD = false.obs;
  final isActiveStock = false.obs;

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

    _onboardingConn = OnBoardingConnect(_initC);
    _linkId = _initC.localStorage.read<String>(ConstantsKeys.linkId);

    // _initListener();
  }

  // void _initListener() {
  //   _listener(longClinicOperating, longClinicOperatingC);
  //   _listener(numberVisitor, numberVisitorC);
  // }

  // void _listener(RxnString obs, TextEditingController controller) =>
  //     controller.addListener(() => obs.value = controller.text);

  // void confirm() {
  //   final body = {
  //     "3": longClinicOperating.value,
  //     "5": isActiveRMD.value,
  //     "7": isActiveStock.value,
  //     "8": isActiveStock.value,
  //     "12": numberVisitor.value,
  //     "configAccountId": _configId
  //   };
  // }

  void confirm() async {
    isLoading.value = true;

    final body = <String, dynamic>{
      "3": longClinicOperating.value,
      "5": isActiveRMD.value,
      "7": isActiveStock.value,
      "8": isActiveStock.value,
      "12": numberVisitor.value,
      "configAccountId": _linkId
    };

    Helper.printPrettyJson(body);

    try {
      final res = await _onboardingConn.saveAssistPref(body);

      // Helper.printPrettyJson(res.body);

      print(res.body);

      if (res.isOk) {
        final body = res.body;

        print('body runtimeType = ${body.runtimeType}');

        if (body != null) {
          _moveToInfoFaskesInfo();
        }

        // if (body != null && body is Map<String, dynamic>) {
        //   final data = DiagnosesModel.fromJson(body);

        //   List<DiagnosesModel> newData = List.from(itemsDiagnoses.value);
        //   newData.add(data);
        //   itemsDiagnoses.value = newData;
        // }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void setActiveRMD(bool value) => isActiveRMD.value = value;

  void setActiveStock(bool value) => isActiveStock.value = value;

  void _moveToInfoFaskesInfo() => Get.toNamed(Routes.INFO_FASKES);
}
