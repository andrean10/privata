import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared/shared_theme.dart';
import '../../../../../../utils/constants_assets.dart';
import '../../../../../../utils/constants_strings.dart';
import '../../../../../helpers/text_helper.dart';
import '../../../../widgets/buttons/buttons.dart';

import '../controllers/subscribe_controller.dart';
import '../widget/builder_item_subscribe.dart';
import '../widget/builder_item_voucher.dart';

class SubscribeView extends GetView<SubscribeController> {
  const SubscribeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Langganan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: builderForm(context),
      ),
      bottomSheet: builderBottomSheet(context),
    );
  }

  Widget builderForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: controller.formKey,
          child: Column(
            children: [
              builderProduct(context),
              const SizedBox(height: 12),
              builderDuration(context),
              const SizedBox(height: 12),
              builderVoucher(context),
            ],
          ),
        ),
        const SizedBox(height: 20),
        builderPackage(context),
        Obx(
          () => SizedBox(
            height: controller.isExpandedBottomSheet.value ? 360 : 200,
          ),
        ),
      ],
    );
  }

  Widget builderProduct(BuildContext context) {
    return Obx(
      () => BuilderItemSubscribe<SubscriptionProduct>(
        controller: controller.productC,
        node: controller.productF,
        title: 'Produk',
        hint: 'Pilih Produk',
        titleModal: 'Pilih Produk Langganan',
        data: SubscriptionProduct.values,
        groupValue: controller.product.value,
        onChanged: controller.setProduct,
      ),
    );
  }

  Widget builderDuration(BuildContext context) {
    return Obx(
      () => BuilderItemSubscribe(
        controller: controller.durationC,
        node: controller.durationF,
        title: ConstantsStrings.titleDuration,
        hint: ConstantsStrings.hintDuration,
        titleModal: ConstantsStrings.titleModalDuration,
        data: ConstantsStrings.duration,
        groupValue: controller.duration.value,
        onChanged: controller.setDuration,
      ),
    );
  }

  Widget builderVoucher(BuildContext context) {
    return BuilderItemVoucher(
      ctr: controller.voucherC,
      node: controller.voucherF,
      title: ConstantsStrings.titleVoucher,
      hint: ConstantsStrings.hintVoucher,
      titleModal: ConstantsStrings.titleModalVoucher,
    );
  }

  Widget builderPackage(BuildContext context) {
    final textTheme = context.textTheme;

    return Obx(
      () {
        final product = controller.product;
        List<Color>? gradientColors;
        String? titleText;
        String? descriptionText;

        switch (product.value) {
          case SubscriptionProduct.clinica:
            gradientColors = [
              const Color(0xFF3170E9),
              const Color(0xFF33A0DC),
            ];
            titleText = 'Clinica Pro';
            descriptionText =
                'Kendalikan dan monitor klinik Anda dengan cepat dan mudah. Berbagai fitur lengkap mulai dari pendaftaran pasien, antrian poli, rekam medis (EMR), odontogram, apotek, stock inventory, kasir hingga pelaporan lengkap dengan Software Rumah Sakit Hospita.';
          case SubscriptionProduct.hospita:
            gradientColors = [
              const Color(0xFFEB80A7),
              const Color(0xFFF53B7F),
            ];
            titleText = 'Hospita';
            descriptionText =
                'Software Rumah Sakit Assist.id dengan berbagai fitur untuk profesionalitas bisnis Anda';
          case SubscriptionProduct.privata:
            gradientColors = [
              const Color(0xFF636C7E),
              const Color(0xFF171C26),
            ];
            titleText = 'Privata';
            descriptionText =
                'Anda kini dapat lebih fokus dalam memberikan pelayanan kesehatan kepada pasien dan tidak perlu lagi pusing mengenai pencarian data rekam medis yang tercecer ataupun waktu yang lama saat dicari.';
          case SubscriptionProduct.pharma:
            gradientColors = [
              const Color(0xFF84CC45),
              const Color(0xFF17B18C),
            ];
            titleText = 'Pharma';
            descriptionText =
                'Temukan potensi maksimal dari apotek Anda, pencatatan secara mendetail obat keluar dan masuk. Apotek Anda memiliki multi lokasi penyimpanan obat? Tidak masalah, Software Apotek Pharma dilengkapi dengan fitur depot. Pharma juga memiliki fitur POS khuus untuk apotek Anda.';
          default:
        }

        return Visibility(
          visible: product.value != null,
          child: Card.filled(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColors ?? [],
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    titleText ?? '-',
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(ConstantsAssets.imgPackages),
                      const SizedBox(height: 10),
                      AutoSizeText(
                        descriptionText ?? '-',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget builderBottomSheet(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.product.value != null &&
            controller.duration.value != null,
        child: BottomSheet(
          animationController: controller.animBottomSheetC,
          enableDrag: false,
          showDragHandle: true,
          onClosing: () {},
          builder: (context) => builderContentBottomSheet(context),
        ),
      ),
    );
  }

  Widget builderContentBottomSheet(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: AnimatedSize(
        duration: Durations.long4,
        curve: Curves.easeInOut,
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Visibility(
                visible: controller.isExpandedBottomSheet.value,
                maintainState: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          'Rincian Pembayaran',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: SharedTheme.semiBold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        IconButton(
                          onPressed: () =>
                              controller.expandedBottomSheet(false),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          alignment: Alignment.topCenter,
                          visualDensity: VisualDensity.compact,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Obx(
                      () => builderItemInfoPayment(
                        prefixText:
                            '${TextHelper.capitalizeEachWords(controller.product.value?.name)} (${controller.duration.value ?? '-'})',
                        suffixText: 'Rp800.000',
                        prefixStyle: textTheme.bodyMedium,
                        suffixStyle: textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 21),
                    builderItemInfoPayment(
                      prefixText: 'Biaya Layanan',
                      suffixText: 'Rp10.000',
                      prefixStyle: textTheme.bodyMedium,
                      suffixStyle: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 21),
                    builderItemInfoPayment(
                      prefixText: 'Diskon Voucher',
                      suffixText: '-Rp10.000',
                      prefixStyle: textTheme.bodyMedium,
                      suffixStyle: textTheme.bodyMedium?.copyWith(
                        color:
                            Get.isDarkMode ? Colors.greenAccent : Colors.green,
                      ),
                    ),
                    const SizedBox(height: 21),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Obx(
                        () => builderItemInfoPayment(
                          prefixText: TextHelper.capitalizeEachWords(
                                  controller.product.value?.name) ??
                              '',
                          prefixStyle: textTheme.bodyMedium
                              ?.copyWith(color: theme.hintColor),
                          suffixText: 'Total Harga',
                          suffixStyle: textTheme.bodyMedium
                              ?.copyWith(color: theme.hintColor),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Obx(
                        () => builderItemInfoPayment(
                          prefixText: controller.duration.value ?? '-',
                          prefixStyle: textTheme.bodyMedium
                              ?.copyWith(fontWeight: SharedTheme.semiBold),
                          suffixText: 'Rp810.000',
                          suffixStyle: textTheme.bodyMedium?.copyWith(
                            fontWeight: SharedTheme.semiBold,
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Obx(
                  () => AnimatedCrossFade(
                    crossFadeState: (controller.isExpandedBottomSheet.value)
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: Durations.long4,
                    firstChild: IconButton(
                      onPressed: () => controller.expandedBottomSheet(true),
                      icon: const Icon(Icons.keyboard_arrow_up_rounded),
                      alignment: Alignment.topCenter,
                      visualDensity: VisualDensity.compact,
                    ),
                    secondChild: const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(
              () => Buttons.filled(
                width: double.infinity,
                onPressed: controller.moveToPayment,
                state: controller.isLoading.value,
                child: const Text('Lanjutkan Pembayaran'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget builderItemInfoPayment({
    required String prefixText,
    TextStyle? prefixStyle,
    required String suffixText,
    TextStyle? suffixStyle,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            prefixText,
            style: prefixStyle,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            suffixText,
            textAlign: TextAlign.end,
            style: suffixStyle,
          ),
        ),
      ],
    );
  }
}
