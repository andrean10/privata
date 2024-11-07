import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:privata/app/data/models/patient/address/address_model.dart';
import 'package:privata/app/data/models/rj/item_rj/patient/payment_method/payment_method_model.dart';
import 'package:privata/app/data/models/rj/item_rj/patient/ph/ph_model.dart';
import 'package:privata/app/helpers/text_helper.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../../../../../services/region/region_connect.dart';
import '../../../../../../../services/rj/rj_connect.dart';
import '../../../../../../data/models/patient/patient_model.dart';
import '../../../../../../data/models/region/district/district_model.dart';
import '../../../../../../data/models/region/province/province_model.dart';
import '../../../../../../data/models/region/regency/regency_model.dart';
import '../../../../../../data/models/region/village/village_model.dart';
import '../../../../../../data/server/patient/patient_server.dart';
import '../../../../../../helpers/format_date_time.dart';
import '../../../../../../helpers/helper.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../../widgets/snackbar/snackbar.dart';

class NewPatientController extends GetxController {
  late final InitController _initC;
  late final RegionConnect _regionCn;
  late final RJConnect _rjCn;

  late final String? _hospitalId;

  final formKey = GlobalKey<FormState>();
  final fullNameC = TextEditingController();
  final noMRC = TextEditingController();
  final placeBirthC = TextEditingController();
  final birthDateC = TextEditingController();
  final provinceC = TextEditingController();
  final regenciesC = TextEditingController();
  final districtsC = TextEditingController();
  final villagesC = TextEditingController();
  final addressC = TextEditingController();
  final emailC = TextEditingController();
  final postalCodeC = TextEditingController();
  final noPhoneC = TextEditingController();
  final noKTPC = TextEditingController();
  final genderC = TextEditingController();
  final religionC = TextEditingController();
  final marriedStatusC = TextEditingController();
  final bloodTypeC = TextEditingController();
  final lastEducationC = TextEditingController();
  final jobC = TextEditingController();

  final fullNameF = FocusNode();
  final noMRF = FocusNode();
  final placeBirthF = FocusNode();
  final addressF = FocusNode();
  final emailF = FocusNode();
  final postalCodeF = FocusNode();
  final noPhoneF = FocusNode();
  final noKTPF = FocusNode();

  final fullName = ''.obs;
  final noMR = ''.obs;
  final placeBirth = ''.obs;
  final birthDate = ''.obs;
  final province = ''.obs;
  final regency = ''.obs;
  final district = ''.obs;
  final village = ''.obs;
  final address = ''.obs;
  final email = ''.obs;
  final postalCode = ''.obs;
  final noPhone = ''.obs;
  final noKTP = ''.obs;
  final gender = ''.obs;
  final religion = ''.obs;
  final marriedStatus = ''.obs;
  final bloodType = ''.obs;
  final lastEducation = ''.obs;
  final job = ''.obs;

  final idProvince = ''.obs;
  final idRegency = ''.obs;
  final idDistrict = ''.obs;
  final idVillage = ''.obs;

  final tempDataProvinces = <ProvinceModel>[].obs;
  final tempDataRegencies = <RegencyModel>[].obs;
  final tempDataDistricts = <DistrictModel>[].obs;
  final tempDataVillages = <VillageModel>[].obs;

  final imageCropped = Rxn<CroppedFile>();
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

    _regionCn = RegionConnect();
    _rjCn = RJConnect(_initC);

    _hospitalId = _initC.localStorage.read<String>(ConstantsKeys.hospitalId);

    fetchProvince();
    fetchCodeNewMR();

    _initTextController();
  }

  void _initTextController() {
    fullNameC.addListener(() => setListener(fullName, fullNameC));
    noMRC.addListener(() => setListener(noMR, noMRC));
    placeBirthC.addListener(() => setListener(placeBirth, placeBirthC));
    noKTPC.addListener(() => setListener(noKTP, noKTPC));
    noPhoneC.addListener(() => setListener(noPhone, noPhoneC));
    addressC.addListener(() => setListener(address, addressC));
    emailC.addListener(() => setListener(email, emailC));
    postalCodeC.addListener(() => setListener(postalCode, postalCodeC));
  }

  void setListener<T>(T obs, TextEditingController controller) {
    if (obs is RxString) {
      obs.value = controller.text;
    }
  }

  void setDate(DateTime value) {
    birthDateC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: value.toString(),
    );
    birthDate.value = value.toIso8601String();
  }

  void selectedItemDropdown<T>({
    required T obs,
    required dynamic value,
    VoidCallback? function,
  }) {
    if (obs is RxString) {
      obs.value = value;
    }

    if (function != null) {
      function();
    }
  }

  Future<void> fetchCodeNewMR() async {
    try {
      final filter = {
        "fields": {"nextInsertedMr": true}
      };

      final query = {'filter': jsonEncode(filter)};
      final res = await _rjCn.getCodeNewMR(query);

      Helper.printPrettyJson(res.body);

      if (res.isOk) {
        final body = res.body;
        final codeMR = body['nextInsertedMr'] as String?;
        noMRC.text = TextHelper.splitMRCode(codeMR); //* SUDAH FIX DEP
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error fetching regencies = ${e.message}');
    }
  }

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
    if (idProvince.value != id) {
      idProvince.value = id!;
      clearRegency();
      fetchRegencies(id!);
    }
  }

  void selectedRegency(dynamic id) {
    if (idRegency.value != id) {
      idRegency.value = id;
      clearDistrict();
      fetchDistricts(id);
    }
  }

  void selectedDistrict(dynamic id) {
    if (idDistrict.value != id) {
      idDistrict.value = id;
      clearVillage();
      fetchVillages(id);
    }
  }

  void selectedVillage(dynamic id) => idVillage.value = id;

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

  void save() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();
    createPatient();
  }

  Future<void> createPatient() async {
    isLoading.value = true;

    try {
      final now = DateTime.now();
      final nowFormatString = FormatDateTime.dateToString(
        newPattern: 'yyyy-MM-dd',
        value: now.toString(),
      );

      final phModel = PHModel(
        code: noMR.value,
        idRs: _hospitalId,
        date: now.toIso8601String(),
        id: TextHelper.generateUniqueId(10),
        tags: [],
      ).toJson();

      final paymentModel = PaymentMethodModel(
        name: 'Tunai',
        type: 'tunai',
        createdAt: nowFormatString,
        no: '',
        id: now.millisecondsSinceEpoch,
      ).toJson();

      final addressModel = AddressModel(
        jalan: address.value,
        region: provinceC.text,
        city: regenciesC.text,
        district: districtsC.text,
        postcode: postalCode.value,
        post: 0,
      ).toJson();

      final body = PatientServer(
        ph: [phModel],
        family: [],
        paymentMethod: [paymentModel],
        address: addressModel,
        addressDomicile:
            '${address.value}, ${regency.value} ${postalCode.value}',
        birthPlace: placeBirth.value,
        bloodType: bloodType.value,
        createdAt: now.toIso8601String(),
        education: lastEducation.value,
        email: email.value,
        gender: (gender.value.toLowerCase() == 'laki-laki') ? 1 : 2,
        hp: noPhone.value,
        isGenerateMrCode: false,
        isShareMr: false,
        nama: fullName.value,
        noKTP: noKTP.value,
        phone: noPhone.value,
        religion: religion.value,
        status: marriedStatus.value,
        tanggalLahir: birthDate.value,
        job: job.value,
      );

      final res = await _rjCn.createPatient(body.toJson());

      Helper.printPrettyJson(res.body);

      if (res.isOk) {
        Snackbar.success(
          context: Get.context!,
          content: 'Berhasil menambah pasien baru',
        );
        _moveToVisitRegistration();
      } else {
        _initC.logger.e('Error: ${res.statusCode}, ${res.statusText}');
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
      Snackbar.failed(
        context: Get.context!,
        content:
            'Terjadi kesalahan saat menyimpan data user, coba beberapa saat lagi',
      );
    } finally {
      isLoading.value = false;
    }
  }

  void _moveToVisitRegistration() => Get.offAndToNamed(
        Routes.VISIT_REGISTRATION,
        arguments: const PatientModel(),
      );
}
