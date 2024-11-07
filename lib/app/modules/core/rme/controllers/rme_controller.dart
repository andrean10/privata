import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/modules/core/menu_registration/search_patient/controllers/search_patient_controller.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../../services/rj/rj_connect.dart';
import '../../../../../services/status/status_connect.dart';
import '../../../../../utils/constants_keys.dart';
import '../../../../data/models/rj/item_rj/item_rj_model.dart';
import '../../../../data/models/rj/rj_model.dart';
import '../../../../data/models/slot/slot_model.dart';
import '../../../../helpers/format_date_time.dart';
import '../../../../routes/app_pages.dart';
import '../../../widgets/snackbar/snackbar.dart';

class RmeController extends GetxController with GetTickerProviderStateMixin {
  late final InitController _initC;
  late final RJConnect _rjConn;
  late final StatusConnect _statusConn;

  late final TabController tabC;
  final searchC = TextEditingController();

  late final String? hospitalId;
  final idSelected = ''.obs;

  final formKeyReschedule = GlobalKey<FormState>();
  final formKeyCancel = GlobalKey<FormState>();

  // RESCHEDULE - CONTROLLER
  final dateRescheduleC = TextEditingController();
  final doctorRescheduleC = TextEditingController();
  final slotRescheduleC = TextEditingController();
  final timeRescheduleC = TextEditingController();
  final durationRescheduleC = TextEditingController();
  final descReasonRescheduleC = TextEditingController();
  // RESCHEDULE - FOCUS NODE
  final descReasonRescheduleF = FocusNode();

  final search = RxnString();

  final status = RxnString();

  final listTab = ['Hari Ini', 'Semua'];

  final todayAppointment = RxList<ItemRJModel>();

  final dataPasien = ['Andre', 'Sabda', 'Azis'];

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

  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final isLoadingSearch = false.obs;
  final isHasReachedMax = false.obs;
  final isLoadingChangeState = false.obs;

  var currentPage = 0;
  var totalPage = 0;
  var totalItem = 0;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    if (!Get.isRegistered<SearchPatientController>()) {
      Get.put(SearchPatientController());
    }

    tabC = TabController(length: 2, vsync: this);

    _rjConn = RJConnect(_initC);
    _statusConn = StatusConnect(_initC);

    hospitalId = _initC.localStorage.read<String>(ConstantsKeys.hospitalId);

    _initTextC();
    // initFetch();

    // listen connected internet
    debounce(
      _initC.isConnectedInternet,
      (value) {
        if (value) fetchDataPatient();
      },
    );
  }

  void _initTextC() {
    searchC.addListener(setSearch);
  }

  void initFetch() {
    fetchDataPatient();
  }

  bool onNotification(ScrollNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      if (!isLoadingMore.value &&
          currentPage < totalPage &&
          totalItem != todayAppointment.length) {
        isLoadingMore.value = true;
        currentPage++;

        fetchDataPatient();

        // _initC.logger.d('debug: after currentPage = $currentPage');
      } else if (totalItem == todayAppointment.length && !isLoadingMore.value) {
        isHasReachedMax.value = true;
      }
    }

    return true;
  }

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
            final updateItem = todayAppointment[index].copyWith(status: status);
            todayAppointment[index] = updateItem;
            break;
          case 'pending':
            final updateItem = todayAppointment[index].copyWith(
              status: 'booked',
              confirmed: false,
            );
            todayAppointment[index] = updateItem;
            break;
          case 'reschedule':
            todayAppointment.removeAt(index);

            Get.back(result: true);
            break;
          case 'engaged':
            final updateItem = todayAppointment[index].copyWith(status: status);
            todayAppointment[index] = updateItem;
            break;
          case 'confirmed':
            final updateItem = todayAppointment[index].copyWith(
              status: 'booked',
              confirmed: true,
            );
            todayAppointment[index] = updateItem;
            break;
          case 'waiting':
            final updateItem = todayAppointment[index].copyWith(status: status);
            todayAppointment[index] = updateItem;
            break;
          case 'delete':
            todayAppointment.removeAt(index);
            break;
        }

        // change(todayAppointment, status: RxStatus.success());

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

  void setSearch() => search.value = searchC.text;

  void fetchDataPatient({bool isRefresh = false}) async {
    const pattern = 'yyyy-MM-dd';

    //* jika item belum ada data atau user mengubah filter maka tampilkan loading dan set currentpage ke 0
    if (todayAppointment.isEmpty) {
      currentPage = 0;
      isLoading.value = true;
    }

    if (isRefresh) {
      todayAppointment.clear();
      currentPage = 0;
      isLoading.value = true;
    }

    if (hospitalId != null && (isLoading.value || isLoadingMore.value)) {
      try {
        final date = FormatDateTime.dateToString(
          newPattern: pattern,
          value: DateTime.now().toString(),
        );

        final params = {
          'rumahSakitId': hospitalId,
          'date': date,
          'sendall': true,
          'isMobile': true,
          "or": [
            {"status": "booked"},
            {"status": "succeed"},
            {"status": "waiting"},
            {"status": "engaged"}
          ]
        };

        final query = {
          'filter_data': jsonEncode(params),
          'page': '$currentPage',
          'total': '10',
          'sort': 'createdAt ASC'
        };

        final res = await _rjConn.getList(query);

        if (res.isOk) {
          final body = res.body;

          if (body is Map<String, dynamic>) {
            final data = RJModel.fromJson(body);
            todayAppointment.addAll(data.items);

            totalPage = data.totalPage ?? 0;
            totalItem = data.totalItem ?? 0;
          }
        } else {
          _initC.handleError(status: res.status);
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: $e');
      }
    }
  }

  Future<List<String>> getData(String? filter) async {
    try {
      if (filter != null && filter.isNotEmpty) {
        await Future.delayed(3.seconds);
        return dataPasien
            .where(
              (element) => element.toLowerCase().contains(filter.toLowerCase()),
            )
            .toList();
      }
    } catch (e) {
      _initC.logger.e('Error: $e');
    }

    return [];
  }

  void moveToTimeline<T>(T args) => Get.toNamed(
        Routes.TIMELINE_EMR,
        arguments: args,
      );

  void moveToEMR(ItemRJModel? data) {
    if (data != null) {
      Get.toNamed(Routes.EMR, arguments: data);
    } else {
      Get.toNamed(Routes.EMR);
    }
  }

  void moveToTimelineEMR() => Get.toNamed(Routes.TIMELINE_EMR);

  void clearSearch() {
    searchC.clear();
    search.value = null;
  }

  void _clearDataPagination() {
    currentPage = 0;
    todayAppointment.clear();
    isHasReachedMax.value = false;
  }
}
