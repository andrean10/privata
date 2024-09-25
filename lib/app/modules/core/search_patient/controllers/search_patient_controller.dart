import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../data/models/user/users_model.dart';

class SearchPatientController extends GetxController
    with StateMixin<List<UsersModel>?> {
  late final InitController _initC;

  final searchC = TextEditingController();

  final search = ''.obs;

  final resultSearch = <UsersModel>[].obs;

  final dataPatient = [
    UsersModel(
      name: 'Anton Nugroho',
      idEMR: 'EMR123129',
      birthDate: DateTime(1995, 12, 31),
      numberPhone: '0822123456789',
    ),
    UsersModel(
      name: 'Sabda Setiawan',
      idEMR: 'EMR213321',
      birthDate: DateTime(1992, 10, 08),
      numberPhone: '082213728178',
    ),
    UsersModel(
      name: 'Budi Sudarsono',
      idEMR: 'EMR213321',
      birthDate: DateTime(1985, 05, 12),
      numberPhone: '081298391823',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _init();

    debounce(search, getData);
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
      // change(null, status: RxStatus.empty());
    }

    _initTextController();
  }

  void _initTextController() {
    searchC.addListener(_setSearch);
  }

  void _setSearch() => search.value = searchC.text;

  void selectUser(UsersModel user) => Get.back(result: user);

  void getData(String filter) async {
    try {
      if (filter.isNotEmpty) {
        change(null, status: RxStatus.loading());

        await Future.delayed(3.seconds);
        final resultSearch = dataPatient
            .where(
              (element) =>
                  element.name.toLowerCase().contains(filter.toLowerCase()),
            )
            .toList();

        _initC.logger.d('debug: resultSearch = ${resultSearch.isNotEmpty}');

        if (resultSearch.isNotEmpty) {
          change(
            resultSearch,
            status: RxStatus.success(),
          );
        } else {
          change(
            null,
            status: RxStatus.empty(),
          );
        }

        change(
          (resultSearch.isNotEmpty) ? resultSearch : null,
          status: RxStatus.success(),
        );
      } else {}
    } catch (e) {
      _initC.logger.e('Error: $e');
      change(null, status: RxStatus.error('$e'));
    }
  }

  void backTo(UsersModel item) => Get.back(result: item);
}
