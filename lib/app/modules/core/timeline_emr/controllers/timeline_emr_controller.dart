import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../../../../../services/timeline/emr_connect.dart';
import '../../../../data/models/rj/item_rj/item_rj_model.dart';
import '../../../../helpers/helper.dart';
import '../../../init/controllers/init_controller.dart';

class TimelineEmrController extends GetxController {
  late final InitController _initC;
  late final EMRConnect _emrConn;

  String? name, age, gender, hospitalId, patientId;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _prepareView();
  }

  void _prepareView() {
    final args = Get.arguments;

    if (args is ItemRJModel) {
      final patient = args.pasiens;

      name = patient?.nama ?? '-';
      age = '${Helper.getAge(patient?.tanggalLahir)} Thn';
      gender = patient!.gender == 1 ? 'Laki-laki' : 'Perempuan';
    }
  }

  void fetchTimeline() async {
    //   if (!isLoading.value && hospitalId != null) {

    final params = {
      "where": {
        "hospitalId": hospitalId,
        "patientId": patientId,
      },
      "order": ["milis DESC"],
      "include": [
        "Patients",
        "DoctorNotes",
        "Appointments",
        {
          "relation": "Practices",
          "scope": {
            "include": ["Dokters"]
          }
        }
      ],
    };

    final encodeParams = jsonEncode(params);
    final query = {'filter': encodeParams};

    try {
      final res = await _emrConn.timelineEMRByPatient(query);

      if (res.isOk) {
        final body = res.body;
        // final rj = RJModel.fromJson(body);

        // currentPage = rj.currentPage ?? 0;
        // totalPage = rj.totalPage ?? 0;
        // totalItem = rj.totalItem ?? 0;

        return body;

        // change(rj, status: RxStatus.success());
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    }

    return null;
  }
}
