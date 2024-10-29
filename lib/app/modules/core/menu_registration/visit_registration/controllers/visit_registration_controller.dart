import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:privata/app/data/models/patient/patient_model.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/services/rj/rj_connect.dart';

import '../../../../../../services/doctor/doctor_connect.dart';
import '../../../../../../utils/constants_keys.dart';
import '../../../../../../utils/constants_strings.dart';
import '../../../../../data/models/doctor/doctor_model.dart';
import '../../../../../data/models/doctor/result/result_doctor_model.dart';
import '../../../../../data/models/location/location_model.dart';
import '../../../../../data/models/rj/item_rj/patient/rj_patient_model.dart';
import '../../../../../data/models/slot/slot_model.dart';
import '../../../../../helpers/format_date_time.dart';
import '../../../../../helpers/text_helper.dart';
import '../../../../widgets/snackbar/snackbar.dart';

enum MethodPayment {
  cash,
  bpjsKesehatan,
  bpjsKetenagakerjaan,
  insurance,
  company,
  cardDebit,
  cardCredit,
  other
}

class VisitRegistrationController extends GetxController
    with StateMixin<RJPatientModel> {
  late final InitController _initC;
  late final RJConnect _rjConn;
  late final DoctorConnect _doctorConn;

  RJPatientModel? detailDataPasien;
  List<DoctorModel> dataDoctor = [];

  late final PatientModel args;
  late final String? hospitalId;

  final formKey = GlobalKey<FormState>();
  final namaPasienC = TextEditingController();
  final namaPembayaranC = TextEditingController();
  final nomorPembayaranC = TextEditingController();
  final nomorHPC = TextEditingController();
  final emailC = TextEditingController();
  final tanggalC = TextEditingController();
  final jamC = TextEditingController();
  final lamaDurasiC = TextEditingController();
  final keluhanC = TextEditingController();
  final prosedurC = TextEditingController();
  final lajuPernapasanC = TextEditingController();
  final denyutNadiC = TextEditingController();
  final tinggiBadanC = TextEditingController();
  final beratBadanC = TextEditingController();
  final gulaDarahC = TextEditingController();
  final suhuTubuhC = TextEditingController();
  final lingkarPerutC = TextEditingController();
  final saturasiOksigenC = TextEditingController();
  final darahSistolikC = TextEditingController();
  final darahDiastolikC = TextEditingController();

  final namaPembayaranF = FocusNode();
  final nomorPembayaranF = FocusNode();
  final nomorHPF = FocusNode();
  final emailF = FocusNode();
  final lamaDurasiF = FocusNode();
  final keluhanF = FocusNode();
  final prosedurF = FocusNode();
  final lajuPernapasanF = FocusNode();
  final denyutNadiF = FocusNode();
  final tinggiBadanF = FocusNode();
  final beratBadanF = FocusNode();
  final gulaDarahF = FocusNode();
  final suhuTubuhF = FocusNode();
  final lingkarPerutF = FocusNode();
  final saturasiOksigenF = FocusNode();
  final darahSistolikF = FocusNode();
  final darahDiastolikF = FocusNode();

  final penjamin = RxnString();
  final metodePembayaran = RxnString();
  final selectedMetodePembayaran = Rxn<MethodPayment>();
  final namaPembayaran = RxnString();
  final nomorPembayaran = RxnString();
  final jenisKunjungan = 'Kunjungan Sakit'.obs;
  final jenisPerawatan = 'Rawat Jalan'.obs;
  final nomorHP = RxnString();
  final email = RxnString();
  final isCheckedEmail = false.obs;
  final lokasi = Rxn<LocationModel>();
  final poli = 'Umum'.obs;
  final tenagaMedis = Rxn<DoctorModel>();
  final tanggal = DateTime.now().obs;
  final slot = Rxn<SlotModel>();
  final jam = Rxn<TimeOfDay>();
  final lamaDurasi = 0.obs;
  final keluhan = RxnString();
  final prosedur = RxnString();

  var namaHari = '';

  final isShowVitalSign = false.obs;
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

    _rjConn = RJConnect(_initC);
    _doctorConn = DoctorConnect(_initC);

    args = Get.arguments as PatientModel;
    hospitalId = _initC.localStorage.read<String>(ConstantsKeys.hospitalId);

    _initListener();
    _initText();
    _workerListener();
    _fetchDataPatient();
  }

  void _initListener() {
    _listener(namaPembayaran, namaPembayaranC);
    _listener(nomorPembayaran, nomorPembayaranC);
    _listener(nomorHP, nomorHPC);
    _listener(email, emailC);
    _listener(keluhan, keluhanC);
    _listener(prosedur, prosedurC);
    // tanggalC.addListener(
    //   () => namaHari =
    //       FormatDateTime.dateToString(newPattern: 'EEEE', value: tanggalC.text),
    // );
    lamaDurasiC.addListener(
      () => lamaDurasi.value = int.tryParse(lamaDurasiC.text) ?? 0,
    );
  }

  void _workerListener() {
    ever(
      selectedMetodePembayaran,
      (value) {
        namaPembayaranC.clear();
        nomorPembayaranC.clear();
        namaPembayaran.value = null;
        nomorPembayaran.value = null;
      },
    );
    // Todo Akan dikerjakan nanti
    // everAll(
    //   [
    //     tenagaMedis,
    //     tanggal,
    //   ],
    //   (callback) {},
    // );
  }

  void _initText() {
    final now = DateTime.now();
    namaHari = FormatDateTime.dateToString(
      newPattern: 'EEEE',
      value: now.toString(),
    );

    _textC(namaPasienC, args.nama);
    _text(penjamin, '${args.nama} (pribadi)');
    _text(jenisKunjungan, ConstantsStrings.dataVisitType.first);
    _text(jenisPerawatan, ConstantsStrings.dataServiceType.first);
    _textC(nomorHPC, args.phone);
    _textC(
      tanggalC,
      FormatDateTime.dateToString(
        newPattern: 'dd MMMM yyyy',
        value: now.toString(),
      ),
    );
  }

  void _listener(RxnString obs, TextEditingController controller) =>
      controller.addListener(() => obs.value = controller.text);

  void _textC(TextEditingController ctr, String? value) =>
      ctr.text = value ?? '';

  void _text<T>(Rx<T> obs, T value) => obs.value = value;

  void setDate(DateTime value) {
    final formatDate = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: value.toString(),
    );
    final nameDay = FormatDateTime.dateToString(
      newPattern: 'EEEE',
      value: value.toString(),
    );

    if (tanggalC.text != formatDate) {
      slot.value = null;
      jamC.clear();
      jam.value = null;
      lamaDurasiC.clear();
      lamaDurasi.value = 0;
      namaHari = '';
    }

    tanggalC.text = formatDate;
    tanggal.value = value;
    namaHari = nameDay;
  }

  void setSlot(SlotModel? item) {
    if (item != null) {
      slot.value = item;
    }
  }

  String formatSlotTime(SlotModel value) {
    final startTime = FormatDateTime.time(value: value.start);
    final endTime = FormatDateTime.time(value: value.end);
    return '$startTime - $endTime WIB';
  }

  void setTime(TimeOfDay value) {
    final formatTime = FormatDateTime.timeToString(
      newPattern: 'HH:mm',
      value: value,
    );
    jamC.text = formatTime;
    jam.value = value;
  }

  void onChangedPaymentMethod(String? value) {
    if (value != null) {
      metodePembayaran.value = value;
      selectedMetodePembayaran.value = switch (value.toLowerCase()) {
        'tunai' => MethodPayment.cash,
        'bpjs kesehatan' => MethodPayment.bpjsKesehatan,
        'bpjs ketenagakerjaan' => MethodPayment.bpjsKetenagakerjaan,
        'asuransi' => MethodPayment.insurance,
        'perusahaan' => MethodPayment.company,
        'kartu debit' => MethodPayment.cardDebit,
        'kartu kredit' => MethodPayment.cardCredit,
        _ => MethodPayment.other,
      };

      final paymentMethod = detailDataPasien?.paymentMethod;

      if (paymentMethod != null && paymentMethod.isNotEmpty) {
        switch (selectedMetodePembayaran.value) {
          case MethodPayment.bpjsKesehatan:
            final payment = paymentMethod.firstWhereOrNull(
              (element) =>
                  element.type == 'bpjs' && element.name == 'BPJS Kesehatan',
            );
            nomorPembayaranC.text = payment?.no ?? '';
            break;
          case MethodPayment.bpjsKetenagakerjaan:
            final payment = paymentMethod.firstWhereOrNull(
              (element) =>
                  element.type == 'bpjs' &&
                  element.name == 'BPJS Ketenagakerjaan',
            );
            nomorPembayaranC.text = payment?.no ?? '';
            break;
          case MethodPayment.insurance:
            final payment = paymentMethod.firstWhereOrNull(
              (element) => element.type == 'insurance',
            );
            namaPembayaranC.text = payment?.name ?? '';
            nomorPembayaranC.text = payment?.no ?? '';
            break;
          case MethodPayment.company:
            final payment = paymentMethod.firstWhereOrNull(
              (element) => element.type == 'company',
            );
            namaPembayaranC.text = payment?.name ?? '';
            nomorPembayaranC.text = payment?.no ?? '';
            break;
          case MethodPayment.cardDebit:
            break;
          case MethodPayment.cardCredit:
            break;
          default:
        }
      }
    }
  }

  void setNameAndNumber() {}

  void onChanged(String value, Map<String, Object?> item) {
    if (item.containsKey('obs')) {
      if (item['subType'] != 'date' || item['subType'] != 'time') {
        final obs = item['obs'] as RxString;
        final controller = item['controller'] as TextEditingController;
        obs.value = controller.text;
      }
    }
  }

  void onChangedChecbox(bool? value, Map<String, Object?> item) {
    final obs = item['obs'] as RxBool?;
    if (obs != null) {
      obs.value = value ?? false;
    }
  }

  void onChangeTenagaMedis(DoctorModel? value) {
    tenagaMedis.value = value;
    slot.value = null;
  }

  void onChangedSlot(SlotModel? value) {
    slot.value = value;

    if (value != null && value.menit != null) {
      final menit = value.menit;
      lamaDurasiC.text = menit.toString();
      lamaDurasi.value =
          (menit.isNumericOnly) ? int.tryParse(menit!) ?? 0 : menit;
    }
  }

  void selectedJenisKunjungan(
    int indexSelected,
    List<Map<String, Object?>> widgets,
  ) {
    final widgetJenisPerawatan = widgets.firstWhere(
      (item) => (item['title'] as String).contains('Jenis Perawatan'),
    );
    final widgetPoli = widgets.firstWhere(
      (item) => (item['title'] as String).contains('Poli'),
    );
    final widgetAktifitas = widgets.firstWhere(
      (item) => (item['title'] as String).contains('Aktifitas'),
    );

    // visible textfield
    if (indexSelected == 1) {
      (widgetPoli['isVisible'] as RxBool).value = false;
      (widgetAktifitas['isVisible'] as RxBool).value = true;
    } else {
      (widgetPoli['isVisible'] as RxBool).value = true;
      (widgetAktifitas['isVisible'] as RxBool).value = false;
    }

    // set data jenis perawatan
    final items = widgetJenisPerawatan['items'] as RxList<String>;
    items.value = switch (indexSelected) {
      1 => [ConstantsStrings.dataServiceType.first],
      2 => ConstantsStrings.dataServiceTypeBody,
      _ => ConstantsStrings.dataServiceType
    };

    (widgetJenisPerawatan['controller'] as TextEditingController).clear();
    (widgetPoli['controller'] as TextEditingController).clear();
    (widgetAktifitas['controller'] as TextEditingController).clear();

    (widgetJenisPerawatan['isEnabled'] as RxBool).value = true;
    (widgetPoli['isEnabled'] as RxBool).value = false;
    (widgetAktifitas['isEnabled'] as RxBool).value = false;
  }

  void selectedJenisPerawatan(
    int indexSelected,
    List<Map<String, Object?>> widgets,
  ) {
    final widgetJenisKunjungan =
        widgets.firstWhere((item) => item['title'] == 'Jenis Kunjungan');
    final widgetPoli = widgets.firstWhere((item) => item['title'] == 'Poli');
    final widgetTipeKamar =
        widgets.firstWhere((item) => item['title'] == 'Tipe Kamar');
    final widgetAktifitas =
        widgets.firstWhere((item) => item['title'] == 'Aktifitas');

    if (indexSelected == 0) {
      final controllerJenisKunjungan =
          widgetJenisKunjungan['controller'] as TextEditingController;

      // Berarti ini kunjungan sehat
      if (controllerJenisKunjungan.text == 'Kunjungan Sehat') {
        (widgetAktifitas['isEnabled'] as RxBool).value = true;
      }
      // Ini kunjungan sakit
      else {
        (widgetPoli['isVisible'] as RxBool).value = true;
        (widgetTipeKamar['isVisible'] as RxBool).value = false;
      }
    } else {
      (widgetPoli['isVisible'] as RxBool).value = false;
      (widgetTipeKamar['isVisible'] as RxBool).value = true;
    }

    (widgetPoli['controller'] as TextEditingController).clear();
    (widgetTipeKamar['controller'] as TextEditingController).clear();
    (widgetPoli['isEnabled'] as RxBool).value = true;
    (widgetTipeKamar['isEnabled'] as RxBool).value = true;
  }

  void selectedJenisPerawatanKecantikan(List<Map<String, Object?>> widgets) {
    final widgetPoli = widgets.firstWhere((item) => item['title'] == 'Poli');
    (widgetPoli['isEnabled'] as RxBool).value = true;
    (widgetPoli['controller'] as TextEditingController).clear();
  }

  void _fetchDataPatient() async {
    try {
      final query = {
        'id': args.id,
        'hospitalId': hospitalId,
      };

      final res = await _rjConn.getPatientDetail(query);
      final body = res.body;

      if (res.isOk) {
        if (body is Map<String, dynamic>) {
          detailDataPasien = RJPatientModel.fromJson(body);

          if (detailDataPasien != null) {
            setDataPatient(detailDataPasien!);
          }

          change(detailDataPasien, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.success());
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
      Snackbar.failed(
        context: Get.context!,
        content: e.message,
      );
      change(null, status: RxStatus.success());
    }
  }

  void onChangedLocation(LocationModel? value) => lokasi.value = value;

  Future<List<LocationModel>> fetchLocation(
    String filter,
    // LoadProps? props,
  ) async {
    if (hospitalId != null) {
      try {
        final res = await _rjConn.getLocation(hospitalId!);

        if (res.isOk) {
          final body = res.body;

          if (body is List<dynamic>) {
            final data = body.map((e) => LocationModel.fromJson(e)).toList();
            return data;
          }
        } else {
          _initC.handleError(status: res.status);
          return Future.error('${res.statusText}');
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: $e');
        return Future.error(e.message);
      }
    }

    return [];
  }

  Future<List<DoctorModel>> fetchDoctor(
    String filter,
    // LoadProps? props,
  ) async {
    // final skip = props?.skip ?? skipItemTenagaMedis;
    // final take = props?.take ?? 10;
    // skipItemTenagaMedis += take;

    // print('take = $take');
    // print('skipitemTenagaMedis = $skip');

    if (dataDoctor.isNotEmpty) {
      // final newData = dataDoctor.skip(skip).take(take).toList();
      // return newData;

      return dataDoctor;
    }

    try {
      final filterData = {"rumahSakitId": hospitalId};

      final query = {
        'filter_data': jsonEncode(filterData),
        // 'total': '$take',
      };

      final res = await _doctorConn.getDoctor(query);

      if (res.isOk) {
        final body = res.body;
        final response = ResultDoctorModel.fromJson(body);
        final itemsDoctor = response.items;

        dataDoctor.addAllIf(
          response.totalItem != 0,
          itemsDoctor,
        );

        // final newData = dataDoctor.take(take).toList();
        // return newData;
      } else {
        _initC.handleError(status: res.status);
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
      dataDoctor.clear();
    }

    return dataDoctor;
  }

  Future<List<SlotModel>> fetchSlot(
    String filter,
    // LoadProps? props,
  ) async {
    final practiceId = tenagaMedis.value?.id;

    if (practiceId != null) {
      try {
        final params = {
          'practiceId': tenagaMedis.value?.id,
          'date': FormatDateTime.dateToString(
            newPattern: 'yyyy-MM-dd',
            value: tanggal.value.toString(),
          ),
        };

        final query = {
          'filter': jsonEncode(params),
        };

        final res = await _rjConn.getPracticeAvailable(query);

        if (res.isOk) {
          final body = res.body;

          if (body is List<dynamic>) {
            final data = body.map((e) => SlotModel.fromJson(e)).toList();
            return data;
          }
        } else {
          _initC.handleError(status: res.status);
          return Future.error('${res.statusText}');
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: $e');
        return Future.error(e.message);
      }
    }

    return [];
  }

  void setDataPatient(RJPatientModel data) {
    emailC.text = data.email ?? '';
  }

  Future<void> postAppointment() async {
    final now = DateTime.now();

    final body = {
      "attendanceType": "",
      "uid": TextHelper.generateUniqueId(24),
      "pasienFkId": args.id,
      "praktekFkId": tenagaMedis.value?.id,
      "rumahSakitId": hospitalId,
      "day": namaHari.toLowerCase(),
      "date": FormatDateTime.dateToString(
        newPattern: 'yyyy-MM-dd',
        value: tanggal.value.toString(),
      ),
      "estimateTime": jamC.text.replaceAll(':', ''),
      "consultPlanDuration": lamaDurasi.value,
      "hp": nomorHP.value,
      "email": email.value,
      "bpjsVisit": jenisKunjungan.value,
      "bpjsTreatment": jenisPerawatan.value,
      "payment_method": metodePembayaran.value,
      "paymentMethodNo": nomorPembayaran.value ?? '',
      "paymentMethodName": namaPembayaran.value ?? '',
      "payerName": penjamin.value ?? '',
      "procedurePlan": prosedur.value ?? '',
      "complaint": keluhan.value ?? '',
      "isNotifEmailPatient": isCheckedEmail.value,
      "isNotifEmailDoctor": false,
      "triase": "",
      "createdId": TextHelper.generateUniqueId(24),
      "createdAt": now.toIso8601String(),
      "oldAppointment": false,
      "mcuPlans": [],
      "dataProsedur": [],
      "isPatientReferral": false,
      "referralDoctorName": "",
      "referralHospitalName": "",
      "isPayFirst": false,
      "plannedPacketProcedures": [],
      "createdPlannedProcedure": [],
      "registerTime": now.toIso8601String(),
      "poli": poli.value,
      "locationId": lokasi.value?.locationId ?? '',
      "locationName": lokasi.value?.locationName ?? '',
      "allergicHistory":
          detailDataPasien?.allergicHistory?.map((e) => e.toJson()).toList() ??
              [],
      "medicalHistory": detailDataPasien?.medicalHistory ?? [],
      "medicineHistory": detailDataPasien?.medicineHistory ?? [],
    };

    if (isShowVitalSign.value) {
      final vitalSigns = {
        "vitalSign": {
          'bloodSugar': gulaDarahC.text,
          'heartPulse': denyutNadiC.text,
          'height': tinggiBadanC.text,
          'weight': beratBadanC.text,
          'lingkarPerut': lingkarPerutC.text,
          'oxygenSaturation': saturasiOksigenC.text,
          'repiratoryRate': lajuPernapasanC.text,
          'sistole': darahSistolikC.text,
          'diastole': darahDiastolikC.text,
          'temperature': suhuTubuhC.text,
        },
      };
      body.addAll(vitalSigns);
    }

    try {
      final res = await _rjConn.createAppointment(body);

      if (res.isOk) {
        Snackbar.success(
          context: Get.context!,
          content: 'Berhasil menambahkan appointment baru',
        );

        Get.back();
        Get.back(result: true);
      } else {
        _initC.logger.e('Error: ${res.statusCode}, ${res.statusText}');
        _initC.handleError(status: res.status);
        _initC.logger.d('debug: res body error = ${res.body}');
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

  int? searchNamaPembayaran(String query) {
    return null;
  }

  void save() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();
    postAppointment();
  }
}
