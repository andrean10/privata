import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/modules/core/rme/views/today_rme_screen.dart';

import '../../menu_registration/search_patient/views/search_patient_view.dart';
import '../controllers/rme_controller.dart';

class RmeView extends GetView<RmeController> {
  const RmeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: controller.tabC,
        tabs: controller.listTab.map((e) => Tab(text: e)).toList(),
      ),
      body: TabBarView(
        controller: controller.tabC,
        children: const [
          TodayRmeScreen(),
          SearchPatientView(isFromRME: true),
        ],
      ),
    );
  }
}
