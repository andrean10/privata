import 'package:get/get.dart';

import '../controllers/search_action_controller.dart';

class SearchActionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchActionController>(() => SearchActionController());
  }
}
