import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/modules/widgets/snackbar/snackbar.dart';
import 'package:privata/app/routes/app_pages.dart';
import 'package:privata/services/auth/auth_connect.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../../helpers/text_helper.dart';
import '../../../timer/controllers/timer_controller.dart';

class VerifyOtpController extends GetxController {
  late final InitController _initC;
  late final TimerController timerC;
  late final AuthConnect _authCn;

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

  var phone = '';
  final isLoading = false.obs;
  final isLoadingRetry = false.obs;
  final isButonEnabled = false.obs;
  String? _verifId;
  int? _resToken;
  // UserCredential? _userCredential;

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

    _authCn = AuthConnect();
    phone = _initC.localStorage.read(ConstantsKeys.phone);
    // phone = '081234567891';

    _initTextC();
    await _getOTP(isRetryOTP: false);
  }

  void _initTextC() {
    for (var i = 0; i < listOtpC.length; i++) {
      listOtpC[i].addListener(_setOTP);
    }
  }

  void _setOTP() {
    final allStringNotEmpty = listOtpC.every((otpC) => otpC.text.isNotEmpty);
    isButonEnabled.value = allStringNotEmpty;
    _clearError();
  }

  Future<void> _getOTP({required bool isRetryOTP}) async {
    if (isRetryOTP) {
      isLoadingRetry.value = true;
    }

    final formatedNumber = TextHelper.formatNumberPhone(phone);

    // await _initC.auth.verifyPhoneNumber(
    //   // ignore: invalid_use_of_visible_for_testing_member
    //   autoRetrievedSmsCodeForTesting: '123456',
    //   phoneNumber: formatedNumber,
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     // _initC.logger.d('debug: verificationCompleted');
    //     // _initC.logger.d('debug: credential = ${credential.toString()}');
    //     final splitOTP = credential.smsCode?.split('');
    //     for (var i = 0; i < listOtpC.length; i++) {
    //       listOtpC[i].text = splitOTP?[i] ?? '';
    //     }

    //     _userCredential = await _initC.auth.signInWithCredential(credential);

    //     _initC.logger.d('debug: splitOTP = $splitOTP');
    //   },
    //   codeSent: (String verificationId, int? resendToken) {
    //     _verifId = verificationId;
    //     _resToken = resendToken;
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     var message = e.message;

    //     if (e.code == 'too-many-requests') {
    //       message =
    //           'Maaf kamu terlalu banyak request OTP, silahkan coba lagi nanti';
    //     }

    //     Snackbar.failed(
    //       context: Get.context!,
    //       content: '$message',
    //     );
    //     // errMsg.value = ConstantsStrings.verifyOTPFailed;
    //     _initC.logger.e('Error: verificationFailed = ${e.toString()}');
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {
    //     _initC.logger.d('debug: codeAutoRetrievalTimeout');
    //     _initC.logger.d('debug: verifId = $verificationId');
    //     _verifId = verificationId;
    //   },
    //   timeout: const Duration(minutes: 1),
    //   forceResendingToken: _resToken,
    // );

    if (isRetryOTP) {
      isLoadingRetry.value = false;
    }
  }

  void confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();

    _validateOTP();
  }

  Future<void> _validateOTP() async {
    // isLoading.value = true;
    // _clearError();

    // // if validate automatically in mobile
    // if (_userCredential != null) {
    //   // await _sendVerifySMSToken(_userCredential!);
    //   await _saveVerifyOTPPreferences();
    //   Get.offAllNamed(Routes.PREFERENCES);
    // } else if (_verifId != null) {
    //   final otp = listOtpC.map((e) => e.text).join();

    //   // final credential = PhoneAuthProvider.credential(
    //   //   verificationId: _verifId!,
    //   //   smsCode: otp,
    //   // );

    //   await _initC.auth.signInWithCredential(credential);
    //   await _saveVerifyOTPPreferences();

    //   Get.offAllNamed(Routes.PREFERENCES);

    //   // final userCredential = await _initC.auth.signInWithCredential(credential);
    //   // await _sendVerifySMSToken(userCredential);
    // } else {
    //   Snackbar.failed(
    //     context: Get.context!,
    //     content:
    //         'Maaf sepertinya ada kesalahan sistem saat memvalidasi OTP anda, coba lagi atau kirim ulang SMS',
    //   );
    // }

    // if (otp == '123456') {
    //   // set verifiedphone
    //   _initC.localStorage.write(ConstantsKeys.isVerifiedPhone, true);
    //   _moveToPreferences();
    // } else {
    //   errMsg.value = 'OTP anda tidak sesuai';
    // }

    isLoading.value = false;
  }

  // Future<void> _sendVerifySMSToken(UserCredential userCredential) async {
  //   try {
  //     final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);
  //     final idTokenResult = await userCredential.user?.getIdTokenResult(true);

  //     if (idTokenResult != null &&
  //         idTokenResult.token != null &&
  //         token != null) {
  //       final res = await _authCn.verifyOTP(
  //         token: token,
  //         tokenUser: idTokenResult.token!,
  //       );

  //       _initC.logger.d('debug: isOK = ${res.isOk}');
  //       _initC.logger.d('debug: res body = ${res.body}');

  //       if (res.isOk) {
  //         await _initC.localStorage.write(ConstantsKeys.isVerifiedPhone, true);
  //         _moveToPreferences();
  //       }
  //     }
  //   } catch (e) {
  //     _initC.logger.e('Error: validateOTP = $e');
  //   }
  // }

  void retryOTP() {
    timerC.startTimer();
    _getOTP(isRetryOTP: true);
  }

  void previousFocus(FocusNode node) => node.previousFocus();

  void nextFocus(FocusNode node) => node.nextFocus();

  void clearFocus(BuildContext context) => FocusScope.of(context).unfocus();

  void _clearError() => errMsg.value = null;

  void _moveToPreferences() => Get.offAllNamed(Routes.PREFERENCES);

  Future<void> _saveVerifyOTPPreferences() async =>
      await _initC.localStorage.write(ConstantsKeys.isVerifiedPhone, true);
}
