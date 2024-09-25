import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../shared/shared_theme.dart';
import '../../../../../utils/constants_assets.dart';
import '../../../widgets/buttons/buttons.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    final orientation = context.orientation;
    final textTheme = context.textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(21),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ConstantsAssets.icWelcome,
                width: (orientation == Orientation.portrait)
                    ? width * 0.8
                    : width / 6,
              ),
              SizedBox(height: height / 34),
              AutoSizeText(
                'Hai, Selamat datang di Privata beta!',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: SharedTheme.bold,
                ),
                maxFontSize: textTheme.headlineMedium!.fontSize!,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height / 34),
              AutoSizeText(
                'Gak usah khawatir lagi ya, kamu bisa melakukan pencatatan antrian pasien secara cepat, mudah dan real-time loh. Kunjungi assist.id untuk lihat produk lainnya ya!',
                style: textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height / 18),
              Buttons.filled(
                onPressed: controller.moveToMain,
                child: const Text('Lanjut'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
