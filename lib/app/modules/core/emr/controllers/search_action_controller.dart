import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../../services/search/search_connect.dart';
import '../../../../../utils/constants_keys.dart';
import '../../../../data/db/item/item_model.dart';
import '../../../../data/models/procedure/procedure_model.dart';
import '../../../../helpers/helper.dart';

enum SearchType { procedure, drugs }

class SearchActionController extends GetxController {
  // with GetTickerProviderStateMixin {
  late final InitController _initC;
  late final SearchConnect _searchConn;
  String? hospitalId;

  late SearchType type;

  // late final animC;

  final searchC = TextEditingController();

  final search = ''.obs;

  final resultProcedures = <ProcedureModel>[].obs;
  final totalAmount = 0.obs;

  // final listAction = <ItemModel>[].obs;
  // final listDrugs = <ItemModel>[].obs;

  var title = '';

  final dataAction = [
    ItemModel(
      title: 'Operasi Cesar',
      price: 15000,
    ),
    ItemModel(
      title: 'Amputasi',
      price: 100000,
    ),
    ItemModel(
      title: 'Pembersihan Kulit',
      price: 30000,
    ),
  ];

  final dataDrugs = [
    ItemModel(
      title: 'Paramex',
      price: 8000,
    ),
    ItemModel(
      title: 'Minoxidil',
      price: 10000,
    ),
    ItemModel(
      title: 'Paracetamol',
      price: 12000,
    ),
  ];

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

    hospitalId = _initC.localStorage.read(ConstantsKeys.hospitalId);

    final map = Get.arguments as Map<String, dynamic>;
    type = map['type'] as SearchType;

    if (type == SearchType.procedure) {
      title = 'Tindakan';
      resultProcedures.value = map['data'] as List<ProcedureModel>? ?? [];
      _countTotalAmount(resultProcedures);
    } else if (type == SearchType.drugs) {
      title = 'Obat';
    }

    _initTextC();
    _initWorker();
  }

  void _initTextC() {
    searchC.addListener(() => search.value = searchC.text);
  }

  void _initWorker() {
    // debounce(search, searchProcedure);
  }

  void addProcedure(ProcedureModel item) {
    resultProcedures.add(item);
    _countTotalAmount(resultProcedures);
  }

  void deleteProcedure(int index) {
    resultProcedures.removeAt(index);

    _countTotalAmount(resultProcedures);
  }

  void _countTotalAmount(RxList<ProcedureModel> value) {
    totalAmount.value = 0;

    for (var element in value) {
      totalAmount.value += element.basicFee ?? 0;
    }
  }

  // Future<List<ItemModel>> getData(String? filter) async {
  //   try {
  //     if (filter != null && filter.isNotEmpty) {
  //       await Future.delayed(1.seconds);

  //       if (type == SearchType.procedure) {
  //         final data = dataAction
  //             .where(
  //               (item) =>
  //                   item.title.toLowerCase().contains(filter.toLowerCase()),
  //             )
  //             .toList();

  //         return data;
  //       }

  //       if (type == SearchType.drugs) {
  //         final data = dataDrugs
  //             .where(
  //               (item) =>
  //                   item.title.toLowerCase().contains(filter.toLowerCase()),
  //             )
  //             .toList();

  //         return data;
  //       }
  //     }
  //   } catch (e) {
  //     _initC.logger.e('Error: $e');
  //   }

  //   return [];
  // }

  // void addItem(ItemModel data) {
  //   if (type == SearchType.action) {
  //     listAction.add(data);
  //   }

  //   if (type == SearchType.drugs) {
  //     listDrugs.add(data);
  //   }
  // }

  Future<List<ProcedureModel>> searchProcedure(String query) async {
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
          final procedureModel =
              body.map((e) => ProcedureModel.fromJson(e)).toList();

          Helper.printPrettyJson(body);

          return procedureModel;
        }

        return [];

        // if (body != null && body is List<dynamic>) {

        // }
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    }

    return [];
  }

  void saveProcedures() => Get.back(result: resultProcedures.value);
}
