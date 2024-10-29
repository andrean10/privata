import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/utils/constants_keys.dart';
import '../../utils/constants_connect.dart';

class RJConnect extends GetConnect {
  final InitController _initC;
  late final Map<String, String> headers;

  RJConnect(this._initC) {
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

  Future<Response> getList(Map<String, dynamic> query) => get(
        'Janjis/getJanjiListByHospital',
        headers: headers,
        query: query,
      );

  Future<Response> getListByDoctor(Map<String, dynamic> query) => get(
        'Janjis/getJanjiListByHospitalPracticeAndDates',
        headers: headers,
        query: query,
      );

  Future<Response> getPracticeAvailable(Map<String, dynamic> query) => get(
        'Janjis/getPracticeAvailable',
        headers: headers,
        query: query,
      );

  Future<Response> searchPatient(Map<String, dynamic> query) => get(
        'Pasiens/getPasienListByKeywordV2',
        headers: headers,
        query: query,
      );

  Future<Response> getPatientDetail(Map<String, dynamic> query) => get(
        'Pasiens/getPasienDetail',
        headers: headers,
        query: query,
      );

  Future<Response> getCodeNewMR(Map<String, dynamic> query) {
    final configId = _initC.localStorage.read(ConstantsKeys.configId);
    return get(
      'KConfigs/$configId',
      headers: headers,
      query: query,
    );
  }

  Future<Response> createPatient(Map<String, dynamic> body) => post(
        'Pasiens/postDetail',
        body,
        headers: headers,
      );

  Future<Response> createAppointment(Map<String, dynamic> body) => post(
        'Janjis/postAppointment',
        body,
        headers: headers,
      );

  Future<Response> getLocation(String hospitalId) => get(
        'SatuSehats/location/list/$hospitalId',
        headers: headers,
      );
}
