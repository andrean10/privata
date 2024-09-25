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

  Future<Response> verifyOTP({
    required String token,
    required String tokenUser,
  }) {
    headers['Authorization'] = token;

    return post(
      'Masyarakats/verifySmsAuthTokenMobile',
      null,
      query: {'token': tokenUser},
      headers: headers,
    );
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
