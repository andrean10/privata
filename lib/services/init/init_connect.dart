import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:privata/utils/constants_keys.dart';
import '../../utils/constants_connect.dart';

class InitConnect extends GetConnect {
  final GetStorage _localStorage;
  late final Map<String, String> headers;

  InitConnect(this._localStorage) {
    final token = _localStorage.read<String>(ConstantsKeys.authToken);
    headers = {
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = token;
    }
  }

  @override
  String? get baseUrl => ConstantsConnect.endPointBaseUrl;

  Future<Response> kConfigs(String filter) => get(
        'KConfigs',
        headers: headers,
        query: {'filter': filter},
      );

  Future<Response> dataKlinik(String filter) => get(
        'Rumahsakits',
        headers: headers,
        query: {'filter': filter},
      );
}
