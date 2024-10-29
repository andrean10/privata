import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/data/models/detail_rj/detail_rj_model.dart';
import 'package:privata/app/data/models/detail_rj/procedure/procedure_model.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../../services/search/search_connect.dart';
import '../../../../../services/timeline/emr_connect.dart';
import '../../../../../utils/constants_keys.dart';
import '../../../../data/models/detail_rj/procedure/item_procedure/item_procedure_model.dart';

import '../../../../helpers/helper.dart';
import '../../../widgets/snackbar/snackbar.dart';

class SearchProcedureController extends GetxController {
  late final InitController _initC;
  late final SearchConnect _searchConn;
  late final EMRConnect _emrConn;

  String? hospitalId;
  String? userId;
  String? name;

  late DetailRJModel? detailEMR;

  final searchC = TextEditingController();

  final searchF = FocusNode();

  final search = ''.obs;

  final listProcedures = <ItemProcedureModel>[].obs;

  final selectedProcedures = <ItemProcedureModel>[].obs;

  final totalAmount = 0.obs;

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

    _searchConn = SearchConnect(_initC);
    _emrConn = EMRConnect(_initC);

    hospitalId = _initC.localStorage.read(ConstantsKeys.hospitalId);
    userId = _initC.localStorage.read(ConstantsKeys.createdId);
    name = _initC.localStorage.read(ConstantsKeys.createdName);

    final map = Get.arguments as Map<String, dynamic>;
    detailEMR = map['detailData'] as DetailRJModel?;

    _countTotalAmount(selectedProcedures);

    _initTextC();
    _initWorker();
  }

  void _initTextC() {
    searchC.addListener(() => search.value = searchC.text);
  }

  void _initWorker() {
    // debounce(search, searchProcedures);
  }

  void addProcedure(ItemProcedureModel item) {
    selectedProcedures.add(item);
    _countTotalAmount(selectedProcedures);
  }

  void deleteProcedure(int index) {
    selectedProcedures.removeAt(index);
    _countTotalAmount(selectedProcedures);
  }

  void _countTotalAmount(RxList<ItemProcedureModel> value) {
    totalAmount.value = 0;

    for (var element in value) {
      totalAmount.value += element.basicFee ?? 0;
    }
  }

  void fetchProcedures(String query) async {
    try {
      final filter = {
        "where": {
          "hospitalId": hospitalId,
          "or": [
            {
              "poliId": {"eq": null}
            },
            {"poliId.nmPoli": "Umum"}
          ],
          "name": {"like": query, "options": "i"}
        }
      };

      final res = await _searchConn.searchProcedures(jsonEncode(filter));

      if (res.isOk) {
        final body = res.body;

        if (body != null && body is List<dynamic>) {
          final procedureModel = body
              .map(
                (e) => ItemProcedureModel.fromJson(e),
              )
              .toList();

          listProcedures.clear();
          listProcedures.addAll(procedureModel);
        }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    }
  }

  void selectedItem(SearchFieldListItem<ItemProcedureModel> item) {
    final itemProcedure = item.item;

    if (itemProcedure != null) {
      addProcedure(itemProcedure);
    }
  }

  List<SearchFieldListItem<ItemProcedureModel>>? filterProcedures(
      String filter) {
    final filterData = listProcedures
        .where(
          (item) =>
              item.name?.toLowerCase().contains(filter.toLowerCase()) ?? false,
        )
        .toList();

    return filterData
        .map(
          (e) => SearchFieldListItem(
            e.name ?? '',
            child: Text(e.name ?? ''),
            item: e,
          ),
        )
        .toList();
  }

  void saveProcedures() async {
    isLoading.value = true;
    final now = DateTime.now();

    final body = selectedProcedures.map(
      (element) {
        return {
          "mrNo": detailEMR?.mrNo,
          "hospitalId": hospitalId,
          "patientId": detailEMR?.patientId,
          "createdName": name,
          "createdId": userId,
          "practiceId": detailEMR?.practiceId,
          "appointId": detailEMR?.appointId,
          "mrId": detailEMR?.id,
          "createdAt": now.toUtc().toString(),
          "procedureName": element.name,
          "itemsUsed": [],
          "basicFee": element.basicFee,
          "procedureId": element.id,
          "discountFee": '',
          "notes": '',
          "isPriceLock": element.isPriceLock,
          "totalFee": element.totalFee,
          "isDb": true,
        };
      },
    ).toList();

    try {
      final res = await _emrConn.saveProcedures(body);

      Helper.printPrettyJson(res.body);

      if (res.isOk) {
        final body = res.body;

        if (body is Map<String, dynamic>) {
          final listProcedure = body['procedure'] as List<dynamic>;
          if (body['procedure'] is List<dynamic>) {
            final procedures = listProcedure
                .map(
                  (e) => ProcedureModel.fromJson(e),
                )
                .toList();

            Helper.printPrettyJson(procedures);
            Get.back(result: procedures);
          }

          Snackbar.success(
            context: Get.context!,
            content: 'Tindakan berhasil disimpan',
          );
        }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
