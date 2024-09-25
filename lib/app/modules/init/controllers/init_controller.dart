import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:privata/app/modules/widgets/snackbar/snackbar.dart';
import 'package:privata/services/auth/auth_connect.dart';

import '../../../../utils/constants_keys.dart';
import '../../../routes/app_pages.dart';

class InitController extends GetxController {
  late final GetStorage _localStorage;
  late final AuthConnect authCn;
  // late final FlutterSecureStorage sfStorage;
  late final FirebaseAuth _auth;
  late final StreamSubscription<List<ConnectivityResult>>
      _subscriptionConnectivity;

  GetStorage get localStorage => _localStorage;

  FirebaseAuth get auth => _auth;

  final isConnectedInternet = true.obs;
  final isRedirectLogout = false.obs;

  final logger = Logger(
    printer: PrettyPrinter(
      printTime: true,
    ),
  );

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    _localStorage = GetStorage();
    _localStorage.writeIfNull(ConstantsKeys.isFirstUsingApp, true);
    authCn = AuthConnect();
    _auth = FirebaseAuth.instance;

    _listenRedirectLogout();
    _listenConnectivity();
  }

  void _listenRedirectLogout() {
    debounce(
      isRedirectLogout,
      time: const Duration(seconds: 2),
      (value) {
        if (value) {
          redirectLogout(context: Get.context!);
        }
      },
    );
  }

  void _listenConnectivity() {
    _subscriptionConnectivity =
        Connectivity().onConnectivityChanged.listen((result) {
      // Received changes in available connectivity types!
      if (result.contains(ConnectivityResult.mobile)) {
        isConnectedInternet.value = true;
        // Mobile network available.
        Snackbar.close(Get.context!);
      } else if (result.contains(ConnectivityResult.wifi)) {
        isConnectedInternet.value = true;
        // Wi-fi is available.
        // Note for Android:
        // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
        Snackbar.close(Get.context!);
        Snackbar.success(
          context: Get.context!,
          content: 'Anda sedang online',
        );
      } else if (result.contains(ConnectivityResult.ethernet)) {
        isConnectedInternet.value = true;
        // Ethernet connection available.
      } else if (result.contains(ConnectivityResult.vpn)) {
        // Vpn connection active.
        // Note for iOS and macOS:
        // There is no separate network interface type for [vpn].
        // It returns [other] on any device (also simulator)
      } else if (result.contains(ConnectivityResult.bluetooth)) {
        // Bluetooth connection available.
      } else if (result.contains(ConnectivityResult.other)) {
        // Connected to a network which is not in the above mentioned networks.
      } else if (result.contains(ConnectivityResult.none)) {
        isConnectedInternet.value = false;
        // No available network types
        Snackbar.failed(
          context: Get.context!,
          content: 'Anda sedang offline!',
          duration: 3.minutes,
        );
      }
    });
  }

  bool isUserFirstUsingApp() =>
      _localStorage.read(ConstantsKeys.isFirstUsingApp);

  void redirectLogout({required BuildContext context}) async {
    Snackbar.info(
      context: context,
      content: 'Anda telah dikeluarkan dari aplikasi, silahkan login kembali',
    );

    try {
      // clear cache login
      await _localStorage.erase();
      _localStorage.write(
        ConstantsKeys.isFirstUsingApp,
        false,
      );

      // reset redirect logout
      isRedirectLogout.value = false;

      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      logger.e('Error: $e');
    }
  }

  @override
  void onClose() {
    _subscriptionConnectivity.cancel();
    super.onClose();
  }
}
