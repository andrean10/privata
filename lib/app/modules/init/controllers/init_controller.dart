import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
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
          _redirectLogout(context: Get.context!);
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
        if (Get.currentRoute != Routes.SPLASH) {
          Snackbar.close(Get.context!);
          Snackbar.success(
            context: Get.context!,
            content: 'Anda sedang online',
          );
        }
      } else if (result.contains(ConnectivityResult.wifi)) {
        isConnectedInternet.value = true;
        // Wi-fi is available.
        // Note for Android:
        // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
        if (Get.currentRoute != Routes.SPLASH) {
          Snackbar.close(Get.context!);
          Snackbar.success(
            context: Get.context!,
            content: 'Anda sedang online',
          );
        }
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
        if (Get.currentRoute != Routes.SPLASH) {
          Snackbar.close(Get.context!);
          Snackbar.failed(
            context: Get.context!,
            content: 'Anda sedang offline!',
            duration: 15.minutes,
          );
        }
      }
    });
  }

  bool isUserFirstUsingApp() =>
      _localStorage.read(ConstantsKeys.isFirstUsingApp);

  // Future<Position> determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Layanan lokasi tidak aktif');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error(
  //           'Perizinan lokasidi tolak Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Izin lokasi ditolak secara permanen, kami tidak dapat meminta izin.');
  //   }

  //   const locationSettings = LocationSettings(
  //     accuracy: LocationAccuracy.high,
  //     distanceFilter: 100,
  //   );

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition(
  //     locationSettings: locationSettings,
  //   );
  // }

  void _redirectLogout({required BuildContext context}) async {
    Snackbar.info(
      context: context,
      content: 'Sesi anda telah berakhir, silahkan login kembali',
      // Anda telah dikeluarkan dari aplikasi
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

  void handleError({
    required HttpStatus status,
    String? message,
    SnackBarAction? action,
  }) {
    logger.d('debug: status code error = ${status.code}');

    if (status.isUnauthorized) {
      isRedirectLogout.value = true;
    } else {
      var resMessage = 'Ada kesalahan sistem';

      if (status.connectionError) {
        resMessage =
            'Koneksi internet tidak tersedia. Silakan periksa jaringan Anda atau coba lagi setelah beberapa saat';
      }

      if (status.isForbidden) {
        resMessage = 'Akses anda ditolak, silahkan coba lagi';
      }

      if (status.isNotFound) {
        resMessage = 'Akses anda tidak ditemukan, silahkan coba lagi';
      }

      if (status.isServerError) {
        resMessage = "Terjadi kesalahan di server. Silakan coba lagi nanti.";
      }

      if (status.code == HttpStatus.serviceUnavailable) {
        resMessage =
            "Layanan saat ini tidak tersedia. Silakan coba lagi setelah beberapa saat.";
      }

      if (status.code == HttpStatus.requestTimeout) {
        resMessage = "Waktu permintaan habis. Silakan coba lagi.";
      }

      if (status.code == HttpStatus.tooManyRequests) {
        resMessage =
            "Terlalu banyak permintaan. Silakan coba lagi setelah beberapa saat.";
      }

      if (status.code == HttpStatus.badRequest) {
        resMessage =
            "Permintaan tidak valid. Silakan periksa data yang Anda kirim.";
      }

      if (status.code == HttpStatus.preconditionFailed) {
        resMessage = 'Data yang anda masukkan tidak sesuai format yang diminta';
      }

      Snackbar.close(Get.context!);
      Snackbar.failed(
        context: Get.context!,
        content: message ?? resMessage,
        action: action,
      );
    }
  }

  @override
  void onClose() {
    _subscriptionConnectivity.cancel();
    super.onClose();
  }
}
