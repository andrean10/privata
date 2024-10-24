import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../data/db/drugs/drugs_model.dart';
import '../../../../../data/db/user/users_model.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../init/controllers/init_controller.dart';

class TransactionController extends GetxController {
  late final InitController _initC;

  final itemPrice = RxNum(0);
  final totalPrice = RxNum(0);

  final resultSearch = <DrugsModel>[].obs;
  final listItemChoice = <DrugsModel>[].obs;

  final searchC = TextEditingController();
  final unitC = TextEditingController();

  final search = ''.obs;
  final unit = ''.obs;
  final patient = Rxn<UsersModel>();

  final isLoading = false.obs;

  final obat = [
    DrugsModel(
      name: 'MYONAL TAB 50 MG',
      price: 7500,
      unit: 'tab',
      stock: 87,
    ),
    DrugsModel(
      name: 'NEW TONIKUM BAYER LIQ 100 ML',
      price: 273,
      unit: 'botol',
      stock: 30,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _init();

    debounce(
      search,
      (filter) => fetchData(filter),
    );

    ever(
      listItemChoice,
      (value) => calculateTotalPrice(value),
    );
  }

  void calculateTotalPrice(List<DrugsModel> value) {
    totalPrice.value = 0;

    for (var element in value) {
      totalPrice.value += (element.amountUnit ?? 0) * element.price;
    }
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _initTextController();
  }

  void _initTextController() {
    searchC.addListener(_setSearch);
  }

  void _setSearch() => search.value = searchC.text;

  void onChanged(String value, num price) {
    if (value.isNotEmpty && value.isNumericOnly) {
      itemPrice.value = num.parse(value) * price;
      unit.value = value;
    } else {
      itemPrice.value = 0;
      unit.value = value;
    }
  }

  Future<void> fetchData(String filter) async {
    isLoading.value = true;

    try {
      if (filter.isNotEmpty) {
        await Future.delayed(1.seconds);
        final filterDrugs = obat
            .where(
              (element) => element.name.toLowerCase().contains(
                    filter.toLowerCase(),
                  ),
            )
            .toList();

        resultSearch.clear();
        resultSearch.addAll(filterDrugs);
        await Future.delayed(Duration.zero);
      } else {
        resultSearch.clear();
      }
    } catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void addItem(DrugsModel product) {
    final newProduct = product.copyWith(
      amountUnit: num.parse(unit.value),
    );

    listItemChoice.add(newProduct);
    clearUnit();
  }

  void updateitem({required int index, required DrugsModel product}) {
    final newProduct = product.copyWith(
      amountUnit: num.parse(unit.value),
    );

    listItemChoice[index] = newProduct;
    clearUnit();
  }

  void clearUnit() {
    unitC.clear();
    unit.value = '';
    itemPrice.value = 0;
    searchC.clear();
  }

  void removeItem(int index) => listItemChoice.removeAt(index);

  void moveToSearchPatient() async {
    Get.toNamed(Routes.SEARCH_PATIENT)?.then(
      (value) {
        if (value != null) {
          patient.value = value as UsersModel;
        }
      },
    );
  }
}
