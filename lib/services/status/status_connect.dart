import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/utils/constants_keys.dart';
import '../../utils/constants_connect.dart';

class StatusConnect extends GetConnect {
  final InitController _initC;
  late final Map<String, String> headers;

  StatusConnect(this._initC) {
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

  Future<Response> failed(Map<String, dynamic> query) => get(
        '/Janjis/failedStatus',
        headers: headers,
        query: query,
      );

  Future<Response> pending(Map<String, dynamic> query) => get(
        '/Janjis/pendingStatus',
        headers: headers,
        query: query,
      );

  Future<Response> confirmed(Map<String, dynamic> query) => get(
        '/Janjis/confirmedStatus',
        headers: headers,
        query: query,
      );

  Future<Response> waiting(Map<String, dynamic> query) => get(
        '/Janjis/waitingStatus',
        headers: headers,
        query: query,
      );
  Future<Response> engage(Map<String, dynamic> query) => get(
        '/Janjis/engageStatus',
        headers: headers,
        query: query,
      );

  Future<Response> succeed(Map<String, dynamic> query) => get(
        '/Janjis/succeedStatus',
        headers: headers,
        query: query,
      );
}
