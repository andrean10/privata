import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_thermal_printer/flutter_thermal_printer.dart';
import 'package:flutter_thermal_printer/utils/printer.dart';
import 'package:get/get.dart';
import 'package:privata/app/helpers/format_date_time.dart';
import 'package:privata/app/helpers/helper.dart';
import 'package:image/image.dart';

import '../../../../../../utils/constants_assets.dart';
import '../../../../../../utils/constants_keys.dart';
import '../../../../../data/models/cashier/cashier_model.dart';
import '../../../../../helpers/text_helper.dart';
import '../../../../init/controllers/init_controller.dart';

class PaymentReceiptController extends GetxController {
  late final InitController _initC;

  final flutterThermalPrinterPlugin = FlutterThermalPrinter.instance;

  late final CashierModel? data;
  Printer? dataPrinter;

  final bleDevices = <Printer>[].obs;
  final selectedPrinter = Rxn<Printer>();

  StreamSubscription<List<Printer>>? _devicesStreamSubscription;

  final isLoading = false.obs;
  final isLoadingPrint = false.obs;

  InitController get initC => _initC;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _initArgs();
    _initPreferences();
  }

  void _initPreferences() {
    final initPrinter = _initC.localStorage.read<String>(ConstantsKeys.printer);

    if (initPrinter != null) {
      dataPrinter = Printer.fromJson(jsonDecode(initPrinter));
    }
  }

  void _initArgs() {
    data = Get.arguments as CashierModel?;
  }

  //  Start scanning for BLE devices
  void startScan() async {
    try {
      flutterThermalPrinterPlugin.startScan();
      _devicesStreamSubscription =
          flutterThermalPrinterPlugin.devicesStream.listen((event) {
        final mapPrinter = event
            .map(
              (e) => Printer.fromJson(e.toJson()),
            )
            .toList();

        bleDevices.addAll(mapPrinter);
        bleDevices.removeWhere(
          (element) => element.name == null || element.name!.isEmpty,
        );
      });
    } catch (e) {
      _initC.logger.e('Failed to start scanning for devices $e');
    }
  }

  // Stop scanning for BLE devices
  void stopScan() async {
    try {
      bleDevices.clear();
      _devicesStreamSubscription?.cancel();
      await flutterThermalPrinterPlugin.stopScan();
    } catch (e) {
      _initC.logger.e('Failed to stop scanning for devices $e');
    }
  }

  Future<bool> connectedPrinter(Printer printer) async {
    isLoading.value = true;

    try {
      final isConnected = await flutterThermalPrinterPlugin.connect(printer);
      if (isConnected) {
        // saved to preferences printer
        await _initC.localStorage.write(
          ConstantsKeys.printer,
          jsonEncode(printer.toJson()),
        );

        selectedPrinter.value = printer;

        stopScan();
        return isConnected;
      }
    } catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isLoading.value = false;
    }

    return false;
  }

  Future<void> disconnectedPrinter(Printer printer) async {
    isLoading.value = true;

    try {
      await flutterThermalPrinterPlugin.disconnect(printer);
    } catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> printer() async {
    isLoadingPrint.value = true;

    try {
      List<int> bytes = [];

      final profile = await CapabilityProfile.load();
      final generator = Generator(PaperSize.mm58, profile);
      bytes += generator.reset();
      // bytes += generator.setGlobalFont(PosFontType.fontB);

      final dataImg = await rootBundle.load(ConstantsAssets.icAssistBadge);
      final imgBytes = dataImg.buffer.asUint8List();
      // final image = decodeImage(imgBytes);
      final cmd = Command()
        ..decodeImage(imgBytes)
        ..copyResize(width: 150);
      final image = await cmd.getImage();

      if (image != null) {
        bytes += generator.image(
          image,
          align: PosAlign.left,
        );
        bytes += generator.text(
          "Klinik Assist.id",
          styles: const PosStyles(
            bold: true,
            align: PosAlign.right,
            // width: PosTextSize.size2,
            // height: PosTextSize.size2,
          ),
        );
      }

      // bytes += generator.text(
      //   "Klinik Assist.id",
      //   styles: const PosStyles(
      //     bold: true,
      //     align: PosAlign.center,
      //     // width: PosTextSize.size2,
      //     // height: PosTextSize.size2,
      //   ),
      // );

      bytes += generator.text(
        "Jl. Palaraya, No. 95",
        styles: const PosStyles(align: PosAlign.center),
      );

      bytes += generator.emptyLines(1);

      bytes += generator.text('Pasien : ${data!.patients?.nama ?? '-'}');

      if (data!.patients != null && data!.patients?.address != null) {
        final patients = data!.patients!;

        if (patients.address != null) {
          bytes += generator.text('Alamat : ${patients.address?.jalan ?? '-'}');
        } else {
          bytes += generator.text('Alamat : -');
        }
      } else {
        bytes += generator.text('Alamat : -');
      }

      // bytes += generator.text('Alamat : Jl. Merpati Sakti, Lr. Merpati Putih');
      bytes += generator.text('Metode Pembayaran : Tunai');

      // bytes += generator.emptyLines(1);
      bytes += generator.hr();

      bytes += generator.row(
        [
          PosColumn(
            text: FormatDateTime.dateToString(
              newPattern: 'dd MMMM yyyy',
              value: data!.createdAt,
            ),
            width: 7,
            styles: const PosStyles(align: PosAlign.center),
          ),
          PosColumn(
            text: data!.code ?? '-',
            width: 5,
            styles: const PosStyles(align: PosAlign.center),
          ),
        ],
      );

      // bytes += generator.cut();

      // await flutterThermalPrinterPlugin.printData(
      //   selectedPrinter.value!,
      //   bytes,
      //   longData: true,
      // );

      // return;

      bytes += generator.hr();
      // bytes += generator.emptyLines(1);

      var price = 0;

      if (data!.items != null) {
        for (var i = 0; i < data!.items!.length; i++) {
          final item = data!.items![i];
          final totalPrice = (item.baseFee ?? 0) * (item.quantity ?? 0);

          final items = [
            // PosColumn(
            //   text: '${i + 1}',
            //   width: 2,
            //   // styles: const PosStyles(align: PosAlign.center),
            // ),
            PosColumn(
              text: item.name ?? '-',
              width: 6,
              // styles: const PosStyles(align: PosAlign.center),
            ),
            PosColumn(
              text: TextHelper.formatRupiah(
                amount: item.baseFee,
                isCompact: false,
              ),
              width: 2,
              // styles: const PosStyles(align: PosAlign.center),
            ),
            PosColumn(
              text: '${item.quantity ?? '-'}',
              width: 2,
              // styles: const PosStyles(align: PosAlign.center),
            ),
            PosColumn(
              text: TextHelper.formatRupiah(
                amount: totalPrice,
                isCompact: false,
              ),
              width: 2,
              // styles: const PosStyles(align: PosAlign.center),
            ),
          ];

          // price
          price += totalPrice;

          bytes += generator.row(
            items,
            multiLine: false,
          );
        }
      }

      bytes += generator.text(
        'Harga : ${TextHelper.formatRupiah(
          amount: price,
          isCompact: false,
        )}',
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      );
      bytes += generator.text(
        'Diskon : ${TextHelper.formatRupiah(
          amount: data!.discount,
          isCompact: false,
        )}',
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      );
      bytes += generator.text(
        'Total : ${TextHelper.formatRupiah(
          amount: price - (data!.discount ?? 0),
          isCompact: false,
        )}',
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      );

      bytes += generator.text(
        'Terimakasih',
        styles: const PosStyles(align: PosAlign.center),
      );
      bytes += generator.text(
        'Semoga Lekas Sembuh',
        styles: const PosStyles(align: PosAlign.center),
      );

      bytes += generator.cut();

      await flutterThermalPrinterPlugin.printData(
        selectedPrinter.value!,
        bytes,
        longData: true,
      );
    } catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isLoadingPrint.value = false;
    }
  }

  @override
  void onClose() {
    stopScan();
    super.onClose();
  }
}
