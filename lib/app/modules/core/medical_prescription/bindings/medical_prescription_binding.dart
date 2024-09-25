import 'package:get/get.dart';

import '../controllers/medical_prescription_controller.dart';

class MedicalPrescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalPrescriptionController>(
      () => MedicalPrescriptionController(),
    );
  }
}
