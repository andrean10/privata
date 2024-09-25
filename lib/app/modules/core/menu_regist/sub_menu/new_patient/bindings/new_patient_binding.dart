import 'package:get/get.dart';

import '../controllers/new_patient_controller.dart';

class NewPatientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPatientController>(() => NewPatientController());
  }
}
