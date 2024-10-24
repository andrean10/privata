import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/modules/core/rme/views/rme_view.dart';

import '../../menu_cashier/cashier/views/cashier_view.dart';
import '../../menu_dashboard/dashboard/views/dashboard_view.dart';
import '../../menu_profile/main/views/profile_view.dart';
import '../../menu_registration/rj/views/rj_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            DashboardView(),
            RJView(),
            RmeView(),
            CashierView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.setDestination,
          destinations: controller.menu
              .map(
                (item) => NavigationDestination(
                  icon: Icon(item.icon),
                  label: item.label,
                ),
              )
              .toList(),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
      ),
    );
  }
}
