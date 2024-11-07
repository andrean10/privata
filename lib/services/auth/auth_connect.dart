import 'package:get/get.dart';
import '../../utils/constants_connect.dart';

class AuthConnect extends GetConnect {
  final headers = {
    // 'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  String? get baseUrl => ConstantsConnect.endPointBaseUrl;

  Future<Response> login(Map data) => post(
        'Externals/login',
        data,
        headers: headers,
      );

  Future<Response> register(Map data) => post(
        'Masyarakats/createPartner',
        data,
        headers: headers,
      );

  Future<Response> checkEmailOrUsername(Map<String, dynamic> data) => get(
        'Masyarakats/checkExist',
        query: data,
        headers: headers,
      );

  Future<Response> reqOTP(String authToken) {
    return get(
      'Masyarakats/reqOtp',
      headers: headers
        ..addAll({
          'Authorization': authToken,
        }),
    );
  }

  Future<Response> verifyOTP({
    required String authToken,
    required String otp,
  }) {
    return post(
      'Masyarakats/verifyOtp',
      {'otp': otp},
      headers: headers
        ..addAll({
          'Authorization': authToken,
        }),
    );
  }

  Future<Response> kConfigs({
    required String token,
    required String filter,
  }) {
    headers['Authorization'] = token;

    return get('KConfigs', headers: headers, query: {'filter': filter});
  }

  Future<Response> logout(String token) {
    headers['Authorization'] = token;

    return post(
      'Masyarakats/logout',
      null,
      headers: headers,
    );
  }
}
