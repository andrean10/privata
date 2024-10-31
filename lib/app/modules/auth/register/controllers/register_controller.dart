import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/data/models/links/links_model.dart';
import 'package:privata/app/data/models/register/register_model.dart';

import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/modules/widgets/snackbar/snackbar.dart';

import '../../../../../utils/constants_strings.dart';
import '../../../../helpers/helper.dart';
import '../../../../routes/app_pages.dart';

enum Gender { male, female }

enum NewRegistrationStatus { available, exist }

class RegisterController extends GetxController {
  late final InitController _initC;

  final formKey = GlobalKey<FormState>();
  final fullNameC = TextEditingController();
  final phoneC = TextEditingController();
  final emailC = TextEditingController();
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  final fullNameF = FocusNode();
  final phoneF = FocusNode();
  final emailF = FocusNode();
  final usernameF = FocusNode();
  final passwordF = FocusNode();

  final fullName = ''.obs;
  final gender = 0.obs;
  final phone = ''.obs;
  final email = ''.obs;
  final username = ''.obs;
  final password = ''.obs;

  final isHidePassword = true.obs;
  final isLoading = false.obs;

  final errEmail = RxnString();
  final errUsername = RxnString();
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
    fullNameC.addListener(_setFullName);
    phoneC.addListener(_setPhone);
    emailC.addListener(_setEmail);
    usernameC.addListener(_setUsername);
    passwordC.addListener(_setPassword);
  }

  void _setFullName() => fullName.value = fullNameC.text;

  void _setPhone() => phone.value = phoneC.text;

  void _setEmail() {
    email.value = emailC.text;
    errEmail.value = null;
  }

  void _setUsername() {
    username.value = usernameC.text;
    errUsername.value = null;
  }

  void _setPassword() => password.value = passwordC.text;

  void setHidePassword() => isHidePassword.toggle();

  void confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();

    _checkUser();
  }

  Future<void> _checkUser() async {
    clearError();
    isLoading.value = true;

    try {
      // check Email
      final resCheckEmail = await _initC.authCn.checkEmailOrUsername({
        'key': 'email',
        'value': email.value,
      });

      // check Username
      final resCheckUsername = await _initC.authCn.checkEmailOrUsername({
        'key': 'username',
        'value': username.value,
      });

      final links = [
        const LinksModel(
          role: 'Owner',
          type: 'rs',
          active: true,
        )
      ];

      if (resCheckEmail.body['status'] == NewRegistrationStatus.exist.name) {
        errEmail.value = ConstantsStrings.errEmail;
      }

      if (resCheckUsername.body['status'] == NewRegistrationStatus.exist.name) {
        errUsername.value = ConstantsStrings.errUsername;
      }

      final body = {
        'dataLink': links,
        'nama': fullName.value.trim(),
        'gender': gender.value,
        'hp': phone.value.trim(),
        'email': email.value.trim(),
        'username': username.value.trim(),
        'password': password.value.trim(),
        'from': 'mobile',
      };

      Helper.printPrettyJson(body);
      
      final res = await _initC.authCn.register(body);
      final bodyRes = res.body;

      Helper.printPrettyJson(bodyRes);

      if (res.isOk) {
        moveToLogin();
        Snackbar.success(
          context: Get.context!,
          content: ConstantsStrings.successRegistrationAccount,
        );
      }
    } catch (e) {
      _initC.logger.e('Error: checkUser $e');
      errMsg.value = 'Ada kesalahan saat autentikasi coba lagi';
    } finally {
      isLoading.value = false;
    }
  }

  void moveToLogin() => Get.back();

  void moveToTerms() => Get.toNamed(Routes.TERMS);

  void nextFocus(FocusNode node) => node.nextFocus();

  void clearError() {
    errEmail.value = null;
    errUsername.value = null;
    errMsg.value = null;
  }

  void onChangedGender(String? value) {
    if (value != null) {
      gender.value = value == 'Perempuan' ? 2 : 1;
    }
  }
}
