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
        '/KMrs',
        headers: headers,
        query: query,
      );
}
