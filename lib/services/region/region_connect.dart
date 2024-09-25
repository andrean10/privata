import 'package:get/get.dart';

import '../../../utils/constants_connect.dart';

class RegionConnect extends GetConnect {
  static const headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': '*',
    'Access-Control-Allow-Methods': '*',
  };

  Future<Response> get fetchProvinces => get(
        '${ConstantsConnect.endpointRegion}provinces.json',
        headers: headers,
      );

  Future<Response> fetchRegencies(String provinceId) => get(
        '${ConstantsConnect.endpointRegion}regencies/$provinceId.json',
        headers: headers,
      );

  Future<Response> fetchDistricts(String regenciesId) => get(
        '${ConstantsConnect.endpointRegion}districts/$regenciesId.json',
        headers: headers,
      );

  Future<Response> fetchVillages(String districtsId) => get(
        '${ConstantsConnect.endpointRegion}villages/$districtsId.json',
        headers: headers,
      );
}
