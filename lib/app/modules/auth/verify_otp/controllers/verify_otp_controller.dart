import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/routes/app_pages.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../../helpers/helper.dart';
import '../../../timer/controllers/timer_controller.dart';

class VerifyOtpController extends GetxController {
  late final InitController _initC;
  late final TimerController timerC;

  InitController get initC => _initC;

  final formKey = GlobalKey<FormState>();
  final listOtpC = List.generate(
    6,
    (_) => TextEditingController(),
    growable: false,
  );
  final listOtpF = List.generate(
    6,
    (_) => FocusNode(),
    growable: false,
  );

  String? authToken;
  String? phone;

  final isLoading = false.obs;
  final isLoadingRetry = false.obs;
  final isButonEnabled = false.obs;

  final errMsg = RxnString();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    if (Get.isRegistered<TimerController>()) {
      timerC = Get.find<TimerController>();
    }

    authToken = _initC.localStorage.read<String>(ConstantsKeys.authToken);
    phone = _initC.localStorage.read<String>(ConstantsKeys.phone);

    _initTextC();
    _initFetch();
  }

  void _initTextC() {
    for (var i = 0; i < listOtpC.length; i++) {
      listOtpC[i].addListener(_setOTP);
    }
  }

  void _initFetch() {
    getOTP(isRetryOTP: false);
  }

  void _setOTP() {
    final allStringNotEmpty = listOtpC.every((otpC) => otpC.text.isNotEmpty);
    isButonEnabled.value = allStringNotEmpty;
    _clearError();
  }

  void getOTP({required bool isRetryOTP}) async {
    if (isRetryOTP) {
      isLoadingRetry.value = true;
    }

    if (authToken != null) {
      try {
        await _initC.authCn.reqOTP(authToken!);
      } on GetHttpException catch (e) {
        _initC.logger.e(e.message);
      } finally {
        if (isRetryOTP) {
          isLoadingRetry.value = false;
        }
      }
    }
  }

  void confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();
    _validateOTP();
  }

  void _validateOTP() async {
    isLoading.value = true;
    _clearError();

    final otp = listOtpC.map((e) => e.text).join();

    try {
      if (authToken != null) {
        // check OTP to api
        final res = await _initC.authCn.verifyOTP(
          authToken: authToken!,
          otp: otp,
        );

        Helper.printPrettyJson(res.body);

        if (res.isOk) {
          await _saveVerifyOTPPreferences();
          _moveToPreferences();
        }
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: ${e.message}');
    } finally {
      isLoading.value = false;
    }
  }

  void retryOTP() {
    timerC.startTimer();
    getOTP(isRetryOTP: true);
  }

  void previousFocus(FocusNode node) => node.previousFocus();

  void nextFocus(FocusNode node) => node.nextFocus();

  void clearFocus(BuildContext context) => FocusScope.of(context).unfocus();

  void _clearError() => errMsg.value = null;

  Future<void> _saveVerifyOTPPreferences() async =>
      await _initC.localStorage.write(
        ConstantsKeys.isVerifiedPhone,
        true,
      );

  void _moveToPreferences() => Get.offAllNamed(Routes.PREFERENCES);
}
