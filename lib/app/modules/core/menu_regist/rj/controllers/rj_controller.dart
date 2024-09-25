import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/data/models/doctor/item_doctor_model.dart';
import 'package:privata/app/data/models/doctor/result_doctor_model.dart';
import 'package:privata/app/data/models/result/result_model.dart';
import 'package:privata/app/data/models/rj/item_rj/item_rj_model.dart';
import 'package:privata/app/helpers/format_date_time.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/modules/widgets/buttons/buttons.dart';
import 'package:privata/services/rj/rj_connect.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../services/doctor/doctor_connect.dart';
import '../../../../../../services/status/status_connect.dart';
import '../../../../../../utils/constants_keys.dart';
import '../../../../../../utils/constants_strings.dart';
import '../../../../../data/models/rj/rj_model.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../widgets/dialog/dialogs.dart';
import '../../../../widgets/snackbar/snackbar.dart';

enum RJStatus { succeed, engaged, booked, waiting, failed }

class RJController extends GetxController with StateMixin<dynamic> {
  late final InitController _initC;
  late final RJConnect _patientRegistConn;
  late final DoctorConnect _doctorConn;
  late final StatusConnect _statusConn;

  late final String? hospitalId;

  final doctorC = TextEditingController();
  final datePatientC = TextEditingController();
  final reasonCancellationC = TextEditingController();

  final doctorF = FocusNode();

  final itemsData = <ItemRJModel>[];
  final dataDoctor = <String?>['Loading'].obs;

  final selectedDoctor = RxnString();
  final selectedDate = Rx(DateTime.now());

  final stateAction = RxnString();

  final isFabVisible = true.obs;
  final isSubFabVisible = false.obs;
  final isFilter = false.obs;
  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final isLoadingMoreDoctor = true.obs;
  final isHasReachedMax = false.obs;
  final isHasReachedMaxDoctor = false.obs;

  final idSelected = ''.obs;
  final isLoadingChangeState = false.obs;

  var currentPage = 0;
  var totalPage = 0;
  var totalItem = 0;

  var currentTotalLimitDoctor = 10.obs;

  var _isFirstTouch = true;

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
    _doctorConn = DoctorConnect(_initC);

    hospitalId = _initC.localStorage.read<String>(ConstantsKeys.hospitalId);

    _initDate();
    _initListener();
    fetchDataPatient();

    ever(
      selectedDate,
      (_) => _clearDataPagination(),
    );

    ever(
      _initC.isConnectedInternet,
      (value) {
        if (value) fetchDataPatient();
      },
    );

    debounce(currentTotalLimitDoctor, (value) => fetchDoctor(value));
  }

  void _initDate() {
    final now = selectedDate.value;
    datePatientC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: now.toString(),
    );
  }

  void _initListener() {
    // doctorF.addListener(
    //   () {
    //     _initC.logger.d(
    //         'debug: doctorF hasFocus && _isFirstTouch ? = ${doctorF.hasFocus} && $_isFirstTouch');

    //     if (doctorF.hasFocus && _isFirstTouch) {
    //       _isFirstTouch = false;
    //       fetchDoctor(currentTotalLimitDoctor.value);
    //     }
    //   },
    // );
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      if (!isLoadingMore.value &&
          currentPage < totalPage &&
          totalItem != itemsData.length) {
        isLoadingMore.value = true;
        currentPage++;

        fetchDataPatient();

        // _initC.logger.d('debug: after currentPage = $currentPage');
      } else if (totalItem == itemsData.length && !isLoadingMore.value) {
        isHasReachedMax.value = true;
      }

      // _initC.logger.d('debug: after isLoadingMore = ${isLoadingMore.value}');
    }

    if (notification is ScrollStartNotification) {
      isFabVisible.value = false;
    } else if (notification is ScrollEndNotification) {
      isFabVisible.value = true;
    }

    return true;
  }

  void changedVisibleSubFab() => isSubFabVisible.toggle();

  void onChangedStatus(String? value) {
    stateAction.value = value;
  }

  void setFilter() => isFilter.toggle();

  void setDoctor(value) {
    doctorC.text = value;
    selectedDoctor.value = value;
  }

  void setDate(DateTime value) {
    datePatientC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: value.toString(),
    );
    selectedDate.value = value;
  }

  void fetchDoctor(int totalLimit) async {
    _initC.logger.d('debug: totalLimit = $totalLimit');

    try {
      final filterData = {"rumahSakitId": "5c00fdcf3b80ad75afc4cbef"};

      final query = {
        'filter_data': jsonEncode(filterData),
        'total': '$totalLimit',
      };

      final res = await _doctorConn.getDoctor(query);
      final body = res.body;
      final response = ResultDoctorModel.fromJson(body);

      final listDoctor = response.items.map(
        (element) {
          return element.dokters?.gelar?.replaceFirst('*', element.nama ?? '');
        },
      );

      if (dataDoctor.first == 'Loading') {
        dataDoctor.clear();
      }

      if (dataDoctor.isNotEmpty) {
        for (var element in listDoctor) {
          dataDoctor.addIf(
            !dataDoctor.contains(element),
            element,
          );
        }
      } else {
        dataDoctor.addAllIf(
          response.totalItem != 0,
          listDoctor,
        );
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
      dataDoctor.clear();
    }

    isLoadingMoreDoctor.value = false;
  }

  void fetchDataPatient({
    bool isFromModal = false,
    bool isRefresh = false,
  }) async {
    const pattern = 'yyyy-MM-dd';

    if (isFromModal) {
      Get.back();
    }

    //* jika item belum ada data atau user mengubah filter maka tampilkan loading dan set currentpage ke 0
    if (itemsData.isEmpty) {
      currentPage = 0;
      change(null, status: RxStatus.loading());
    }

    if (isRefresh) {
      itemsData.clear();
      currentPage = 0;
      change(null, status: RxStatus.loading());
    }

    if (hospitalId != null && (status.isLoading || isLoadingMore.value)) {
      try {
        final date = FormatDateTime.dateToString(
          newPattern: pattern,
          value: selectedDate.value.toString(),
        );

        final params = {
          'rumahSakitId': hospitalId,
          'date': date,
          'sendall': true,
          'isMobile': true,
          // 'or': [
          //   {'status': 'booked'},
          //   {'status': 'succeed'},
          //   {'status': 'waiting'},
          //   {'status': 'engaged'},
          //   {'status': 'failed'},
          // ],
        };

        final query = {
          'filter_data': jsonEncode(params),
          'page': '$currentPage',
          'total': '10',
          'sort': 'createdAt ASC'
        };

        final res = await _patientRegistConn.getList(query);
        final body = res.body;

        if (body is Map<String, dynamic>) {
          final data = RJModel.fromJson(body);
          itemsData.addAll(data.items);

          totalPage = data.totalPage ?? 0;
          totalItem = data.totalItem ?? 0;

          //* jika total item nya kosong maka tampilkan halaman data kosong silahkan cari filter yang lain
          change(
            itemsData,
            status:
                (itemsData.isNotEmpty) ? RxStatus.success() : RxStatus.empty(),
            // status: RxStatus.success(),
          );

          // if (data.totalItem != 0) {
          // } else {
          //   change(null, status: RxStatus.empty());
          // }
        } else {
          change(null, status: RxStatus.empty());
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: $e');
        change(null, status: RxStatus.error(e.message));
      }
    }

    isLoadingMore.value = false;
  }

  void moveToVisitRegistration(BuildContext context) async {
    const isEmptyDoctor = true;

    if (isEmptyDoctor) {
      final state = await Dialogs.alert(
        context: context,
        title: 'Perhatian',
        content: const Text(
          'Dokter tidak tersedia, apakah anda ingin menambahkan dokter?',
        ),
        textYes: 'Tambah',
        textNo: 'Batal',
      );

      _initC.logger.d('debug: state = $state');

      // eksekusi state disini
      if (state != null && state) {
        Get.toNamed(Routes.ADD_DOCTOR);
      }
    } else {
      // Get.toNamed(Routes.VISIT_REGISTRATION);
    }
  }

  void moveToNewPatient() => Get.toNamed(Routes.NEW_PATIENT);

  void moveToTimeline<T>(T args) => Get.toNamed(
        Routes.TIMELINE_EMR,
        arguments: args,
      );

  void moveToEMR({ItemRJModel? itemRJ}) {
    if (itemRJ != null) {
      Get.toNamed(Routes.EMR, arguments: itemRJ);
    } else {
      Get.toNamed(Routes.EMR);
    }
  }

  Future<void> makeToWhatsapp(String numberPhone) async {
    final uri = Uri.parse('whatsapp://send?phone=$numberPhone');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Snackbar.failed(
        context: Get.context!,
        content: 'Nomor Whatsapp tidak terdaftar',
      );
    }
  }

  Future<void> makeToSMS(String numberPhone) async {
    final uri = Uri(
      scheme: 'sms',
      path: numberPhone,
    );

    await launch(
      uri: uri,
      errMsg: 'Tidak bisa melakukan aksi sms',
    );
  }

  Future<void> makeToTelphone(String numberPhone) async {
    final uri = Uri(
      scheme: 'tel',
      path: numberPhone,
    );

    await launch(
      uri: uri,
      errMsg: 'Tidak bisa melakukan aksi telepon',
    );
  }

  void makeToReschedule() => showDialogNextFeatures();

  void makeToNurseNotes() => showDialogNextFeatures();

  void makeToVitalSign() => showDialogNextFeatures();

  Future<void> launch({required Uri uri, required String errMsg}) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Snackbar.failed(
        context: Get.context!,
        content: errMsg,
      );
    }
  }

  void showDialogNextFeatures() {
    Dialogs.alert(
      context: Get.context!,
      title: 'Perhatian',
      content: const Text('Maaf untuk sementara fitur ini belum tersedia'),
      actions: [
        Buttons.text(
          onPressed: Get.back,
          child: const Text('Tutup'),
        ),
      ],
    );
  }

  void clearFilter() {
    doctorC.clear();
    datePatientC.clear();
  }

  void _clearDataPagination() {
    currentPage = 0;
    itemsData.clear();
    isHasReachedMax.value = false;
  }

  void changeDeletedStatus({required String? id, required int index}) {
    idSelected.value = id ?? '';
  }
}
