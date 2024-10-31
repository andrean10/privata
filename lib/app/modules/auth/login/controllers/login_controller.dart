import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/data/models/login/login_model.dart';
import 'package:privata/app/data/models/login/response/response_login_model.dart';
import 'package:privata/app/helpers/helper.dart';

import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/modules/widgets/buttons/buttons.dart';
import 'package:privata/app/modules/widgets/snackbar/snackbar.dart';

import '../../../../../utils/constants_keys.dart';
import '../../../../../utils/constants_strings.dart';
import '../../../../data/models/location/position/position_model.dart';
import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  late final InitController _initC;

  Position? position;

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

  String? deviceName;

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
    _fetchLocation();
    _fetchDeviceInfo();
  }

  Future<void> _fetchLocation() async {
    final record = await _initC.determinePosition();

    if (record.$2 != STATEPERMISSION.active) {
      String? content;
      String? label;
      Function()? onPressed;

      switch (record.$2) {
        case STATEPERMISSION.notActive:
          content = 'Layanan lokasi tidak aktif';
          label = 'Aktifkan';
          onPressed = () async {
            final state = await Geolocator.openLocationSettings();
            if (state) {
              await _fetchLocation();
            }
            print('state openLocationSettings = $state');
          };
          break;
        case STATEPERMISSION.denied:
          content = 'Perizinan lokasi di tolak';
          label = 'Izinkan';
          onPressed = () async {
            await Geolocator.requestPermission();
          };
          break;
        case STATEPERMISSION.deniedForever:
          content = 'Izin lokasi ditolak secara permanen';
          label = 'Buka Pengaturan';
          onPressed = () async {
            final state = await Geolocator.openAppSettings();
            if (state) {
              await _fetchLocation();
            }
            print('state openAppSettings = $state');
          };
          break;
        default:
      }

      Snackbar.failed(
        context: Get.context!,
        content: content,
        action: (label != null && onPressed != null)
            ? SnackBarAction(
                label: label,
                onPressed: onPressed,
              )
            : null,
        duration: 5.minutes,
      );
    } else {
      position = record.$1;
    }
  }

  Future<void> _fetchDeviceInfo() async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      // final deviceInfo = await deviceInfoPlugin.deviceInfo;
      // final allInfo = deviceInfo.data;

      if (GetPlatform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        deviceName = androidInfo.device;
        // print('Model: ${androidInfo.model}');
      }

      if (GetPlatform.isIOS) {
        final iosInfo = await deviceInfoPlugin.iosInfo;
        deviceName = iosInfo.model;
        // print('Model: ${iosInfo.model}');
      }

      if (GetPlatform.isMacOS) {
        final macInfo = await deviceInfoPlugin.macOsInfo;
        deviceName = macInfo.model;
        // print('Model: ${macInfo.model}');
      }
    } catch (e) {
      _initC.logger.e('error: $e');
      Snackbar.failed(
        context: Get.context!,
        content: 'Gagal mengambil info device',
      );
    }
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

      var login = LoginModel(
        username: email.value,
        password: password.value,
        isMobile: false,
        deviceName: deviceName,
      );

      if (position != null) {
        login = login.copyWith.call(
          location: PositionModel(
            latitude: '${position!.latitude}',
            longitude: '${position!.longitude}',
          ),
        );
      }

      final res = await _initC.authCn.login(login.toJson());

      if (res.isOk) {
        final body = res.body;

        if (body != null) {
          final resLogin = ResponseLoginModel.fromJson(body);
          final isPhoneVerified = resLogin.user?.isPhoneVerified ?? false;
          final isPref = resLogin.user?.links?.first.assistPref != null;
          await _saveLoginToPreferences(resLogin);

          // Helper.printPrettyJson(resLogin.toJson());

          _moveToDashboard();

          // if (!isPhoneVerified) {
          //   _moveToVerifyPhone();
          // } else if (!isPref) {
          //   _moveToPref();
          // } else {
          //   _moveToDashboard();
          // }
        } else {
          errMsg.value = ConstantsStrings.errLogin;
        }
      } else {
        if (!res.status.isUnauthorized) {
          errMsg.value = ConstantsStrings.errLogin;
        } else {
          _initC.handleError(status: res.status, isFromLogin: true);
        }
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: checkAuth $e');
      errMsg.value = ConstantsStrings.errFailedLogin;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _saveLoginToPreferences(ResponseLoginModel res) async {
    //todo disini untuk ganti klinik nanti ya
    _initC.localStorage
      ..write(ConstantsKeys.authToken, res.id)
      ..write(ConstantsKeys.createdId, res.user?.id)
      ..write(ConstantsKeys.createdName, res.user?.nama)
      ..write(ConstantsKeys.email, res.user?.email)
      ..write(ConstantsKeys.configId, res.user?.links?.firstOrNull?.configId)
      ..write(
        ConstantsKeys.hospitalId,
        res.user?.links?.firstOrNull?.hospitalId,
      )
      ..write(ConstantsKeys.linkId, res.user?.links?.firstOrNull?.id)
      ..write(ConstantsKeys.phone, res.user?.hp)
      ..write(ConstantsKeys.isVerifiedPhone, res.user?.isPhoneVerified)
      ..write(
        ConstantsKeys.isPref,
        res.user?.links?.firstOrNull?.assistPref != null,
      );
  }

  void nextFocus(FocusNode node) => node.requestFocus();

  void moveToRegister() => Get.toNamed(Routes.REGISTER);

  void moveToForgotPassword() => Get.toNamed(Routes.FORGOT_PASSWORD);

  void _moveToDashboard() => Get.offAllNamed(Routes.MAIN);

  void _moveToVerifyPhone() => Get.offAllNamed(Routes.VERIFY_OTP);

  void _moveToPref() => Get.offAllNamed(Routes.PREFERENCES);

  void clearError() => errMsg.value = null;
}
