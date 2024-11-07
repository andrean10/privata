import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/data/models/rj/item_rj/item_rj_model.dart';
import 'package:privata/app/data/models/rj/item_rj/patient/rj_patient_model.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/services/rj/rj_connect.dart';

import '../../../../../../utils/constants_keys.dart';
import '../../../../../data/models/patient/patient_model.dart';
import '../../../../../routes/app_pages.dart';

class SearchPatientController extends GetxController
    with StateMixin<List<PatientModel>?> {
  late final InitController _initC;
  late final RJConnect _patientRegistConn;

  late final String? hospitalId;

  final searchC = TextEditingController();

  final searchF = FocusNode();

  final search = ''.obs;

  final resultSearch = <PatientModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _patientRegistConn = RJConnect(_initC);

    hospitalId = _initC.localStorage.read<String>(ConstantsKeys.hospitalId);

    change(null, status: RxStatus.empty());

    _initTextController();
    _initWorker();
  }

  void _initTextController() {
    searchC.addListener(_setSearch);
  }

  void _initWorker() {
    debounce(search, fetchData);
  }

  void _setSearch() => search.value = searchC.text;

  void selectUser(PatientModel user) => Get.back(result: user);

  void fetchData(String filter) async {
    try {
      if (filter.isNotEmpty && hospitalId != null) {
        change(null, status: RxStatus.loading());

        final query = {
          'rsId': hospitalId,
          'keyword': filter,
          'skip': '0',
          'limit': '15',
        };

        final res = await _patientRegistConn.searchPatient(query);
        final body = res.body;

        if (res.isOk) {
          if (body != null && body is List<dynamic>) {
            final resultSearch =
                body.map((e) => PatientModel.fromJson(e)).toList();

            if (resultSearch.isNotEmpty) {
              change(
                resultSearch,
                status: RxStatus.success(),
              );
            } else {
              change(null, status: RxStatus.empty());
            }
          }
        } else {
          _initC.handleError(status: res.status);
        }
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
      change(null, status: RxStatus.error('$e'));
    }
  }

  void fetchTimelinePatient() {}

  void moveTo({
    required PatientModel dataPatient,
    required bool isFromRME,
  }) async {
    if (isFromRME) {
      final itemRJModel = ItemRJModel(
        pasiens: RJPatientModel(
          id: dataPatient.id,
          nama: dataPatient.nama,
          tanggalLahir: dataPatient.tanggalLahir,
          gender: dataPatient.gender,
        ),
      );

      Get.toNamed(
        Routes.TIMELINE_EMR,
        arguments: itemRJModel,
      );
    } else {
      final state = await Get.toNamed(
        Routes.VISIT_REGISTRATION,
        arguments: dataPatient,
      );

      // cek jika visit registrasi berhasil ditambahkan maka kembalikan
      // state ke rj view
      if (state != null) {
        if (state) Get.back(result: state);
      }
    }
  }

  void backTo(PatientModel item) => Get.back(result: item);
}
