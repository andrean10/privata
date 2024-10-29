import 'package:get/get.dart';

import '../controllers/search_procedure_controller.dart';

class SearchProcedureBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchProcedureController>(() => SearchProcedureController());
  }
}
