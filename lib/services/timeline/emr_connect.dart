import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/utils/constants_keys.dart';
import '../../utils/constants_connect.dart';

class EMRConnect extends GetConnect {
  final InitController _initC;
  late final Map<String, String> headers;

  EMRConnect(this._initC) {
    final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);
    headers = {
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = token;
    }
  }

  @override
  String? get baseUrl => ConstantsConnect.endPointBaseUrl;

  Future<Response> timelineEMRByPatient(Map<String, dynamic> query) => get(
        'KMrs',
        headers: headers,
        query: query,
      );

  Future<Response> getDetailEMR(Map<String, dynamic> query) => get(
        'KMrs',
        headers: headers,
        query: query,
      );

  Future<Response> searchDiagnosesICD10s(String keyword) => get(
        'ICD10s/getByKeyword',
        headers: headers,
        query: {
          'keyword': keyword,
        },
      );

  Future<Response> addDiagnoses(Map<String, dynamic> body) => post(
        'KDiagnoses',
        body,
        headers: headers,
      );

  Future<Response> coretDiagnose({
    required String id,
    required Map<String, dynamic> body,
  }) =>
      put(
        'KDiagnoses/$id/streak',
        body,
        headers: headers,
      );

  Future<Response> searchProcedures(Map<String, dynamic> query) => get(
        'KProcedures',
        headers: headers,
        query: query,
      );

  // Cek Ketersediaan Data Prosedure
  Future<Response> countProcedures(Map<String, dynamic> query) => get(
        'KProcedures/count',
        headers: headers,
        query: query,

        //! Untuk catatan key dari versi android
        // query: {
        //   'where': query,
        // },
      );
  Future<Response> saveProcedures(List<Map<String, dynamic>> body) => post(
        'KMrProcedures/newPostProcedureDetail',
        body,
        headers: headers,
      );

  Future<Response> coretProcedure({
    required String id,
    required Map<String, dynamic> body,
  }) =>
      put(
        'KMrProcedures/$id/streak',
        body,
        headers: headers,
      );

  Future<Response> saveDrugs(List<Map<String, dynamic>> body) => post(
        'KPrescriptions/createPrescription',
        body,
        headers: headers,
      );

  Future<Response> coretDrugs({
    required String id,
    required Map<String, dynamic> body,
  }) =>
      put(
        'KPrescriptions/$id/streak',
        body,
        headers: headers,
      );

  Future<Response> saveComplaint(Map<String, dynamic> body) => post(
        'KMrs/addKeluhan',
        body,
        headers: headers,
      );

  Future<Response> saveVitalSigns(Map<String, dynamic> body) => post(
        'KVitalSigns',
        body,
        headers: headers,
      );

  Future<Response> updateVitalSign({
    required String id,
    required Map<String, dynamic> body,
  }) =>
      patch(
        'KVitalSigns/$id',
        body,
        headers: headers,
      );

  Future<Response> addDoctorNotes(Map<String, dynamic> body) => post(
        'KDoctorNotes',
        body,
        headers: headers,
      );
}
