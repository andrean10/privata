import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/helpers/format_date_time.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/modules/core/main/controllers/main_controller.dart';
import 'package:privata/services/dashboard/dashboard_connect.dart';
import 'package:privata/utils/constants_keys.dart';

enum AppointmentStatus { all, waiting, engaged }

class DashboardController extends GetxController {
  late final InitController _initC;
  late final MainController _mainC;
  late final DashboardConnect _dashboardConn;

  late final String? _hospitalId;
  late final DateTime _dateNow;

  final income = RxnInt();
  final outcome = RxnInt();
  final totalAppointment = RxnInt();
  final waiting = RxnInt();
  final engaged = RxnInt();

  final totalCashierQueue = RxnInt();
  final notPaid = RxnInt();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    } else {
      _initC = Get.put(InitController());
    }

    if (Get.isRegistered<MainController>()) {
      _mainC = Get.find<MainController>();
    }

    _dashboardConn = DashboardConnect(_initC);

    _hospitalId =
        _initC.localStorage.read<String>(ConstantsKeys.hospitalId) ?? '';
    _dateNow = DateTime.now();

    // listen connection internet
    ever(
      _initC.isConnectedInternet,
      (value) {
        if (value) {
          fetchAllData();
        }
      },
    );

    fetchAllData();
  }

  void fetchAllData() async {
    _fetchIncome();
    _fetchOutcome();
    _fetchAppointment(AppointmentStatus.all);
    _fetchAppointment(AppointmentStatus.waiting);
    _fetchAppointment(AppointmentStatus.engaged);
    _fetchCashierQueue(isAll: true);
    _fetchCashierQueue(isAll: false);
  }

  void _fetchIncome() async {
    if (_hospitalId == null) return;

    try {
      final res = await _dashboardConn.income(_hospitalId!);

      if (res.isOk) {
        final response = res.body;

        if (response != null) {
          income.value = response['income'] as int?;
        }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: fetchIncome ${e.toString()}');
    }
  }

  void _fetchOutcome() async {
    if (_hospitalId == null) return;

    try {
      final res = await _dashboardConn.outcome(_hospitalId!);

      if (res.isOk) {
        final response = res.body;

        if (response != null) {
          outcome.value = response['outcome'] as int?;
        }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: fetchOutcome ${e.toString()}');
    }
  }

  void _fetchAppointment(AppointmentStatus status) async {
    if (_hospitalId == null) return;

    final today = FormatDateTime.dateToString(
      newPattern: 'yyyy-MM-dd',
      value: _dateNow.toString(),
    );

    final params = <String, dynamic>{};

    if (status == AppointmentStatus.all) {
      params.addAll({
        'date': today,
        'rumahSakitId': _hospitalId,
        'and': [
          {
            'status': {'neq': 'failed'}
          },
          {
            'status': {'neq': 'canceled'}
          },
          {
            'status': {'neq': 'notresponded'}
          }
        ]
      });
    } else {
      params.addAll({
        'date': today,
        'rumahSakitId': _hospitalId,
        'status': status.name,
      });
    }

    final encodeParams = jsonEncode(params);

    try {
      final res = await _dashboardConn.appointment({'where': encodeParams});

      if (res.isOk) {
        final response = res.body;

        if (response != null) {
          switch (status) {
            case AppointmentStatus.all:
              totalAppointment.value = response['count'] as int?;
              totalAppointment.value ??= 0;

              break;
            case AppointmentStatus.waiting:
              waiting.value = response['count'] as int?;

              break;
            case AppointmentStatus.engaged:
              engaged.value = response['count'] as int?;

              break;
            default:
              _initC.logger.w('warning: status tidak ditemukan');
              break;
          }
        }
      } else {
        _initC.handleError(status: res.status);
      }
    } catch (e) {
      _initC.logger.e('Error: fetchAppointment = ${e.toString()}');
    }
  }

  void _fetchCashierQueue({required bool isAll}) async {
    if (_hospitalId == null) return;

    const patternDate = 'yyyy-MM-dd';

    final today = FormatDateTime.dateToString(
      newPattern: patternDate,
      value: _dateNow.toString(),
    );

    final tommorrow = FormatDateTime.dateToString(
      newPattern: patternDate,
      value: _dateNow.add(const Duration(days: 1)).toString(),
    );

    final params = {
      "hospitalId": _hospitalId,
      "and": [
        {
          "createdAt": {"gte": today}
        },
        {
          "createdAt": {"lt": tommorrow}
        }
      ]
    };

    if (!isAll) {
      params.addAll({
        'status': 'not paid off',
      });
    }

    final encodeParams = jsonEncode(params);

    try {
      final res = await _dashboardConn.cashierQueue({
        'where': encodeParams,
      });

      if (res.isOk) {
        final response = res.body;

        if (response != null) {
          final count = response['count'] as int?;

          if (isAll) {
            totalCashierQueue.value = count ?? 0;
          } else {
            notPaid.value = count ?? 0;
          }
        } else {
          totalCashierQueue.value = 0;
          notPaid.value = 0;
        }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: fetchCashierQueue = ${e.toString()}');
    }
  }

  void moveToPatientRegistration() => _mainC.setDestination(1);

  void moveToCashier() => _mainC.setDestination(3);
}
