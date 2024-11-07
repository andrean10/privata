import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/utils/constants_keys.dart';
import '../../utils/constants_connect.dart';

class CashierConnect extends GetConnect {
  final InitController _initC;
  late final Map<String, String> headers;

  CashierConnect(this._initC) {
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
        'KTxes/getPatientTransactions',
        headers: headers,
        query: query,
      );


  Future<Response> getPriceList(Map<String, dynamic> query) => get(
        'KTxes/getPriceList',
        headers: headers,
        query: query,
      );

  Future<Response> getNoInvoice(String filter) => get(
        'KTxes',
        headers: headers,
        query: {'filter': query},
      );

  Future<Response> payForTransaction(Map<String, dynamic> body) => put(
        'KTxes/pay',
        body,
        headers: headers,
      );

  // Future<Response> searchPatient(Map<String, dynamic> query) => get(
  //       'Pasiens/getPasienListByKeywordV2',
  //       headers: headers,
  //       query: query,
  //     );

  // Future<Response> getPatientDetail(Map<String, dynamic> query) => get(
  //       'Pasiens/getPasienDetail',
  //       headers: headers,
  //       query: query,
  //     );

  // Future<Response> getCodeNewMR(Map<String, dynamic> query) {
  //   final configId = _initC.localStorage.read(ConstantsKeys.configId);
  //   return get(
  //     'KConfigs/$configId',
  //     headers: headers,
  //     query: query,
  //   );
  // }

  // Future<Response> createPatient(Map<String, dynamic> body) => post(
  //       'Pasiens/postDetail',
  //       body,
  //       headers: headers,
  //     );

  // Future<Response> createAppointment(Map<String, dynamic> body) => post(
  //       'Janjis/postAppointment',
  //       body,
  //       headers: headers,
  //     );

  // Future<Response> getLocation(String hospitalId) => get(
  //       'SatuSehats/location/list/$hospitalId',
  //       headers: headers,
  //     );
}
