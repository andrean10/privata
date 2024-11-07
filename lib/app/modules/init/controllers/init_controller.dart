import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:privata/app/modules/widgets/snackbar/snackbar.dart';
import 'package:privata/services/auth/auth_connect.dart';
import 'package:privata/services/init/init_connect.dart';

import '../../../../shared/shared_enum.dart';
import '../../../../utils/constants_keys.dart';
import '../../../data/models/kconfigs/kconfigs_model.dart';
import '../../../data/models/klinik/klinik_model.dart';
import '../../../helpers/helper.dart';
import '../../../routes/app_pages.dart';

class InitController extends GetxController {
  late final GetStorage _localStorage;

  late final AuthConnect authCn;
  late final InitConnect _initCn;

  late final StreamSubscription<List<ConnectivityResult>>
      _subscriptionConnectivity;
  // late final StreamSubscription<ServiceStatus> _subscriptionServiceStatus;

  GetStorage get localStorage => _localStorage;

  String? _hospitalId;

  KConfigsModel? kConfigs;
  KlinikModel? klinik;

  final isConnectedInternet = true.obs;
  final isRedirectLogout = false.obs;

  final logger = Logger(printer: PrettyPrinter(printTime: true));

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    _localStorage = GetStorage();
    _localStorage.writeIfNull(ConstantsKeys.isFirstUsingApp, true);
    _hospitalId = localStorage.read<String>(ConstantsKeys.hospitalId);

    authCn = AuthConnect();
    _initCn = InitConnect(_localStorage);

    _listenRedirectLogout();
    _listenConnectivity();
    // _listenServiceStatus();

    _initFetch();
  }

  //todo SOON
  void _initFetch() async {
    await _fetchKConfigs();
    await _fetchDataKlinik();
  }

  Future<void> _fetchKConfigs() async {
    try {
      final filter = {
        "where": {"hospitalId": _hospitalId}
      };

      final res = await _initCn.kConfigs(jsonEncode(filter));

      if (res.isOk) {
        final body = res.body as List<dynamic>;
        kConfigs = KConfigsModel.fromJson(body.firstOrNull);
      }
    } on GetHttpException catch (e) {
      logger.e('Error: $e');
    }
  }

  Future<void> _fetchDataKlinik() async {
    try {
      final filter = {
        "where": {"id": _hospitalId},
        "include": [
          {
            "relation": "Prakteks",
            "scope": {
              "include": ["Dokters"],
              "where": {
                "isDelete": {"neq": true}
              }
            }
          },
          "MetodePembayarans",
          "FasilitasRss"
        ]
      };

      final res = await _initCn.dataKlinik(jsonEncode(filter));

      if (res.isOk) {
        final body = res.body as List<dynamic>;
        klinik = KlinikModel.fromJson(body.firstOrNull);
      }
    } on GetHttpException catch (e) {
      logger.e('Error : $e');
    }
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
        isConnectedInternet.value = true;
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

  // void _listenServiceStatus() {
  //   _subscriptionServiceStatus = Geolocator.getServiceStatusStream().listen(
  //     (result) {
  //       print('result service status = $result');
  //     },
  //   );
  // }

  bool isUserFirstUsingApp() =>
      _localStorage.read<bool>(ConstantsKeys.isFirstUsingApp) ?? true;

  Future<(Position?, StatePermission)> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      // return Future.error('Layanan lokasi tidak aktif');
      return (null, StatePermission.notActive);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.

        // return Future.error('Perizinan lokasi di tolak');
        return (null, StatePermission.denied);
      }

      return (null, StatePermission.denied);
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // return Future.error(
      //     'Izin lokasi ditolak secara permanen, kami tidak dapat meminta izin.');
      return (null, StatePermission.deniedForever);
    }

    const locationSettings = LocationSettings(
      // accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return (
      await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      ),
      StatePermission.active,
    );
  }

  void _redirectLogout({required BuildContext context}) async {
    Snackbar.info(
      context: context,
      content: 'Sesi anda telah berakhir, silahkan login kembali',
      // Anda telah dikeluarkan dari aplikasi
    );

    try {
      // clear cache login
      await _localStorage.erase();
      await _localStorage.write(ConstantsKeys.isFirstUsingApp, false);

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
    bool isFromLogin = false,
  }) {
    logger.d('debug: status code error = ${status.code}');

    if (status.isUnauthorized) {
      if (!isFromLogin) {
        isRedirectLogout.value = true;
      } else {
        const resMessage =
            'Login gagal, silahkan cek username/email dan password anda';
        Snackbar.close(Get.context!);
        Snackbar.failed(
          context: Get.context!,
          content: message ?? resMessage,
          action: action,
        );
      }
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
    // _subscriptionServiceStatus.cancel();
    super.onClose();
  }
}
