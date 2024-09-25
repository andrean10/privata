import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:privata/app/data/models/region/district/district_model.dart';
import 'package:privata/app/data/models/region/province/province_model.dart';
import 'package:privata/app/data/models/region/regency/regency_model.dart';
import 'package:privata/app/data/models/region/village/village_model.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/app/routes/app_pages.dart';
import 'package:privata/services/region/region_connect.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import '../../../../../utils/constants_keys.dart';
import '../../../widgets/snackbar/snackbar.dart';

class InfoFaskesController extends GetxController {
  late final InitController _initC;
  late final RegionConnect _regionCn;

  final formKey = GlobalKey<FormState>();
  final faskesNameC = TextEditingController();
  final addressNameC = TextEditingController();
  final postalCodeC = TextEditingController();
  final provinceC = TextEditingController();
  final regenciesC = TextEditingController();
  final districtsC = TextEditingController();
  final villagesC = TextEditingController();

  final faskesNameF = FocusNode();
  final addressNameF = FocusNode();
  final postalCodeF = FocusNode();
  final provinceF = FocusNode();
  final regenciesF = FocusNode();
  final districtsF = FocusNode();
  final villagesF = FocusNode();

  final faskesName = ''.obs;
  final addressName = ''.obs;
  final postalCode = ''.obs;
  final isOwner = false.obs;
  final isApprovedBPJS = false.obs;

  var idProvince = '';
  var idRegency = '';
  var idDistrict = '';
  var idVillage = '';

  final tempDataProvinces = <ProvinceModel>[].obs;
  final tempDataRegencies = <RegencyModel>[].obs;
  final tempDataDistricts = <DistrictModel>[].obs;
  final tempDataVillages = <VillageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _regionCn = RegionConnect();
    fetchProvince();

    _initTextController();
    _configImagePicker();
  }

  void _initTextController() {
    faskesNameC.addListener(setFaskesName);
    addressNameC.addListener(setAddressName);
    postalCodeC.addListener(setPostalCode);
  }

  void _configImagePicker() {
    // config camera using Android Photo Picker for android version 12 below
    final imagePickerImpl = ImagePickerPlatform.instance;
    if (imagePickerImpl is ImagePickerAndroid) {
      imagePickerImpl.useAndroidPhotoPicker = true;
    }
  }

  Future<XFile?> pickFile(ImageSource source) async {
    try {
      final xFile = await ImagePicker().pickImage(source: source);
      return xFile;
    } on Exception catch (e) {
      _initC.logger.e('error: pickImage = $e');
    }
  }

  void setFaskesName() => faskesName.value = faskesNameC.text;

  void setAddressName() => addressName.value = addressNameC.text;

  void setPostalCode() => postalCode.value = postalCodeC.text;

  void changedOwner(bool? value) => isOwner.value = value ?? false;

  void changedApprovedBPJS(bool? value) =>
      isApprovedBPJS.value = value ?? false;

  Future<void> fetchProvince() async {
    try {
      if (tempDataProvinces.isEmpty) {
        final res = await _regionCn.fetchProvinces;

        if (res.isOk) {
          final dataList = res.body;

          if (dataList is List<dynamic>) {
            if (dataList.isNotEmpty) {
              final listProvinces =
                  dataList.map((e) => ProvinceModel.fromJson(e)).toList();

              // set to temporary
              tempDataProvinces.addAll(listProvinces);
            }
          }
        }
      }
    } catch (e) {
      _initC.logger.e('Error fetching provinces = $e');
    }
  }

  Future<void> fetchRegencies(String id) async {
    try {
      final res = await _regionCn.fetchRegencies(id);

      if (res.isOk) {
        final dataList = res.body;

        if (dataList is List<dynamic>) {
          if (dataList.isNotEmpty) {
            final listRegencies =
                dataList.map((e) => RegencyModel.fromJson(e)).toList();

            // set to temporary
            tempDataRegencies.addAll(listRegencies);
          }
        }
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error fetching regencies = ${e.message}');
    }
  }

  Future<void> fetchDistricts(String id) async {
    try {
      final res = await _regionCn.fetchDistricts(id);

      if (res.isOk) {
        final dataList = res.body;

        if (dataList is List<dynamic>) {
          if (dataList.isNotEmpty) {
            final listDistricts =
                dataList.map((e) => DistrictModel.fromJson(e)).toList();

            // set to temporary
            tempDataDistricts.addAll(listDistricts);
          }
        }
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error fetching districts = ${e.message}');
    }
  }

  Future<void> fetchVillages(String id) async {
    _initC.logger.d('debug: id district = $id');

    try {
      final res = await _regionCn.fetchVillages(id);

      if (res.isOk) {
        final dataList = res.body;

        if (dataList is List<dynamic>) {
          if (dataList.isNotEmpty) {
            final listVillages =
                dataList.map((e) => VillageModel.fromJson(e)).toList();

            // set to temporary
            tempDataVillages.addAll(listVillages);
          }
        }
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error fetching districts = ${e.message}');
    }
  }

  void selectedProvince(dynamic id) {
    if (idProvince != id) {
      idProvince = id;
      clearRegency();
      fetchRegencies(id);
    }
  }

  void selectedRegency(dynamic id) {
    if (idRegency != id) {
      idRegency = id;
      clearDistrict();
      fetchDistricts(id);
    }
  }

  void selectedDistrict(dynamic id) {
    if (idDistrict != id) {
      idDistrict = id;
      clearVillage();
      fetchVillages(id);
    }
  }

  void selectedVillage(dynamic id) => idVillage = id;

  void clearRegency() {
    regenciesC.clear();
    districtsC.clear();
    villagesC.clear();

    tempDataRegencies.clear();
    tempDataDistricts.clear();
    tempDataVillages.clear();
  }

  void clearDistrict() {
    districtsC.clear();
    villagesC.clear();

    tempDataDistricts.clear();
    tempDataVillages.clear();
  }

  void clearVillage() {
    villagesC.clear();

    tempDataVillages.clear();
  }

  Future<void> logOut() async {
    final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);

    if (token != null) {
      try {
        final res = await _initC.authCn.logout(token);

        await _initC.localStorage.erase();

        if (res.isOk) {
          _moveToLogin();
        } else {
          Snackbar.failed(
            context: Get.context!,
            content:
                'Gagal logout, sepertinya token anda telah berubah tetap logout?',
            action: SnackBarAction(
              label: 'Iya',
              onPressed: _moveToLogin,
            ),
            duration: const Duration(minutes: 1),
          );
        }
      } catch (e) {
        Snackbar.failed(
          context: Get.context!,
          content: 'Ada kesalahan saat ingin logout, coba lagi',
        );
        _initC.logger.e('error: $e');
      }
    }
  }

  void confirm() {
    _initC.localStorage.write(ConstantsKeys.isPref, true);
    _moveToWelcome();
  }

  void _moveToWelcome() => Get.toNamed(Routes.WELCOME);

  void _moveToLogin() => Get.offAllNamed(Routes.LOGIN);
}
