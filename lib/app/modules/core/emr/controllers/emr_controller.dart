import 'dart:async';
import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/data/db/item/item_model.dart';
import 'package:privata/app/data/models/rj/item_rj/item_rj_model.dart';
import 'package:privata/app/helpers/helper.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/services/timeline/emr_connect.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../../data/models/detail_rj/detail_rj_model.dart';
import '../../../../data/models/detail_rj/diagnoses/diagnoses_model.dart';
import '../../../../data/models/detail_rj/diagnoses/item_diagnoses/item_diagnoses_model.dart';
import '../../../../data/models/detail_rj/diagnoses/item_name_diagnoses/item_name_diagnoses_model.dart';
import '../../../../data/models/procedure/procedure_model.dart';
import '../../../../helpers/text_helper.dart';
import '../../../../routes/app_pages.dart';
import '../../../widgets/dialog/dialogs.dart';
import '../../../widgets/snackbar/snackbar.dart';
import 'search_action_controller.dart';

class EmrController extends GetxController with StateMixin<DetailRJModel?> {
  late final InitController _initC;

  late final EMRConnect _emrConn;
  late final ItemRJModel data;
  DetailRJModel? detailData;

  late final String? hospitalId;
  late final String? idUser;
  late final String? idName;

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

  final keluhanF = FocusNode();
  final lajuPernapasanF = FocusNode();
  final denyutNadiF = FocusNode();
  final tinggiBadanF = FocusNode();
  final beratBadanF = FocusNode();
  final gulaDarahF = FocusNode();
  final suhuTubuhF = FocusNode();
  final lingkarPerutF = FocusNode();
  final saturasiOksigenF = FocusNode();
  final darahSistolikF = FocusNode();
  final darahDiastolikF = FocusNode();
  final obatF = FocusNode();

  final keluhan = ''.obs;
  final obat = ''.obs;
  final selectedItemsDiagnoses = Rx<List<ItemDiagnosesModel>>([]);
  final itemsDiagnoses = <DiagnosesModel>[].obs;

  final listDrugs = <ItemModel>[].obs;
  final resultProcedures = <ProcedureModel>[].obs;

  final actionChip = ['Tindakan', 'Obat'];

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
    idName = _initC.localStorage.read(ConstantsKeys.createdName);

    data = Get.arguments as ItemRJModel;
    _emrConn = EMRConnect(_initC);

    _initListener();
    _initFetch();
  }

  void _initListener() {
    _listener(keluhan, keluhanC);
    _listener(obat, obatC);
  }

  void _listener(RxString obs, TextEditingController controller) =>
      controller.addListener(() => obs.value = controller.text);

  void _initText() {
    // passing itemsDiagnoses
    if (detailData != null && detailData?.diagnoses != null) {
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

    final vitalSign = detailData?.vitalSigns?.firstOrNull;
    _textC(keluhanC, data.complaint);
    _textC(lajuPernapasanC, vitalSign?.repiratoryRate.toString());
    _textC(denyutNadiC, vitalSign?.heartPulse.toString());
    _textC(tinggiBadanC, vitalSign?.height.toString());
    _textC(beratBadanC, vitalSign?.weight.toString());
    _textC(gulaDarahC, vitalSign?.bloodSugar.toString());
    _textC(suhuTubuhC, vitalSign?.temperature.toString());
    _textC(lingkarPerutC, vitalSign?.lingkarPerut.toString());
    _textC(saturasiOksigenC, vitalSign?.oxygenSaturation.toString());
    _textC(darahSistolikC, vitalSign?.sistole.toString());
    _textC(darahDiastolikC, vitalSign?.diastole.toString());
  }

  void _textC(TextEditingController ctr, String? value) =>
      ctr.text = value ?? '';

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
          final data = body.map((e) => DetailRJModel.fromJson(e)).first;
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
      "createdName": idName,
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

  Future<void> strokeDiagnose(String? id) async {
    final now = DateTime.now();
    final body = <String, dynamic>{
      "streakId": idUser,
      "streakName": idName,
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
              streakName: idName,
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

  void save() {}

  void showActionDialog({required SearchType type}) async {
    final map = <String, dynamic>{'type': type};

    if (type == SearchType.procedure) {
      map.addAll({'data': resultProcedures});
    }

    final data = await Get.toNamed(
      Routes.SEARCH_ACTION_DIALOG,
      arguments: map,
    );

    if (data != null) {
      if (type == SearchType.procedure) {
        // set jika ada result yang dipilih user
        resultProcedures.addAll(data);
      }
    }
  }

  void moveToTimelineEMR() => Get.toNamed(Routes.TIMELINE_EMR);
}
