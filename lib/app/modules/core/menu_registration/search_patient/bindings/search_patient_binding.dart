import 'package:get/get.dart';

import '../controllers/search_patient_controller.dart';

class SearchPatientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchPatientController>(() => SearchPatientController());
  }
}
