import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

class PrinterSettingsController extends GetxController {
  late final InitController _initC;

  final bluetoothDevices = RxSet<ScanResult>();

  final isBluetoothOn = false.obs;
  final isScanning = false.obs;

  final namePrinter = '-'.obs;
  final isChecked = false.obs;

  late final StreamSubscription<BluetoothAdapterState> _subsribeState;
  StreamSubscription<List<ScanResult>>? subscribeScanResult;
  StreamSubscription<bool>? subscribeIsScanning;

  List<BluetoothDevice>? systemDevices;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _initBluetooth();
  }

  Future<void> _initBluetooth() async {
    try {
      if (await FlutterBluePlus.isSupported == false) {
        return;
      }

      _subsribeState = FlutterBluePlus.adapterState.listen((state) async {
        _initC.logger.d('debug: state = $state');

        switch (state) {
          case BluetoothAdapterState.on:
            isBluetoothOn.value = true;
          // usually start scanning, connecting, etc

          // _initC.logger.d(
          //     'debug: subscribeScanResult is null ? = ${subscribeScanResult == null}');

          case BluetoothAdapterState.off:
            isBluetoothOn.value = false;
            // turn on bluetooth ourself if we can
            // for iOS, the user controls bluetooth enable/disable
            if (Platform.isAndroid) {
              await FlutterBluePlus.turnOn();
            }
          default:
          // show an error to the user, etc
        }
      });
    } catch (e) {
      _initC.logger.e('error : initBluetooth = $e');
    }

    // check result scanning
    subscribeScanResult = FlutterBluePlus.onScanResults.listen(
      (results) {
        if (results.isNotEmpty) {
          final r = results.last; // the most recently found device

          if (r.advertisementData.advName.isNotEmpty) {
            bluetoothDevices.add(results.last);

            _initC.logger.d(
              'debug: scan = ${r.device.remoteId}: "${r.advertisementData.advName}" found! isConnected = ${r.device.isConnected}',
            );
          }
        }
      },
      onError: (e) => _initC.logger.e('error: subscribeScanResult = $e'),
    );

    // check is bluetooth scanning
    subscribeIsScanning = FlutterBluePlus.isScanning.listen(
      (state) {
        isScanning.value = state;
        _initC.logger.d('debug: isScanning = $state');
      },
    );
  }

  Future<void> startScan() async {
    bluetoothDevices.clear();

    if (!FlutterBluePlus.isScanningNow) {
      try {
        systemDevices = await FlutterBluePlus.systemDevices;
      } catch (e) {
        _initC.logger.e('error: system devices error = $e');
      }

      try {
        await FlutterBluePlus.startScan(
          timeout: const Duration(seconds: 30),
          androidUsesFineLocation: true,
          androidScanMode: AndroidScanMode.balanced,
        );
      } catch (e) {
        _initC.logger.e('error: start scan = $e');
      }
    }
  }

  void closeScanning() {
    _initC.logger.d('debug: closeScanning dijalankan');
    if (subscribeScanResult != null) {
      FlutterBluePlus.cancelWhenScanComplete(subscribeScanResult!);
    }
  }

  void onChangedChecked(bool? value) => isChecked.toggle();

  Future<void> connecting(ScanResult result) async {
    try {
      await result.device.connect();
    } on FlutterBluePlusException catch (e) {
      _initC.logger.e('error: connecting device = $e');
    }
  }

  Future<void> disconnect(ScanResult result) async {
    try {
      await result.device.disconnect();
    } catch (e) {
      _initC.logger.e('error: disconnect device = $e');
    }
  }

  void onTapPrinter(ScanResult? result) {
    namePrinter.value = result?.advertisementData.advName ?? '-';
    Get.back();
  }

  @override
  void onClose() {
    _subsribeState.cancel();
    subscribeScanResult?.cancel();
    subscribeIsScanning?.cancel();
    super.onClose();
  }
}
