import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/visit_registration_controller.dart';

class VisitRegistrationView extends GetView<VisitRegistrationController> {
  const VisitRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran Kunjungan'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VisitRegistrationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
