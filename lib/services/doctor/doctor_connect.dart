import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/utils/constants_keys.dart';
import '../../utils/constants_connect.dart';

class DoctorConnect extends GetConnect {
  final InitController _initC;
  late final Map<String, String> headers;

  DoctorConnect(this._initC) {
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

  Future<Response> getDoctor(Map<String, dynamic> query) => get(
        'Prakteks/getPraktekRs',
        headers: headers,
        query: query,
      );

  // Future<Response> outcome(String strHospitalId) => get(
  //       '$subRouteSuper/outcome',
  //       headers: headers,
  //       query: {'hospitalId': strHospitalId},
  //     );

  // Future<Response> appointment(Map<String, dynamic> query) => get(
  //       'Janjis/count',
  //       query: query,
  //       headers: headers,
  //     );

  // Future<Response> cashierQueue(Map<String, dynamic> query) => get(
  //       'KTxes/count',
  //       query: query,
  //       headers: headers,
  //     );
}
