import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../../../services/cashier/cashier_connect.dart';
import '../../../../../../utils/constants_keys.dart';
import '../../../../../data/models/cashier/cashier_model.dart';
import '../../../../../helpers/format_date_time.dart';
import '../../../../../helpers/helper.dart';
import '../../../../../routes/app_pages.dart';

class CashierController extends GetxController
    with StateMixin<List<CashierModel>> {
  late final InitController _initC;

  late final CashierConnect _cashierConn;

  late final String? hospitalId;

  // controller
  final startDateC = TextEditingController();
  final endDateC = TextEditingController();

  // focusnode
  final startDateF = FocusNode();
  final endDateF = FocusNode();

  final isFilter = false.obs;
  final isLoading = false.obs;
  final isFabVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _cashierConn = CashierConnect(_initC);

    hospitalId = _initC.localStorage.read<String>(ConstantsKeys.hospitalId);

    _initText();
    _initFetch();
  }

  void _initText() {
    final now = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: DateTime.now().toString(),
    );

    startDateC.text = now;
    endDateC.text = now;
  }

  void _initFetch() {
    fetchCashier();
  }

  void setDate(DateTime value, bool isStartDate) {
    final formatDate = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: value.toString(),
    );

    if (isStartDate) {
      startDateC.text = formatDate;
    } else {
      endDateC.text = formatDate;
    }
  }

  void fetchCashier({bool isFilter = false}) async {
    const oldPattern = 'dd MMMM yyyy';
    const newPattern = 'yyyy-MM-dd';

    change(null, status: RxStatus.loading());

    if (isFilter) {
      isLoading.value = true;
    }

    if (hospitalId != null) {
      final query = {
        'hospitalId': hospitalId,
        'dateStart': FormatDateTime.dateToString(
          oldPattern: oldPattern,
          newPattern: newPattern,
          value: startDateC.text,
        ),
        'dateEnd': FormatDateTime.dateToString(
          oldPattern: oldPattern,
          newPattern: newPattern,
          value: endDateC.text,
        ),
        'keyword': '',
        'skip': '0',
        'limit': '100',
        'status': jsonEncode(['paid off', 'not paid off']),
      };

      try {
        final res = await _cashierConn.getList(query);
        final body = res.body;

        if (res.isOk) {
          if (body != null && body is List<dynamic>) {
            final data = body.map((e) => CashierModel.fromJson(e)).toList();
            change(data, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        } else {
          _initC.handleError(status: res.status);
          change(null, status: RxStatus.error());
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: $e');
        change(null, status: RxStatus.error(e.message));
      } finally {
        isLoading.value = false;
        Get.back();
      }
    }
  }

  void moveToPage(bool state) {
    if (state) {
    } else {
      Get.toNamed(Routes.TRANSACTION);
    }
  }

  bool onNotification(ScrollNotification notification) {
    if (notification is ScrollStartNotification) {
      isFabVisible.value = false;
    } else if (notification is ScrollEndNotification) {
      isFabVisible.value = true;
    }
    return true;
  }
}
