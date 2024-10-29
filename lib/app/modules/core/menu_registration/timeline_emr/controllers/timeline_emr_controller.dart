import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../../../../services/timeline/emr_connect.dart';
import '../../../../../data/models/detail_rj/detail_rj_model.dart';
import '../../../../../data/models/rj/item_rj/item_rj_model.dart';
import '../../../../../helpers/helper.dart';
import '../../../../init/controllers/init_controller.dart';

class TimelineEmrController extends GetxController
    with StateMixin<List<DetailRJModel>> {
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

    _emrConn = EMRConnect(_initC);

    _prepareView();
  }

  void _prepareView() {
    final data = Get.arguments as ItemRJModel?;
    final patient = data?.pasiens;

    hospitalId = _initC.localStorage.read<String>(ConstantsKeys.hospitalId);
    patientId = patient?.id;
    name = patient?.nama ?? '-';
    age = '${Helper.getAge(patient?.tanggalLahir)} Thn';
    gender = patient!.gender == 1 ? 'Laki-laki' : 'Perempuan';

    fetchTimeline();
  }

  void fetchTimeline() async {
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

        if (body != null) {
          if (body is List<dynamic>) {
            final items = body.map((e) => DetailRJModel.fromJson(e)).toList();
            change(items, status: RxStatus.success());
          }
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        _initC.handleError(status: res.status);
        change(null, status: RxStatus.error(res.statusText));
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
      change(null, status: RxStatus.error(e.message));
    }

    return null;
  }
}
