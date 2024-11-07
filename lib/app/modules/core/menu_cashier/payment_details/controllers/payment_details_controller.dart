import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/data/models/cashier/cashier_model.dart';
import 'package:privata/app/data/models/price_list/price_list_model.dart';
import 'package:privata/app/helpers/helper.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../../../../services/cashier/cashier_connect.dart';
import '../../../../../../shared/shared_enum.dart';
import '../../../../../helpers/text_helper.dart';
import '../../../../init/controllers/init_controller.dart';
import '../../../../widgets/dialog/dialogs.dart';
import '../../../../widgets/snackbar/snackbar.dart';

class PaymentDetailsController extends GetxController {
  late final InitController _initC;
  late final CashierConnect _cashierConn;

  late final CashierModel data;
  String? _userId;
  String? _name;
  String? _hospitalId;
  String? _pharmacyAccount;

  final namaPembayaranC = TextEditingController();
  final nomorPembayaranC = TextEditingController();
  final jumlahLainC = TextEditingController();

  final namaPembayaranF = FocusNode();
  final nomorPembayaranF = FocusNode();

  final namaPembayaran = RxnString();
  final nomorPembayaran = RxnString();

  final metodePembayaran = RxnString();
  final jumlahLain = RxnInt();

  final selectedChipMetodePembayaran = RxnString();
  final selectedChipAmountPaid = RxnString();
  final selectedMetodePembayaran = Rxn<MethodPayment>();
  final selectedMetodePembayaranLainnya = Rxn<MethodPayment>();

  final listAmountPaid = ['Uang Pas', 50000, 100000, 200000, 'Jumlah Lain'];

  final isLoading = false.obs;

  var _paidFee = 0;
  var _returnPayment = 0;
  // var _debtPayment = 0;
  var _percentageTotal = 0.0;

  var _type = '';
  var _paymentName = '';
  var _statePaid = '';

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _initServices();
    _initArgs();
    _initSharedPref();
    _initListener();
  }

  void _initServices() {
    _cashierConn = CashierConnect(_initC);
  }

  void _initArgs() {
    data = Get.arguments as CashierModel;
    // Helper.printPrettyJson(data.toJson());
  }

  void _initSharedPref() {
    _userId = _initC.localStorage.read<String>(ConstantsKeys.createdId);
    _name = _initC.localStorage.read<String>(ConstantsKeys.createdName);
    _hospitalId = _initC.localStorage.read<String>(ConstantsKeys.hospitalId);
    _pharmacyAccount =
        _initC.localStorage.read<String>(ConstantsKeys.pharmacyId);
  }

  void _initListener() {
    _listener(namaPembayaran, namaPembayaranC);
    _listener(nomorPembayaran, nomorPembayaranC);
    jumlahLainC.addListener(_jumlahLainListener);
  }

  void _listener(RxnString obs, TextEditingController controller) =>
      controller.addListener(() => obs.value = controller.text);

  void _jumlahLainListener() {
    final totalFee = data.fixTotalFee ?? 0;
    jumlahLain.value = TextHelper.parseRupiah(jumlahLainC.text);

    final percent = ((jumlahLain.value ?? 0) * 100 / totalFee).roundToDouble();
    _percentageTotal = (percent >= 100) ? 100 : percent;
    _paidFee = jumlahLain.value ?? 0;
  }

  int? searchNamaPembayaran(String query) {
    return null;
  }

  void selectedMethodPayment(String e) {
    selectedChipMetodePembayaran.value = e;
    nomorPembayaranC.clear();

    switch (e.toLowerCase()) {
      case 'tunai':
        selectedMetodePembayaran.value = MethodPayment.tunai;

        _paidFee = data.fixTotalFee ?? 0;
        _type = 'Langsung';
        _paymentName = e;
        _percentageTotal = 100;
        break;
      // case 'bpjs kesehatan':
      //   selectedMetodePembayaran.value = MethodPayment.bpjsKesehatan;
      //   _paymentName = e;
      //   break;
      // case 'bpjs ketenagakerjaan':
      //   selectedMetodePembayaran.value = MethodPayment.bpjsKetenagakerjaan;
      //   _paymentName = e;
      //   break;
      case 'lainnya':
        selectedMetodePembayaran.value = MethodPayment.other;
        break;
      default:
        break;
    }
  }

  void onChangedPaymentOtherMethod(String? value) {
    if (value != null) {
      metodePembayaran.value = value;

      switch (value.toLowerCase()) {
        case 'asuransi':
          selectedMetodePembayaranLainnya.value = MethodPayment.insurance;
          _paymentName =
              '${selectedMetodePembayaran.value}${namaPembayaranC.text}';
          break;
        case 'perusahaan':
          selectedMetodePembayaranLainnya.value = MethodPayment.company;
          _paymentName =
              '${selectedMetodePembayaran.value}${namaPembayaranC.text}';
          break;
        case 'kartu debit':
          selectedMetodePembayaranLainnya.value = MethodPayment.cardDebit;
          _paymentName = namaPembayaranC.text;
          break;
        case 'kartu kredit':
          selectedMetodePembayaranLainnya.value = MethodPayment.cardCredit;
          _paymentName = namaPembayaranC.text;
          break;
        default:
          break;
      }
    }
  }

  void selectedAmountPaid(dynamic e) {
    selectedChipAmountPaid.value = '$e';

    if (e is String) {
      // berarti chip tunai dan jumlah lain
      _percentageTotal = 100;
    } else {
      // berarti chip angka
      _paidFee = e as int;
    }
  }

  Future<void> pay() async {
    print('Paid Fee = $_paidFee');

    if (_paidFee < (data.fixTotalFee ?? 0)) {
      Dialogs.alert(
        context: Get.context!,
        title: 'Peringatan',
        content: const Text(
          'Jumlah bayar anda tidak boleh kurang dari harga total pembayaran, silahkan pilih ulang jumlah bayar atau sesuaikan kolom jumlah lain agar sama atau lebih dari total biaya',
        ),
        isSingleAction: true,
      );
    } else {
      isLoading.value = true;
      final now = DateTime.now().toUtc().toString();

      final bodyPayment = [
        {
          "accountTxId": '5d317993187836673377a4c8',
          "change": _returnPayment,
          "createdAt": now,
          "createdId": data.createdId,
          "createdName": data.createdName,
          "isNeedClaim": false,
          "isOutcome": data.isOutcome ?? false,
          "name": _paymentName,
          "paidName": data.patients?.nama,
          "percentageTotal": _percentageTotal,
          "showPrescriptionPrice": false,
          "status": "paid",
          "totalFee": _paidFee,
          "type": _type,
        }
      ];

      final body = {
        "accountTxId": _pharmacyAccount,
        "baseFee": data.fixTotalFee ?? 0,
        "code": data.code,
        "creditFee": 0,
        "discount": data.discount ?? 0,
        "embalaseFee": 0,
        "hospitalId": _hospitalId,
        "id": data.id,
        "isEditNumberInvoice": false,
        "isMergeTuslahEmbalase": false,
        "isMultiPayment": false,
        "isOnlyPOS": data.isOnlyPOS ?? false,
        "isOutcome": data.isOutcome ?? false,
        "isPendingStock": false,
        "paidFee": data.fixTotalFee ?? 0,
        "patientId": data.patientId,
        "payment": bodyPayment,
        "pointExchange": null,
        "prescriptionFee": 0,
        "removedItem": [],
        "removedPayment": [],
        "roundedValue": 0,
        "status": "paid off",
        "subTotalFee": data.fixTotalFee ?? 0,
        "totalFee": data.fixTotalFee ?? 0,
        "tuslahFee": 0,
        "txType": "ktx",
      };

      try {
        final listIds = data.items
            ?.map(
              (e) => <String, dynamic>{"type": e.type, "itemId": e.procedureId},
            )
            .toList();

        final query = <String, dynamic>{
          'hospitalId': _hospitalId,
          'listIds': jsonEncode(listIds),
        };

        final resPrice = await _cashierConn.getPriceList(query);

        if (resPrice.isOk) {
          final resBody = resPrice.body;

          if (resBody is Map<String, dynamic>) {
            final listDataPriceList = resBody['dataPriceList'] as List<dynamic>;
            final dataPriceList = listDataPriceList
                .map((e) => PriceListModel.fromJson(e))
                .toList();

            // filter data items yang ada di cashiermodel
            // lalu jika produk id sama dengan pricelist id
            // maka tambahkan data sellignprice di cashiermodel yang cocok dengan id yang sama
            final newBody = data.items?.map(
              (e) {
                final filterItemPrice = dataPriceList.firstWhereOrNull(
                    (element) => e.procedureId == element.id_);
                final sellingPrice = filterItemPrice?.sellingPrice;
                final newData = e.copyWith.call(
                  idToJson: e.id,
                  sellingPrice: sellingPrice,
                );
                return newData;
              },
            ).toList();

            body['item'] = newBody;
          }
        }

        final res = await _cashierConn.payForTransaction(body);

        print(res.body);

        if (res.isOk) {
          Snackbar.success(
            context: Get.context!,
            content: 'Berhasil melalukan pembayaran kasir',
          );

          Get.back(result: true);
        } else {
          _initC.logger.e('Error: ${res.statusCode}, ${res.statusText}');
          _initC.handleError(status: res.status);
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: $e');
        Snackbar.failed(
          context: Get.context!,
          content:
              'Terjadi kesalahan saat menyimpan data user, coba beberapa saat lagi',
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  int calculatePayment(bool isReturn) {
    final totalFee = data.totalFee ?? 0;
    final amountPay = switch (selectedChipAmountPaid.value?.toLowerCase()) {
      'uang pas' => totalFee,
      'jumlah lain' => jumlahLain.value ?? 0,
      _ => int.tryParse('${selectedChipAmountPaid.value}') ?? 0
    };

    if (amountPay >= totalFee) {
      _returnPayment = amountPay - totalFee;
      // _debtPayment = 0;
      _statePaid = 'paid off';
      // return _intChange;
    } else {
      _returnPayment = 0;
      // _debtPayment = totalFee - amountPay;
      // _statePaid = 'credit';
      // return 0;
    }

    // return isReturn ? _returnPayment : _debtPayment;
    return _returnPayment;
  }
}
