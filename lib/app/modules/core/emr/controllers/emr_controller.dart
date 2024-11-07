import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/data/models/detail_rj/procedure/procedure_model.dart';
import 'package:privata/app/data/models/rj/item_rj/item_rj_model.dart';
import 'package:privata/app/helpers/helper.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/services/timeline/emr_connect.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../../../services/status/status_connect.dart';
import '../../../../data/models/detail_rj/detail_rj_model.dart';
import '../../../../data/models/detail_rj/diagnoses/diagnoses_model.dart';
import '../../../../data/models/detail_rj/diagnoses/item_diagnoses/item_diagnoses_model.dart';
import '../../../../data/models/detail_rj/diagnoses/item_name_diagnoses/item_name_diagnoses_model.dart';
import '../../../../data/models/detail_rj/procedure/item_procedure/item_procedure_model.dart';
import '../../../../data/models/drugs/drugs_model.dart';
import '../../../../helpers/text_helper.dart';
import '../../../../routes/app_pages.dart';
import '../../../widgets/dialog/dialogs.dart';
import '../../../widgets/snackbar/snackbar.dart';

class EmrController extends GetxController with StateMixin<DetailRJModel?> {
  late final InitController _initC;

  late final EMRConnect _emrConn;
  late final StatusConnect _statusConn;

  late final ItemRJModel data;
  DetailRJModel? detailData;

  late final String? hospitalId;
  late final String? idUser;
  late final String? name;

  final formKey = GlobalKey<FormState>();
  final formDrugsKey = GlobalKey<FormState>();

  final keluhanC = TextEditingController();
  final lajuPernapasanC = TextEditingController();
  final denyutNadiC = TextEditingController();
  final tinggiBadanC = TextEditingController();
  final beratBadanC = TextEditingController();
  final gulaDarahC = TextEditingController();
  final suhuTubuhC = TextEditingController();
  final lingkarPerutC = TextEditingController();
  final saturasiOksigenC = TextEditingController();
  final darahSistolikC = TextEditingController();
  final darahDiastolikC = TextEditingController();
  final obatC = TextEditingController();

  // DRUGS MODAL TEXTCONTROLLER
  final namaObatC = TextEditingController();
  final quantityC = TextEditingController();
  final priceC = TextEditingController();
  final satuanObatC = TextEditingController(text: 'unit');
  final cignaC = TextEditingController(text: '-');

  // final keluhanF = FocusNode();
  // final lajuPernapasanF = FocusNode();
  // final denyutNadiF = FocusNode();
  // final tinggiBadanF = FocusNode();
  // final beratBadanF = FocusNode();
  // final gulaDarahF = FocusNode();
  // final suhuTubuhF = FocusNode();
  // final lingkarPerutF = FocusNode();
  // final saturasiOksigenF = FocusNode();
  // final darahSistolikF = FocusNode();
  // final darahDiastolikF = FocusNode();
  // final obatF = FocusNode();

  // DRUGS MODAL FOCUS NODE
  final namaObatF = FocusNode();
  final quantityF = FocusNode();
  final priceF = FocusNode();
  final satuanObatF = FocusNode();
  final cignaF = FocusNode();

  final keluhan = ''.obs;
  final lajuPernapasan = ''.obs;
  final denyutNadi = ''.obs;
  final tinggiBadan = ''.obs;
  final beratBadan = ''.obs;
  final gulaDarah = ''.obs;
  final suhuTubuh = ''.obs;
  final lingkarPerut = ''.obs;
  final saturasiOksigen = ''.obs;
  final darahSistolik = ''.obs;
  final darahDiastolik = ''.obs;

  final selectedItemsDiagnoses = Rx<List<ItemDiagnosesModel>>([]);
  final itemsDiagnoses = <DiagnosesModel>[].obs;

  // DRUGS MODAL OBS
  final namaObat = ''.obs;
  final quantity = ''.obs;
  final price = ''.obs;
  final satuanObat = 'unit'.obs;
  final cigna = ''.obs;

  final itemsProcedures = <ProcedureModel>[].obs;
  final selectedItemsProcedures = RxList<ItemProcedureModel>();

  // final itemsDrugs = <PrescriptionsModel>[].obs;
  final newItemsDrugs = <DrugsModel>[].obs;

  final totalAmountDrugs = 0.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    hospitalId = _initC.localStorage.read(ConstantsKeys.hospitalId);
    idUser = _initC.localStorage.read(ConstantsKeys.createdId);
    name = _initC.localStorage.read(ConstantsKeys.createdName);

    data = Get.arguments as ItemRJModel;
    _emrConn = EMRConnect(_initC);
    _statusConn = StatusConnect(_initC);

    _initListener();
    _initWorker();
    _initFetch();
  }

  void _initListener() {
    _listener(keluhan, keluhanC);
    _listener(lajuPernapasan, lajuPernapasanC);
    _listener(denyutNadi, denyutNadiC);
    _listener(tinggiBadan, tinggiBadanC);
    _listener(beratBadan, beratBadanC);
    _listener(gulaDarah, gulaDarahC);
    _listener(suhuTubuh, suhuTubuhC);
    _listener(lingkarPerut, lingkarPerutC);
    _listener(saturasiOksigen, saturasiOksigenC);
    _listener(darahSistolik, darahSistolikC);
    _listener(darahDiastolik, darahDiastolikC);

    _listener(namaObat, namaObatC);
    _listener(quantity, quantityC);
    _listener(price, priceC);
    _listener(satuanObat, satuanObatC);
    _listener(cigna, cignaC);
  }

  void _listener(RxString obs, TextEditingController controller) =>
      controller.addListener(() => obs.value = controller.text);

  void _initText() {
    // passing itemsDiagnoses
    if (detailData != null) {
      // DIAGNOSA
      if (detailData!.diagnoses != null) {
        itemsDiagnoses.value = detailData!.diagnoses!;

        final formatSelectedDiagnose = detailData!.diagnoses!.map((e) {
          final item = e.name?.firstOrNull;
          final (code, description) = TextHelper.extractCodeAndDescription(
            input: e.name?.firstOrNull?.keyword,
          );

          return ItemDiagnosesModel(
            id: item?.id,
            code: code,
            description: description,
            isStroke: e.streakId != null && e.streakName != null,
          );
        }).toList();

        selectedItemsDiagnoses.value = formatSelectedDiagnose;
      }

      // PROCEDURES
      if (detailData!.procedures != null) {
        itemsProcedures.value = detailData!.procedures!;

        final formatSelectedProcedures = itemsProcedures.map((e) {
          return ItemProcedureModel(
            id: e.id,
            name: e.procedureName,
            basicFee: e.basicFee,
            totalFee: e.totalFee,
            isPriceLock: e.isPriceLock,
          );
        }).toList();

        selectedItemsProcedures.value = formatSelectedProcedures;
      }

      //! DRUGS - tidak digunakan untuk sekarang
      // if (detailData!.prescriptions != null) {
      //   itemsDrugs.value = detailData!.prescriptions!;
      // }
    }

    // VITAL SIGNS
    final vitalSign = detailData?.vitalSigns?.firstOrNull;
    _textC(keluhanC, data.complaint);
    _textVitalSignC(lajuPernapasanC, vitalSign?.repiratoryRate.toString());
    _textVitalSignC(denyutNadiC, vitalSign?.heartPulse.toString());
    _textVitalSignC(tinggiBadanC, vitalSign?.height.toString());
    _textVitalSignC(beratBadanC, vitalSign?.weight.toString());
    _textVitalSignC(gulaDarahC, vitalSign?.bloodSugar.toString());
    _textVitalSignC(suhuTubuhC, vitalSign?.temperature.toString());
    _textVitalSignC(lingkarPerutC, vitalSign?.lingkarPerut.toString());
    _textVitalSignC(saturasiOksigenC, vitalSign?.oxygenSaturation.toString());
    _textVitalSignC(darahSistolikC, vitalSign?.sistole.toString());
    _textVitalSignC(darahDiastolikC, vitalSign?.diastole.toString());
  }

  void _textC(TextEditingController ctr, String? value) =>
      ctr.text = value ?? '';

  void _textVitalSignC(TextEditingController ctr, String? value) {
    if (value != null && !value.contains('0')) ctr.text = value;
  }

  void _initWorker() {
    everAll(
      [
        quantity,
        satuanObat,
        price,
      ],
      (_) => _countTotalAmountDrugs(),
    );
  }

  void _initFetch() {
    _fetchDetailEMR();
  }

  void _fetchDetailEMR() async {
    try {
      final where = {
        "where": {
          "hospitalId": hospitalId,
          "patientId": data.pasiens?.id,
          "appointId": data.id
        },
        "include": [
          "VitalSigns",
          "Patients",
          "DoctorNotes",
          "NurseNotes",
          "Prescriptions",
          "ScourPrescriptions",
          "Procedures",
          "Appointments",
          {
            "relation": "Practices",
            "scope": {
              "include": ["Dokters"]
            }
          },
          "Diagnoses",
          "KRecipeNotes"
        ]
      };

      final query = {'filter': jsonEncode(where)};

      final res = await _emrConn.getDetailEMR(query);

      if (res.isOk) {
        final body = res.body;

        if (body != null && body is List<dynamic>) {
          final items = body.map((e) => DetailRJModel.fromJson(e));
          final data = items.firstOrNull;

          detailData = data;

          _initText();
          change(data, status: RxStatus.success());
        }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    }
  }

  Future<List<ItemDiagnosesModel>> filterDiagnoses(
    String filter,
    // LoadProps? props,
  ) async {
    try {
      final res = await _emrConn.searchDiagnosesICD10s(filter);

      if (res.isOk) {
        final body = res.body;

        if (body != null && body is List<dynamic>) {
          final data = body.map((e) => ItemDiagnosesModel.fromJson(e)).toList();
          return data;
        }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    }

    return [];
  }

  Future<bool> addDiagnosa(
    ItemDiagnosesModel? prevItems,
    ItemDiagnosesModel? nextItems,
  ) async {
    final now = DateTime.now();

    final body = <String, dynamic>{
      "mrNo": detailData?.mrNo,
      "mrId": detailData?.id,
      "hospitalId": hospitalId,
      "patientId": detailData?.patientId,
      "createdId": idUser,
      "createdName": name,
      "practiceId": detailData?.practiceId,
      "appointId": detailData?.appointId,
      "createdAt": now.toUtc().toString(),
      "updatedAt": now.toUtc().toString(),
    };

    if (nextItems != null) {
      final mapName = ItemNameDiagnosesModel(
        id: nextItems.id,
        isICD10: true,
        keyword: '${nextItems.code} ${nextItems.description}',
      ).toJson();

      body['name'] = [mapName];
    }

    try {
      Dialogs.loading(context: Get.context!);

      final res = await _emrConn.addDiagnoses(body);

      if (res.isOk) {
        final body = res.body;

        if (body != null && body is Map<String, dynamic>) {
          final data = DiagnosesModel.fromJson(body);

          List<DiagnosesModel> newData = List.from(itemsDiagnoses.value);
          newData.add(data);
          itemsDiagnoses.value = newData;
        }
      } else {
        _initC.handleError(status: res.status);
      }

      // print(res.body);
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      Get.back();
    }

    return false;
  }

  void strokeDiagnose(String? id) async {
    final now = DateTime.now();
    final body = <String, dynamic>{
      "streakId": idUser,
      "streakName": name,
    };

    try {
      Dialogs.loading(context: Get.context!);

      final res = await _emrConn.coretDiagnose(
        id: id ?? '',
        body: body,
      );

      if (res.isOk) {
        final index = itemsDiagnoses.indexWhere((element) => element.id == id);
        List<DiagnosesModel> formatData = List.from(itemsDiagnoses.value);
        formatData[index] = formatData.elementAt(index).copyWith.call(
              streakId: idUser,
              streakName: name,
              streakAt: now.toUtc().toString(),
            );
        itemsDiagnoses.value = formatData;

        Snackbar.success(
          context: Get.context!,
          content: 'Diagnosa berhasil dicoret',
        );
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      Get.back();
    }
  }

  void strokeProcedure(int i, String? id) async {
    final body = <String, dynamic>{
      "streakId": idUser,
      "streakName": name,
    };

    try {
      Dialogs.loading(context: Get.context!);

      final res = await _emrConn.coretProcedure(id: id ?? '', body: body);

      if (res.isOk) {
        List<ProcedureModel> formatData = List.from(itemsProcedures.value);
        formatData[i] = formatData.elementAt(i).copyWith.call(
              streakId: idUser,
              streakName: name,
            );
        itemsProcedures.value = formatData;

        Snackbar.success(
          context: Get.context!,
          content: 'Tindakan berhasil dicoret',
        );
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      Get.back();
    }
  }

  //! Tidak digunakan untuk sekarang
  // void strokeDrugs(int i, String? id) async {
  //   final body = <String, dynamic>{
  //     "streakId": idUser,
  //     "streakName": name,
  //   };

  //   try {
  //     Dialogs.loading(context: Get.context!);

  //     final res = await _emrConn.coretDrugs(id: id ?? '', body: body);

  //     if (res.isOk) {
  //       List<PrescriptionsModel> formatData = List.from(itemsDrugs);
  //       formatData[i] = formatData.elementAt(i).copyWith.call(
  //             streakId: idUser,
  //             streakName: name,
  //           );
  //       itemsDrugs.value = formatData;

  //       Snackbar.success(
  //         context: Get.context!,
  //         content: 'Obat berhasil dicoret',
  //       );
  //     } else {
  //       _initC.handleError(status: res.status);
  //     }
  //   } on GetHttpException catch (e) {
  //     _initC.logger.e('Error: $e');
  //   } finally {
  //     Get.back();
  //   }
  // }

  void _countTotalAmountDrugs() {
    totalAmountDrugs.value = 0;
    totalAmountDrugs.value =
        (int.tryParse(quantity.value) ?? 0) * (int.tryParse(price.value) ?? 0);
  }

  void save(BuildContext context) {
    if (!formKey.currentState!.validate()) {
      Snackbar.failed(
        context: context,
        content:
            'Field masih belum lengkap atau validasi masih error, cek lagi data yang anda kirimkan!',
      );
      return;
    }

    FocusScope.of(context).unfocus();
    _processData(context);
  }

  void _processData(BuildContext context) async {
    isLoading.value = true;
    final now = DateTime.now().toUtc().toString();

    final bodyComplaint = {
      'appointId': detailData?.appointId,
      'complaint': keluhan.value,
    };

    final bodyVitalSign = {
      "height": tinggiBadan.value,
      "weight": beratBadan.value,
      "temperature": suhuTubuh.value,
      "heartPulse": denyutNadi.value,
      "repiratoryRate": lajuPernapasan.value,
      "sistole": darahSistolik.value,
      "diastole": darahDiastolik.value,
      "bloodSugar": gulaDarah.value,
      "lingkarPerut": lingkarPerut.value,
      "oxygenSaturation": saturasiOksigen.value,
    };

    final bodyDoctorNotes = {
      "mrNo": detailData?.mrNo,
      "hospitalId": hospitalId,
      "patientId": detailData?.patientId,
      "createdName": name,
      "createdId": idUser,
      "practiceId": detailData?.practiceId,
      "appointId": detailData?.appointId,
      "mrId": detailData?.id,
      "createdAt": now,
      "subjective": [keluhan.value],
      "objective": [
        'Laju Pernapasan : ${lajuPernapasan.value.isNotEmpty ? '${lajuPernapasan.value} bpm' : 'N/A'} ',
        'Denyut Nadi : ${denyutNadi.value.isNotEmpty ? '${denyutNadi.value} hbpm' : 'N/A'} ',
        'Tinggi Badan : ${tinggiBadan.value.isNotEmpty ? '${tinggiBadan.value} kg' : 'N/A'} ',
        'Berat Badan : ${beratBadan.value.isNotEmpty ? '${beratBadan.value} cm' : 'N/A'} ',
        'Gula Darah : ${gulaDarah.value.isNotEmpty ? '${gulaDarah.value} mg/dL' : 'N/A'} ',
        'Suhu Tubuh : ${suhuTubuh.value.isNotEmpty ? '${suhuTubuh.value}°C' : 'N/A'} ',
        'Lingkaran Perut : ${lingkarPerut.value.isNotEmpty ? '${lingkarPerut.value} cm' : 'N/A'} ',
        'Saturasi Oksigen : ${saturasiOksigen.value.isNotEmpty ? '${saturasiOksigen.value} SpO2' : 'N/A'} ',
        'Darah Sistolik : ${darahSistolik.value.isNotEmpty ? '${darahSistolik.value} mmHg' : 'N/A'} ',
        'Darah Diastolik : ß${darahDiastolik.value.isNotEmpty ? '${darahDiastolik.value} mmHg' : 'N/A'} ',
      ],
    };

    final dataDrugs = newItemsDrugs
        .map(
          (element) =>
              '${element.medicineName}, ${element.quantity} ${element.unit} (${element.rule})',
        )
        .toList();
    final formatDataDrugs = dataDrugs.join(',\n');
    bodyDoctorNotes['freeText'] = formatDataDrugs;

    if (itemsDiagnoses.isNotEmpty) {
      // filter dulu diagnosa yang tidak di coret yang diambil
      final filterDiagnoseNotStroke = itemsDiagnoses
          .where((value) =>
              value.streakId == null &&
              value.streakName == null &&
              value.streakAt == null)
          .toList();

      final mapItemDiagnoses =
          filterDiagnoseNotStroke.mapMany((item) => item.name).toSet().toList();

      final assesment = mapItemDiagnoses.map((e) => e.keyword).toList();
      bodyDoctorNotes['assessment'] = assesment;
    }

    final plans = [];

    // filter dulu prosedur yang tidak di coret yang diambil
    if (itemsProcedures.isNotEmpty) {
      final filterProceduresNotStroke = itemsProcedures
          .where((value) => value.streakId == null && value.streakName == null)
          .toList();

      final procedures = filterProceduresNotStroke
          .map((item) => '${item.procedureName} -> ${TextHelper.formatRupiah(
                amount: item.basicFee,
                isCompact: false,
              )} \n')
          .toSet()
          .toList();

      plans.addAllIf(procedures.isNotEmpty, procedures);
    }

    //! filter dulu obat yang tidak di coret yang diambil - tidak digunakan
    // if (itemsDrugs.isNotEmpty) {
    //   final filterDrugsNotStroke = itemsDrugs
    //       .where((value) => value.streakId == null && value.streakName == null)
    //       .toList();

    //   final drugs = filterDrugsNotStroke
    //       .map((item) =>
    //           '${item.quantity ?? '0'} ${item.medicineName ?? '-'} (${item.cigna ?? '-'}) -> ${TextHelper.formatRupiah(
    //             amount: item.basicFee,
    //             isCompact: false,
    //           )} \n')
    //       .toSet()
    //       .toList();

    //   plans.add('Obat \n');
    //   plans.addAllIf(drugs.isNotEmpty, drugs);
    // }

    bodyDoctorNotes['plan'] = plans;

    final bodyDone = {
      'id': detailData?.appointId,
      'isSystem': true,
    };

    try {
      Dialogs.loading(
        context: context,
        isDismissable: false,
        message: 'Data sedang diproses mohon tunggu sebentar...',
      );

      // save keluhan terlebih dahulu
      final resComplaint = await _emrConn.saveComplaint(bodyComplaint);

      if (resComplaint.isOk) {
        Response<dynamic> resVitalSign;
        // cek vital sign ini tambah atau update data
        final vitalSign = detailData?.vitalSigns;

        if (vitalSign != null && vitalSign.isNotEmpty) {
          bodyVitalSign.addAll({
            "updatedName": name ?? '',
            "updatedAt": now,
            "updatedId": idUser ?? '',
          });

          final vitalId = vitalSign.first.id!;

          // berarti update data
          resVitalSign = await _emrConn.updateVitalSign(
            id: vitalId,
            body: bodyVitalSign,
          );
        } else {
          bodyVitalSign.addAll({
            "mrNo": detailData?.mrNo ?? '',
            "hospitalId": hospitalId ?? '',
            "patientId": detailData?.patientId ?? '',
            "practiceId": detailData?.practiceId ?? '',
            "appointId": detailData?.appointId ?? '',
            "mrId": detailData?.id ?? '',
            "createdName": name ?? '',
            "createdAt": now,
            "createdId": idUser ?? '',
          });

          // berarti tambah vital sign
          resVitalSign = await _emrConn.saveVitalSigns(bodyVitalSign);
        }

        Helper.printPrettyJson(resVitalSign.body);

        if (resVitalSign.isOk) {
          // lanjut save notes
          final resDoctorNotes = await _emrConn.addDoctorNotes(bodyDoctorNotes);
          Helper.printPrettyJson(resDoctorNotes.body);

          if (resDoctorNotes.isOk) {
            // ubah data EMR tadi ke status done / success
            final resStatusDone = await _statusConn.succeed(bodyDone);

            if (resStatusDone.isOk) {
              Get.back();
              Snackbar.success(
                context: Get.context!,
                content: 'Status Pendaftaran Selesai',
              );
              Get.back(result: true);

              print('appointment diubah ke status sukses');
            }
          } else {
            Get.back();
            _initC.handleError(status: resDoctorNotes.status);
          }
        } else {
          Get.back();
          _initC.handleError(status: resVitalSign.status);
        }
      } else {
        Get.back();
        _initC.handleError(status: resComplaint.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // void _saveDrugs() async {
  //   isLoading.value = true;

  //   final body = [
  //     {
  //       "appointId": detailData?.appointId,
  //       "basicFee": price.value,
  //       "category": "Lainnya",
  //       "cigna": cigna.value,
  //       "hospitalId": hospitalId,
  //       "isDb": false,
  //       "isPriceLock": false,
  //       "isSatuSehatPrivata": false,
  //       "medicineName": namaObat.value,
  //       "mrId": detailData?.id,
  //       "mrNo": detailData?.mrNo,
  //       "patientId": detailData?.patientId,
  //       "practiceId": detailData?.practiceId,
  //       "quantity": int.tryParse(quantity.value) ?? 0,
  //       "totalFee": totalAmountDrugs.value,
  //       "unit": satuanObat.value,
  //       "kfa": {},
  //       "depotId": '5edef56b8ed2cf6eee59bb31',
  //     }
  //   ];

  //   try {
  //     final res = await _emrConn.saveDrugs(body);

  //     if (res.isOk) {
  //       final body = res.body;

  //       if (body is Map<String, dynamic>) {
  //         final data = body['data'] as List<dynamic>;
  //         final map = data.map((e) => PrescriptionsModel.fromJson(e)).toList();

  //         List<PrescriptionsModel> newItem = List.from(itemsDrugs);
  //         newItem.add(map.first); // data pertama
  //         itemsDrugs.value = newItem;
  //         Get.back();
  //       }

  //       _clearFormObat();
  //       Snackbar.success(
  //         context: Get.context!,
  //         content: 'Obat berhasil ditambahkan',
  //       );
  //     } else {
  //       _initC.handleError(status: res.status);
  //     }
  //   } on GetHttpException catch (e) {
  //     _initC.logger.e('Error: $e');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  void showProcedureDialog() async {
    final data = await Get.toNamed(
      Routes.SEARCH_PROCEDURE_DIALOG,
      arguments: {
        'detailData': detailData,
      },
    );

    if (data != null && data is List<ProcedureModel>) {
      // selectedItemsProcedures.value = data;

      // set to view
      List<ProcedureModel> dataProcedure = List.from(itemsProcedures);
      dataProcedure.addAll(data);
      itemsProcedures.value = dataProcedure;
    }
  }

  // void showDrugsModal(BuildContext context) async {
  //   final textTheme = context.textTheme;

  //   Modals.bottomSheet(
  //     context: context,
  //     content: Container(
  //       padding: const EdgeInsets.symmetric(
  //         horizontal: 8,
  //         vertical: 16,
  //       ),
  //       child: _builderDrugsForm(),
  //     ),
  //     actions: Row(
  //       children: [
  //         Expanded(
  //           child: Obx(
  //             () => AutoSizeText(
  //               '${TextHelper.formatRupiah(
  //                 amount: totalAmountDrugs.value,
  //               )} / ${satuanObat.value}',
  //               style: textTheme.titleLarge,
  //             ),
  //           ),
  //         ),
  //         Obx(
  //           () {
  //             var isEnabledSave = false;

  //             if (isLoading.value ||
  //                 (namaObat.value.isNotEmpty &&
  //                     quantity.value.isNotEmpty &&
  //                     price.value.isNotEmpty &&
  //                     satuanObat.value.isNotEmpty)) {
  //               isEnabledSave = true;
  //             }

  //             return Buttons.filled(
  //               onPressed: isEnabledSave
  //                   ? () async {
  //                       final state = await Dialogs.alert(
  //                         context: context,
  //                         title: 'Perhatian',
  //                         content: const Text(
  //                           'Apakah anda yakin ingin menambahkan data obat ini ?',
  //                         ),
  //                       );

  //                       if (state != null) {
  //                         if (state) {
  //                           _saveDrugs();
  //                         }
  //                       }
  //                     }
  //                   : null,
  //               state: isLoading.value,
  //               child: const Text(ConstantsStrings.save),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );

  //   // final data = await Get.toNamed(
  //   //   Routes.DRUGS_DIALOG,
  //   //   arguments: detailData,
  //   // );

  //   // if (data != null && data is List<ProcedureModel>) {
  //   //   // selectedItemsProcedures.value = data;

  //   //   // set to view
  //   //   List<ProcedureModel> dataProcedure = List.from(itemsProcedures);
  //   //   dataProcedure.addAll(data);
  //   //   itemsProcedures.value = dataProcedure;
  //   // }
  // }

  //todo Percobaan
  void moveToMedicalPrescription() async {
    final result = await Get.toNamed(Routes.MEDICAL_PRESCRIPTION);

    if (result != null) {
      if (result is DrugsModel) {
        final listData = List<DrugsModel>.from(newItemsDrugs);
        listData.add(result);
        newItemsDrugs.value = listData;
      }
    }
  }

  // Widget _builderDrugsForm() {
  //   return Form(
  //     key: formDrugsKey,
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Obx(
  //           () => CustomTextFormField(
  //             controller: namaObatC,
  //             focusNode: namaObatF,
  //             title: 'Nama Obat',
  //             isFilled: true,
  //             isRequired: true,
  //             suffixIconState: namaObat.value.isNotEmpty,
  //             validator: (value) => Validation.formField(
  //               titleField: 'Nama Obat',
  //               value: value,
  //               isRequired: true,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 16),
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Expanded(
  //               child: CustomTextFormField(
  //                 controller: quantityC,
  //                 focusNode: quantityF,
  //                 title: 'Quantity',
  //                 isFilled: true,
  //                 isNumericOnly: true,
  //                 keyboardType: TextInputType.number,
  //                 isRequired: true,
  //                 inputFormatters: [
  //                   FilteringTextInputFormatter.digitsOnly,
  //                 ],
  //                 validator: (value) => Validation.formField(
  //                   titleField: 'Quantity',
  //                   value: value,
  //                   isNotZero: true,
  //                   isNumericOnly: true,
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 16),
  //             Expanded(
  //               child: Obx(
  //                 () => CustomTextFormField(
  //                   controller: priceC,
  //                   focusNode: priceF,
  //                   title: 'Harga',
  //                   isRequired: true,
  //                   isFilled: true,
  //                   isNumericOnly: true,
  //                   suffixIconState: price.value.isNotEmpty,
  //                   validator: (value) => Validation.formField(
  //                     titleField: 'Harga',
  //                     value: value,
  //                     isRequired: true,
  //                     isNotZero: true,
  //                     isNumericOnly: true,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 16),
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Expanded(
  //               child: Obx(
  //                 () => CustomTextFormField(
  //                   controller: satuanObatC,
  //                   focusNode: satuanObatF,
  //                   title: 'Satuan Obat',
  //                   isRequired: true,
  //                   isFilled: true,
  //                   suffixIconState: satuanObat.value.isNotEmpty,
  //                   validator: (value) => Validation.formField(
  //                     titleField: 'Satuan Obat',
  //                     value: value,
  //                     isRequired: true,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 16),
  //             Expanded(
  //               child: Obx(
  //                 () => CustomTextFormField(
  //                   controller: cignaC,
  //                   focusNode: cignaF,
  //                   title: 'Cigna',
  //                   helperText:
  //                       'Ketik - (strip) untuk menandakan tidak ada signatura',
  //                   helperMaxLines: 3,
  //                   isFilled: true,
  //                   suffixIconState: cigna.value.isNotEmpty,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  void moveToTimelineEMR() => Get.toNamed(
        Routes.TIMELINE_EMR,
        arguments: data,
      );

  // void _clearFormObat() {
  //   namaObatC.clear();
  //   quantityC.clear();
  //   priceC.clear();
  //   satuanObatC.clear();
  //   cignaC.clear();
  //   namaObat.value = '';
  //   quantity.value = '';
  //   price.value = '';
  //   satuanObat.value = '';
  //   cigna.value = '';
  // }

  void removeItemDrugs(int index) => newItemsDrugs.removeAt(index);
}
