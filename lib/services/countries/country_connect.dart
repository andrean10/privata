import 'package:get/get.dart';

import '../../utils/constants_connect.dart';

class CountryConnect extends GetConnect {
  Future<Response> get fetchCountries =>
      get(ConstantsConnect.endPointCountries);
}
