import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/data/models/login/login_model.dart';
import 'package:privata/app/data/models/login/response/response_login_model.dart';

import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../../utils/constants_keys.dart';
import '../../../../../utils/constants_strings.dart';
import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  late final InitController _initC;

  final formKey = GlobalKey<FormState>();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  final emailF = FocusNode();
  final passwordF = FocusNode();

  final email = ''.obs;
  final password = ''.obs;

  final isHidePassword = true.obs;
  final isLoading = false.obs;
  final errMsg = RxnString();

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
    debounce(email, (_) => clearError());
    debounce(password, (_) => clearError());

    emailC.addListener(_setEmail);
    passwordC.addListener(_setPassword);
  }

  void _setEmail() => email.value = emailC.text;

  void _setPassword() => password.value = passwordC.text;

  void setHidePassword() => isHidePassword.toggle();

  void confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    clearError();

    try {
      isLoading.value = true;

      final login = LoginModel(
        username: email.value,
        password: password.value,
      ).toJson();

      final res = await _initC.authCn.login(login);

      if (res.isOk) {
        final response = res.body;

        if (response != null) {
          final resLogin = ResponseLoginModel.fromJson(response);
          final isPhoneVerified = resLogin.user?.isPhoneVerified ?? false;

          await _saveLoginToPreferences(resLogin);

          if (!isPhoneVerified) {
            moveToDashboard();
          } else {
            moveToVerifyPhone();
          }
        } else {
          errMsg.value = ConstantsStrings.errLogin;
        }
      } else {
        errMsg.value = ConstantsStrings.errLogin;
      }
    } catch (e) {
      _initC.logger.e('Error: checkAuth $e');
      errMsg.value = ConstantsStrings.errFailedLogin;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _saveLoginToPreferences(ResponseLoginModel res) async {
    _initC.localStorage
      ..write(ConstantsKeys.authToken, res.id)
      ..write(ConstantsKeys.configId, res.user?.links?.first.configId)
      ..write(ConstantsKeys.hospitalId, res.user?.links?.first.hospitalId)
      ..write(ConstantsKeys.linkId, res.user?.links?.first.id)
      ..write(ConstantsKeys.phone, res.user?.hp)
      ..write(ConstantsKeys.isVerifiedPhone, res.user?.isPhoneVerified)
      ..write(
        ConstantsKeys.isPref,
        res.user?.links?.first.assistPref != null,
      );
  }

  void nextFocus(FocusNode node) => node.requestFocus();

  void moveToRegister() => Get.toNamed(Routes.REGISTER);

  void moveToForgotPassword() => Get.toNamed(Routes.FORGOT_PASSWORD);

  void moveToDashboard() => Get.offAllNamed(Routes.MAIN);

  void moveToVerifyPhone() => Get.toNamed(Routes.VERIFY_OTP);

  void clearError() {
    errMsg.value = null;
  }
}
