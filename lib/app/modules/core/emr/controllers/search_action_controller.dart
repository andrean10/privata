import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../data/models/item/item_model.dart';

enum SearchType { action, drugs }

class SearchActionController extends GetxController
    with GetTickerProviderStateMixin {
  late final InitController _initC;
  late SearchType type;

  late final animC;

  final searchC = TextEditingController();

  final search = RxnString();

  final listAction = <ItemModel>[].obs;
  final listDrugs = <ItemModel>[].obs;

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

    animC = AnimationController(vsync: this);

    type = Get.arguments as SearchType;

    if (type == SearchType.action) {
      title = 'Tindakan';
    } else if (type == SearchType.drugs) {
      title = 'Obat';
    }

    _initTextC();
  }

  void _initTextC() {
    searchC.addListener(setSearch);
  }

  void setSearch() => search.value = searchC.text;

  Future<List<ItemModel>> getData(String? filter) async {
    _initC.logger.d('debug: filter = $filter');

    try {
      if (filter != null && filter.isNotEmpty) {
        await Future.delayed(1.seconds);

        if (type == SearchType.action) {
          final data = dataAction
              .where(
                (item) =>
                    item.title.toLowerCase().contains(filter.toLowerCase()),
              )
              .toList();

          return data;
        }

        if (type == SearchType.drugs) {
          final data = dataDrugs
              .where(
                (item) =>
                    item.title.toLowerCase().contains(filter.toLowerCase()),
              )
              .toList();

          return data;
        }
      }
    } catch (e) {
      _initC.logger.e('Error: $e');
    }

    return [];
  }

  void addItem(ItemModel data) {
    if (type == SearchType.action) {
      listAction.add(data);
    }

    if (type == SearchType.drugs) {
      listDrugs.add(data);
    }
  }

  void backToEMR() => Get.back();
}
