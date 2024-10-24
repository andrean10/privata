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

  Future<Response> reject(Map<String, dynamic> body) => put(
        '/Janjis/failedStatus',
        body,
        headers: headers,
      );

  Future<Response> pending(Map<String, dynamic> body) => put(
        '/Janjis/pendingStatus',
        body,
        headers: headers,
      );

  Future<Response> confirmed(Map<String, dynamic> body) => put(
        '/Janjis/confirmedStatus',
        body,
        headers: headers,
      );

  Future<Response> confirmedV2(Map<String, dynamic> body) => put(
        '/Janjis/confirmedStatusV2',
        body,
        headers: headers,
      );

  Future<Response> rescheduleV2(Map<String, dynamic> body) => put(
        '/Janjis/rescheduleV2',
        body,
        headers: headers,
      );

  Future<Response> waiting(Map<String, dynamic> body) => put(
        '/Janjis/waitingStatus',
        body,
        headers: headers,
      );
  Future<Response> engage(Map<String, dynamic> body) => put(
        '/Janjis/engageStatus',
        body,
        headers: headers,
      );

  Future<Response> succeed(Map<String, dynamic> body) => put(
        '/Janjis/succeedStatus',
        body,
        headers: headers,
      );
}
