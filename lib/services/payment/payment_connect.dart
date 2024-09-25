import 'package:get/get.dart';

import '../../../utils/constants_connect.dart';

class PaymentConnect extends GetConnect {
  static const headers = {
    'Authorization':
        'Basic U0ItTWlkLXNlcnZlci1EWVVpMzJJYUJIRWwyR1NJVWx5MFFORVA6',
    'Accept': 'application/json',
  };

  Future<Response> getToken(Map data) => post(
        ConstantsConnect.endPointMidtransTest,
        data,
        headers: headers,
        contentType: 'application/json',
      );
}
