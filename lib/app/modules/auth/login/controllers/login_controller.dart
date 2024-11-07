import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/data/models/kconfigs/kconfigs_model.dart';
import 'package:privata/app/data/models/login/login_model.dart';
import 'package:privata/app/data/models/login/response/response_login_model.dart';

import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/modules/widgets/snackbar/snackbar.dart';

import '../../../../../shared/shared_enum.dart';
import '../../../../../utils/constants_keys.dart';
import '../../../../../utils/constants_strings.dart';
import '../../../../data/models/location/position/position_model.dart';
import '../../../../helpers/helper.dart';
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

    if (record.$2 == StatePermission.notActive) {
      String? content;
      String? label;
      Function()? onPressed;

      switch (record.$2) {
        case StatePermission.notActive:
          content = 'Layanan lokasi tidak aktif';
          label = 'Aktifkan';
          onPressed = () async {
            final state = await Geolocator.openLocationSettings();
            final isLocationEnabled =
                await Geolocator.isLocationServiceEnabled();

            if (state && isLocationEnabled) {
              await _fetchLocation();
            }
            print('state openLocationSettings = $state');
          };
          break;
        case StatePermission.denied:
          content = 'Perizinan lokasi di tolak';
          label = 'Izinkan';
          onPressed = () async {
            await Geolocator.requestPermission();
          };
          break;
        case StatePermission.deniedForever:
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

      Snackbar.close(Get.context!);
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

          final filter = {
            "where": {"hospitalId": resLogin.user?.links?.first.hospitalId}
          };

          final resKConfigs = await _initC.authCn.kConfigs(
            token: '${resLogin.id}',
            filter: jsonEncode(filter),
          );

          if (resKConfigs.isOk) {
            final body = resKConfigs.body as List<dynamic>;
            final kConfigs = KConfigsModel.fromJson(body.firstOrNull);

            Helper.printPrettyJson(kConfigs.toJson());

            await _saveLoginToPreferences(
              dataLogin: resLogin,
              dataKConfigs: kConfigs,
            );
            _moveToDashboard();
          }

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

  Future<void> _saveLoginToPreferences({
    required ResponseLoginModel dataLogin,
    required KConfigsModel dataKConfigs,
  }) async {
    //todo disini untuk ganti klinik nanti ya
    _initC.localStorage
      ..write(ConstantsKeys.authToken, dataLogin.id)
      ..write(ConstantsKeys.createdId, dataLogin.user?.id)
      ..write(ConstantsKeys.createdName, dataLogin.user?.nama)
      ..write(ConstantsKeys.email, dataLogin.user?.email)
      ..write(
          ConstantsKeys.configId, dataLogin.user?.links?.firstOrNull?.configId)
      ..write(
        ConstantsKeys.hospitalId,
        dataLogin.user?.links?.firstOrNull?.hospitalId,
      )
      ..write(ConstantsKeys.pharmacyId, dataKConfigs.pharmacyAccount)
      ..write(ConstantsKeys.linkId, dataLogin.user?.links?.firstOrNull?.id)
      ..write(ConstantsKeys.phone, dataLogin.user?.hp)
      ..write(ConstantsKeys.isVerifiedPhone, dataLogin.user?.isPhoneVerified)
      ..write(
        ConstantsKeys.isPref,
        dataLogin.user?.links?.firstOrNull?.assistPref != null,
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
