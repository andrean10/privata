import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:privata/utils/constants_assets.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;

            return Image.asset(
              ConstantsAssets.icSplash,
              width: maxWidth / 1.5,
              fit: BoxFit.cover,
            );
          }),
        ),
      ),
    );
  }
}
