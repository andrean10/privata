import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';

import '../../../../../../../services/region/region_connect.dart';
import '../../../../../../data/models/region/district/district_model.dart';
import '../../../../../../data/models/region/province/province_model.dart';
import '../../../../../../data/models/region/regency/regency_model.dart';
import '../../../../../../data/models/region/village/village_model.dart';
import '../../../../../../helpers/format_date_time.dart';

class NewPatientController extends GetxController {
  late final InitController _initC;
  late final RegionConnect _regionCn;

  final formKey = GlobalKey<FormState>();
  final fullNameC = TextEditingController();
  final noMRC = TextEditingController(text: 'MR001867');
  final placeBirthC = TextEditingController();
  final birthDateC = TextEditingController();
  final dateBirthC = TextEditingController();
  final provinceC = TextEditingController();
  final regenciesC = TextEditingController();
  final districtsC = TextEditingController();
  final villagesC = TextEditingController();
  final addressC = TextEditingController();
  final postalCodeC = TextEditingController();
  final noPhoneC = TextEditingController();
  final noKTPC = TextEditingController();
  final genderC = TextEditingController();
  final religionC = TextEditingController();
  final marriedStatusC = TextEditingController();
  final bloodTypeC = TextEditingController();

  final fullNameF = FocusNode();
  final noMRF = FocusNode();
  final placeBirthF = FocusNode();
  final birthDateF = FocusNode();
  final dateBirthF = FocusNode();
  final provinceF = FocusNode();
  final regenciesF = FocusNode();
  final districtsF = FocusNode();
  final villagesF = FocusNode();
  final addressF = FocusNode();
  final postalCodeF = FocusNode();
  final noPhoneF = FocusNode();
  final noKTPF = FocusNode();
  final genderF = FocusNode();
  final religionF = FocusNode();
  final marriedStatusF = FocusNode();
  final bloodTypeF = FocusNode();

  final fullName = ''.obs;
  final noMR = ''.obs;
  final placeBirth = ''.obs;
  final birthDate = ''.obs;
  final address = ''.obs;
  final postalCode = ''.obs;
  final noPhone = ''.obs;
  final noKTP = ''.obs;
  final gender = ''.obs;
  final religion = ''.obs;
  final marriedStatus = ''.obs;
  final bloodType = ''.obs;

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
  }

  void _initTextController() {
    fullNameC.addListener(setFullName);
    // noMRC.addListener(setNoMR);
    placeBirthC.addListener(setPlaceBirth);
    addressC.addListener(setAddress);
    postalCodeC.addListener(setPostalCode);
    noPhoneC.addListener(setNoPhone);
    noKTPC.addListener(setNoKTP);
  }

  void setFullName() => fullName.value = fullNameC.text;

  // void setNoMR() => noMR.value = noMRC.text;

  void setPlaceBirth() => placeBirth.value = placeBirthC.text;

  void nextFocus(FocusNode node) => node.nextFocus();

  void setDate(DateTime value) {
    birthDateC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: value.toString(),
    );
  }

  void setAddress() => address.value = addressC.text;

  void setPostalCode() => postalCode.value = postalCodeC.text;

  void setNoPhone() => noPhone.value = noPhoneC.text;

  void setNoKTP() => noKTP.value = noKTPC.text;

  void selectedGender(dynamic value) => gender.value = value;

  void selectedReligion(dynamic value) => religion.value = value;

  void selectedMarriedStatus(dynamic value) => marriedStatus.value = value;

  void selectedBloodType(dynamic value) => bloodType.value = value;

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
}
