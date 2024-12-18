import 'package:get/get.dart';

import '../../menu_cashier/cashier/controllers/cashier_controller.dart';
import '../../menu_dashboard/dashboard/controllers/dashboard_controller.dart';
import '../../menu_setting/main/controllers/setting_controller.dart';
import '../../menu_registration/rj/controllers/rj_controller.dart';
import '../../rme/controllers/rme_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<RJController>(() => RJController());
    Get.lazyPut<RmeController>(() => RmeController());
    Get.lazyPut<CashierController>(() => CashierController());
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
