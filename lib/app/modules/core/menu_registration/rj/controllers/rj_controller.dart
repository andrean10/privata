import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/data/models/doctor/result/result_doctor_model.dart';
import 'package:privata/app/data/models/rj/item_rj/item_rj_model.dart';
import 'package:privata/app/helpers/format_date_time.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/modules/widgets/buttons/buttons.dart';
import 'package:privata/services/rj/rj_connect.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../services/doctor/doctor_connect.dart';
import '../../../../../../services/status/status_connect.dart';
import '../../../../../../utils/constants_keys.dart';
import '../../../../../data/models/doctor/doctor_model.dart';
import '../../../../../data/models/rj/rj_model.dart';
import '../../../../../data/models/slot/slot_model.dart';
import '../../../../../helpers/helper.dart';
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
  final idSelected = ''.obs;

  final formKeyReschedule = GlobalKey<FormState>();
  final formKeyCancel = GlobalKey<FormState>();

  // FILTER
  final dateFilterC = TextEditingController();

  final selectedDoctorFilter = Rxn<DoctorModel>();
  final selectedDateFilter = Rx(DateTime.now());

  // RESCHEDULE
  final dateRescheduleC = TextEditingController();
  final doctorRescheduleC = TextEditingController();
  final slotRescheduleC = TextEditingController();
  final timeRescheduleC = TextEditingController();
  final durationRescheduleC = TextEditingController();
  final descReasonRescheduleC = TextEditingController();

  final descReasonRescheduleF = FocusNode();

  final selectedDateReschedule = Rx(DateTime.now());
  final selectedIdDoctorReschedule = RxnString();
  final selectedSlotReschedule = Rxn<SlotModel>();
  var selectedTimeReschedule = TimeOfDay.now();
  var maxSlotReschedule = 0;
  final descReasonReschedule = ''.obs;

  // CANCEL
  final reasonCancellationC = TextEditingController();
  final descReasonCancellationC = TextEditingController();

  final descReasonCancellation = ''.obs;

  // DATA
  final itemsData = <ItemRJModel>[];
  // final dataDoctor = <String?>['Loading'].obs;
  final dataDoctor = <DoctorModel?>[];
  final dataSlotDoctor = <SlotModel>[].obs;

  final isFabVisible = true.obs;
  final isSubFabVisible = false.obs;
  final isFilter = false.obs;
  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final isLoadingDoctor = true.obs;
  final isLoadingMoreDoctor = true.obs;
  final isLoadingSlot = false.obs;
  final isHasReachedMax = false.obs;
  final isHasReachedMaxDoctor = false.obs;
  final isLoadingChangeState = false.obs;

  var currentPage = 0;
  var totalPage = 0;
  var totalItem = 0;

  var currentTotalLimitDoctor = 10.obs;

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
    _statusConn = StatusConnect(_initC);

    hospitalId = _initC.localStorage.read<String>(ConstantsKeys.hospitalId);

    _initDate();
    _initTextFieldListener();
    _initListener();
    _initFetch();
  }

  void _initDate() {
    final now = DateTime.now();
    dateFilterC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: now.toString(),
    );

    dateRescheduleC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: now.toString(),
    );
  }

  void _initTextFieldListener() {
    //* RESCHEDULE
    descReasonRescheduleC.addListener(_setDescReasonReschedule);

    //* CANCEL
    descReasonCancellationC.addListener(_setDescReasonCancellation);

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

  void _initListener() {
    // listen date filter for clear list data pagination rj view
    ever(
      selectedDateFilter,
      (_) => _clearDataPagination(),
    );

    // listen connected internet
    debounce(
      _initC.isConnectedInternet,
      (value) {
        if (value) fetchDataPatient();
      },
    );

    // listen fetch each load more doctor pagination
    debounce(currentTotalLimitDoctor, fetchDoctor);

    // listen doctor for enabled slot time field
    debounce(
      selectedIdDoctorReschedule,
      (id) {
        if (id != null) {
          slotRescheduleC.clear();
          selectedSlotReschedule.value = null;
          dataSlotDoctor.clear();
          isLoadingSlot.value = true;
          fetchDataPractice(id);
        }
      },
    );

    // listen slot for enabled time and max duration field
    debounce(
      selectedSlotReschedule,
      (value) {
        if (value != null) {
          timeRescheduleC.clear();
          durationRescheduleC.clear();
        }
      },
    );
  }

  void _initFetch() {
    fetchDataPatient();
    fetchDoctor(currentTotalLimitDoctor.value);
  }

  void _setDescReasonReschedule() =>
      descReasonReschedule.value = descReasonRescheduleC.text;

  void _setDescReasonCancellation() =>
      descReasonCancellation.value = descReasonCancellationC.text;

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
    }

    if (notification is ScrollStartNotification) {
      isFabVisible.value = false;
    } else if (notification is ScrollEndNotification) {
      isFabVisible.value = true;
    }

    return true;
  }

  void changedVisibleSubFab() => isSubFabVisible.toggle();

  void onChangedDoctor(DoctorModel? value) =>
      selectedDoctorFilter.value = value;

  void onChangedStatus({
    required int index,
    required String id,
    required String? status,
  }) {
    isLoadingChangeState.value = true;
    idSelected.value = id;

    _setStatus(
      index: index,
      id: id,
      status: status ?? '',
    );
  }

  void _setStatus({
    required int index,
    required String id,
    required String status,
  }) async {
    try {
      final query = <String, dynamic>{'id': id};

      if (status == 'engaged') {
        query['isGenerateMr'] = true;
      } else if (status == 'reschedule') {
        if (!formKeyReschedule.currentState!.validate()) {
          return;
        }

        FocusScope.of(Get.context!).unfocus();

        final date = FormatDateTime.dateToString(
          newPattern: 'yyyy-MM-dd',
          value: selectedDateReschedule.value.toString(),
        );
        final estimateTime = FormatDateTime.timeToString(
          newPattern: 'HH:mm',
          value: selectedTimeReschedule,
        );

        query.addAll({
          'date': date,
          'practiceId': selectedIdDoctorReschedule.value,
          'estimateTime': estimateTime,
          'consultPlanDuration': durationRescheduleC.text,
          'reason': descReasonRescheduleC.text,
        });
      } else if (status == 'delete') {
        if (!formKeyCancel.currentState!.validate()) {
          return;
        }

        FocusScope.of(Get.context!).unfocus();

        query.addAll({
          // 'id': id,
          'failedReason': descReasonCancellationC.text,
          'failedSubject': 'failed by patient mistake',
          'message': 'Janji antara dokter dan pasien ini dibatalkan'
        });
      }

      final res = switch (status) {
        'succeed' => await _statusConn.succeed(query),
        'pending' => await _statusConn.pending(query),
        'confirmed' => await _statusConn.confirmedV2(query),
        'reschedule' => await _statusConn.rescheduleV2(query),
        'engaged' => await _statusConn.engage(query),
        'waiting' => await _statusConn.waiting(query),
        'delete' => await _statusConn.reject(query),
        _ => await Future.value(
            const Response(
              statusCode: 404,
              statusText: 'Tidak ditemukan',
            ),
          )
      };

      if (res.isOk) {
        switch (status) {
          case 'succeed':
            final updateItem = itemsData[index].copyWith(status: status);
            itemsData[index] = updateItem;
            break;
          case 'pending':
            final updateItem = itemsData[index].copyWith(
              status: 'booked',
              confirmed: false,
            );
            itemsData[index] = updateItem;
            break;
          case 'reschedule':
            final isSameDate = selectedDateFilter.value.day ==
                selectedDateReschedule.value.day;

            if (isSameDate) {
              final formatEstimateTime =
                  FormatDateTime.convertTimeToInt(timeRescheduleC.text);

              print('debug: formatEstimateTime = $formatEstimateTime');

              final updateItem = itemsData[index].copyWith(
                consultPlanDuration: durationRescheduleC.text,
                estimateTime: formatEstimateTime,
                doctorName: doctorRescheduleC.text,
              );
              itemsData[index] = updateItem;
            } else {
              itemsData.removeAt(index);
            }

            Get.back(result: true);
            break;
          case 'engaged':
            final updateItem = itemsData[index].copyWith(status: status);
            itemsData[index] = updateItem;
            break;
          case 'confirmed':
            final updateItem = itemsData[index].copyWith(
              status: 'booked',
              confirmed: true,
            );
            itemsData[index] = updateItem;
            break;
          case 'waiting':
            final updateItem = itemsData[index].copyWith(status: status);
            itemsData[index] = updateItem;
            break;
          case 'delete':
            itemsData.removeAt(index);
            break;
        }

        change(itemsData, status: RxStatus.success());

        Snackbar.success(
          context: Get.context!,
          content: 'Berhasil mengubah status pasien ke $status',
        );
      } else {
        Snackbar.failed(
          context: Get.context!,
          content: 'Gagal mengubah status pasien',
        );
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
      Snackbar.failed(
        context: Get.context!,
        content: 'Terjadi kesalahan saat mengubah status pasien',
      );
    }

    isLoadingChangeState.value = false;
    idSelected.value = '';
  }

  void setDateFilter(DateTime value) {
    dateFilterC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: value.toString(),
    );
    selectedDateFilter.value = value;
  }

  void setDoctorReschedule({required String? id, required String? value}) {
    selectedIdDoctorReschedule.value = id;
    doctorRescheduleC.text = value ?? '';
  }

  void setDateReschedule(DateTime value) {
    dateRescheduleC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: value.toString(),
    );
    selectedDateReschedule.value = value;
  }

  void setSlotReschedule(SlotModel? item) {
    if (item != null) {
      final time = formatSlotTime(item);
      slotRescheduleC.text = time;
      selectedSlotReschedule.value = item;
      maxSlotReschedule = item.maxDuration ?? 0;
    }
  }

  void setTimeReschedule(TimeOfDay value) {
    timeRescheduleC.text = FormatDateTime.timeToString(
      newPattern: 'HH:mm',
      value: value,
    );
    selectedTimeReschedule = value;
  }

  Future<List<DoctorModel>> fetchNewDoctor(
    String filter,
    // LoadProps? props,
  ) async {
    try {
      final filterData = {"rumahSakitId": hospitalId};

      final query = {
        'filter_data': jsonEncode(filterData),
        // 'total': '50',
      };

      final res = await _doctorConn.getDoctor(query);

      if (res.isOk) {
        final body = res.body;
        final response = ResultDoctorModel.fromJson(body);
        final itemsDoctor = response.items;

        if (itemsDoctor.isNotEmpty) {
          return itemsDoctor;
        }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
      dataDoctor.clear();
    } finally {
      isLoadingDoctor.value = false;
      isLoadingMoreDoctor.value = false;
    }

    return [];
  }

  void fetchDoctor(int totalLimit) async {
    try {
      final filterData = {"rumahSakitId": hospitalId};

      final query = {
        'filter_data': jsonEncode(filterData),
        // 'total': '$totalLimit',
      };

      final res = await _doctorConn.getDoctor(query);

      if (res.isOk) {
        final body = res.body;
        final response = ResultDoctorModel.fromJson(body);
        final itemsDoctor = response.items;

        if (dataDoctor.isNotEmpty) {
          for (var element in itemsDoctor) {
            dataDoctor.addIf(
              !dataDoctor.contains(element),
              element,
            );
          }
        } else {
          dataDoctor.addAllIf(
            response.totalItem != 0,
            itemsDoctor,
          );
        }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
      dataDoctor.clear();
    } finally {
      isLoadingDoctor.value = false;
      isLoadingMoreDoctor.value = false;
    }
  }

  void fetchDataPatient({bool isRefresh = false}) async {
    const pattern = 'yyyy-MM-dd';

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
          value: selectedDateFilter.value.toString(),
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
          // 'sort': 'date ASC'
        };

        final res = await _patientRegistConn.getList(query);
        final body = res.body;

        if (res.isOk) {
          if (body is Map<String, dynamic>) {
            final data = RJModel.fromJson(body);
            itemsData.addAll(data.items);

            totalPage = data.totalPage ?? 0;
            totalItem = data.totalItem ?? 0;

            //* jika total item nya kosong maka tampilkan halaman data kosong silahkan cari filter yang lain
            change(
              itemsData,
              status: (itemsData.isNotEmpty)
                  ? RxStatus.success()
                  : RxStatus.empty(),
              // status: RxStatus.success(),
            );
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          if (!_initC.isConnectedInternet.value) {
            change(
              null,
              status: RxStatus.error('Data tidak ditemukan'),
            );
          }
          _initC.handleError(status: res.status);
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: $e');
        change(null, status: RxStatus.error(e.message));
      }
    }

    isLoadingMore.value = false;
  }

  Future<void> fetchDataPatientByFilter() async {
    totalPage = 0;
    totalItem = 0;

    if (hospitalId != null && selectedDoctorFilter.value != null) {
      final query = {
        'practiceId': selectedDoctorFilter.value!.id,
        'rumahSakitId': hospitalId!,
        'date': FormatDateTime.dateToString(
          newPattern: 'yyyy-MM-dd',
          value: selectedDateFilter.value.toString(),
        ),
      };

      try {
        final res = await _patientRegistConn.getListByDoctor(query);
        final body = res.body;

        if (res.isOk) {
          if (body != null && body is List<dynamic> && body.isNotEmpty) {
            final rj = body.firstOrNull;

            final data = RJModel.fromJson(rj);
            itemsData.addAll(data.items);

            totalPage = data.totalPage ?? 0;
            totalItem = data.totalItem ?? 0;

            //* jika total item nya kosong maka tampilkan halaman data kosong silahkan cari filter yang lain
            change(
              itemsData,
              status: (itemsData.isNotEmpty)
                  ? RxStatus.success()
                  : RxStatus.empty(),
            );
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          if (!_initC.isConnectedInternet.value) {
            change(
              null,
              status: RxStatus.error('Data tidak ditemukan'),
            );
          }
          _initC.handleError(status: res.status);
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: $e');
        change(null, status: RxStatus.error(e.message));
      }
    }
  }

  void fetchDataPractice(String id) async {
    try {
      final date = FormatDateTime.dateToString(
        newPattern: 'yyyy-MM-dd',
        value: selectedDateReschedule.value.toString(),
      );

      final params = {
        'practiceId': id,
        'date': date,
      };

      final query = {
        'filter': jsonEncode(params),
      };

      final res = await _patientRegistConn.getPracticeAvailable(query);

      if (res.isOk) {
        final body = res.body;

        if (body is List<dynamic>) {
          final data = body.map((e) => SlotModel.fromJson(e));
          dataSlotDoctor.addAll(data);
        }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isLoadingSlot.value = false;
    }
  }

  void moveToSearchPatientOrAddDoctor(BuildContext context) async {
    isSubFabVisible.value = false;

    if (dataDoctor.isNotEmpty) {
      final state = await Get.toNamed(Routes.SEARCH_PATIENT);
      if (state != null) {
        if (state) {
          _clearDataPagination();
          fetchDataPatient();
        }
      }
    } else {
      final state = await Dialogs.alert(
        context: context,
        title: 'Perhatian',
        content: const Text(
          'Dokter tidak tersedia, apakah anda ingin menambahkan dokter?',
        ),
        textYes: 'Tambah',
        textNo: 'Batal',
      );

      // eksekusi state disini
      if (state != null && state) {
        Get.toNamed(Routes.ADD_DOCTOR);
      }
    }
  }

  void moveToNewPatient() {
    isSubFabVisible.value = false;
    Get.toNamed(Routes.NEW_PATIENT);
  }

  void moveToTimeline<T>(T args) => Get.toNamed(
        Routes.TIMELINE_EMR,
        arguments: args,
      );

  void moveToEMR({
    required int index,
    required ItemRJModel? itemRJ,
  }) async {
    if (itemRJ != null) {
      final state = await Get.toNamed(Routes.EMR, arguments: itemRJ);

      if (state != null) {
        if (state) {
          final updateItem = itemRJ.copyWith.call(status: 'succeed');
          itemsData[index] = updateItem;
        }
      }
    } else {
      Snackbar.failed(
        context: Get.context!,
        content:
            'Sepertinya ada kesalahan, tidak bisa membuka detail EMR, cek koneksi internet anda dan coba lagi',
      );
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

  // void makeToNurseNotes() => showDialogNextFeatures();

  // void makeToVitalSign() => showDialogNextFeatures();

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

  String formatSlotTime(SlotModel item) {
    final startTime = FormatDateTime.time(value: item.start);
    final endTime = FormatDateTime.time(value: item.end);
    return '$startTime - $endTime WIB';
  }

  void clearFilter() {
    final now = DateTime.now();
    dateFilterC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: now.toString(),
    );
    selectedDoctorFilter.value = null;
  }

  void _clearDataPagination() {
    currentPage = 0;
    itemsData.clear();
    isHasReachedMax.value = false;
  }

  void clearRescheduleAppointment() {
    // reset and clear
    final now = DateTime.now();
    selectedDateReschedule.value = now;
    dateRescheduleC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: now.toString(),
    );
    doctorRescheduleC.clear();
    selectedIdDoctorReschedule.value = null;
    slotRescheduleC.clear();
    selectedSlotReschedule.value = null;
    timeRescheduleC.clear();
    selectedTimeReschedule = TimeOfDay.now();
    durationRescheduleC.clear();
    descReasonRescheduleC.clear();
    descReasonReschedule.value = '';
  }

  void clearDeleteAppointment() {
    reasonCancellationC.clear();
    descReasonCancellationC.clear();
    descReasonCancellation.value = '';
  }
}
