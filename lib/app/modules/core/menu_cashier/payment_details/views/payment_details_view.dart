import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/helpers/currency_input_formatter.dart';
import 'package:privata/app/helpers/text_helper.dart';

import '../../../../../../shared/shared_enum.dart';
import '../../../../../../shared/shared_theme.dart';
import '../../../../../../utils/constants_strings.dart';
import '../../../../../helpers/validations.dart';
import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/card/cards.dart';
import '../../../../widgets/search/search_bars.dart';
import '../../../../widgets/textformfield/custom_dropdown_type_form_field.dart';
import '../../../../widgets/textformfield/custom_textform_field.dart';
import '../controllers/payment_details_controller.dart';

class PaymentDetailsView extends GetView<PaymentDetailsController> {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _builderAppBar(),
      body: _builderBody(context),
    );
  }

  PreferredSizeWidget _builderAppBar() {
    return AppBar(
      title: const Text('Pembayaran'),
      centerTitle: true,
    );
  }

  Widget _builderBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: SizedBox(
        width: double.infinity,
        child: Cards.elevated(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _builderPaymentTotal(context),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              _builderPaymentMethod(context),
              _builderPaymentBPJSMethod(context),
              _builderPaymentOtherMethod(context),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              _builderChipAmountPaid(context),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              _builderCalculatePayments(context),
              const SizedBox(height: 32),
              _builderPay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builderPaymentTotal(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Total Biaya',
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Chip(
          label: Text(
            TextHelper.formatRupiah(
              amount: controller.data.fixTotalFee,
              isCompact: false,
            ),
          ),
        )
      ],
    );
  }

  Widget _builderPaymentMethod(BuildContext context) {
    final textTheme = context.textTheme;

    final listMethod = [
      ...ConstantsStrings.dataMethodPayment.take(1),
      'Lainnya'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Metode Pembayaran',
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: listMethod
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: Obx(
                      () => ChoiceChip(
                        label: Text(e),
                        selected: controller.selectedChipMetodePembayaran.value
                                ?.toLowerCase() ==
                            e.toLowerCase(),
                        onSelected: (value) =>
                            controller.selectedMethodPayment(e),
                        tooltip: e,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _builderPaymentBPJSMethod(BuildContext context) {
    return Obx(
      () {
        final isBPJS = controller.selectedMetodePembayaran.value ==
                MethodPayment.bpjsKesehatan ||
            controller.selectedMetodePembayaran.value ==
                MethodPayment.bpjsKetenagakerjaan;
        final title = switch (controller.selectedMetodePembayaran.value) {
          MethodPayment.bpjsKesehatan => 'BPJS Kesehatan',
          MethodPayment.bpjsKetenagakerjaan => 'BPJS Ketenagakerjaan',
          _ => ''
        };

        return Visibility(
          visible: isBPJS,
          child: _builderFormPayment(
            context: context,
            title: title,
            maxLength: 11,
            isBPJS: true,
          ),
        );
      },
    );
  }

  Widget _builderPaymentOtherMethod(BuildContext context) {
    return Obx(
      () {
        final isOthers =
            controller.selectedMetodePembayaran.value == MethodPayment.other;

        final title =
            switch (controller.selectedMetodePembayaranLainnya.value) {
          MethodPayment.insurance => 'Asuransi',
          MethodPayment.company => 'Perusahaan',
          MethodPayment.cardDebit => 'Kartu Debit',
          MethodPayment.cardCredit => 'Kartu Kredit',
          _ => ''
        };

        final methodPayment =
            ConstantsStrings.dataMethodPayment.skip(1).toList();
        methodPayment.removeLast();

        return Visibility(
          visible: isOthers,
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Obx(
                  () => CustomDropdownTypeFormField(
                    isRequired: true,
                    title: 'Metode Pembayaran Lainnya',
                    isFilled: true,
                    selectedItem: controller.metodePembayaran.value,
                    items: methodPayment,
                    onChanged: controller.onChangedPaymentOtherMethod,
                    validator: (value) => Validation.formField(
                      titleField: 'Metode pembayaran Lainnya',
                      value: value,
                      isRequired: true,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: controller.metodePembayaran.value != null,
                child: _builderFormPayment(
                  context: context,
                  title: title,
                  maxLength: null,
                  isBPJS: false,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _builderFormPayment({
    required BuildContext context,
    required String title,
    required int? maxLength,
    required bool isBPJS,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          if (!isBPJS)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: SearchBars.popup(
                context: context,
                controller: controller.namaPembayaranC,
                title: 'Nama $title',
                hintText: '',
                suggestions: [],
                onSuggestionTap: (item) {},
                state: controller.namaPembayaran.value != null &&
                    controller.namaPembayaran.value!.isNotEmpty,
                isRequired: true,
                isFilled: true,
              ),
            ),
          CustomTextFormField(
            controller: controller.nomorPembayaranC,
            focusNode: controller.nomorPembayaranF,
            isRequired: true,
            title: 'Nomor $title',
            isFilled: true,
            maxLines: 1,
            maxLength: maxLength,
            suffixIconState: controller.nomorPembayaran.value != null &&
                controller.nomorPembayaran.value!.isNotEmpty,
            keyboardType: TextInputType.number,
            validator: (value) => Validation.formField(
              titleField: 'Nomor $title',
              value: value,
              isRequired: true,
              isNumericOnly: true,
              minLengthChar: maxLength,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _builderChipAmountPaid(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Jumlah Dibayar',
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Wrap(
          runSpacing: 14,
          children: controller.listAmountPaid
              .map(
                (e) => Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: Obx(
                    () => ChoiceChip(
                      label: Text(
                        e is String
                            ? e
                            : TextHelper.formatRupiah(
                                amount: e as int,
                                isCompact: true,
                              ),
                      ),
                      selected: controller.selectedChipAmountPaid.value
                              ?.toLowerCase() ==
                          '$e'.toLowerCase(),
                      onSelected: (value) => controller.selectedAmountPaid(e),
                      showCheckmark: false,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 18),
        Obx(
          () => Visibility(
            visible: controller.selectedChipAmountPaid.value?.toLowerCase() ==
                'jumlah lain',
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: CustomTextFormField(
                controller: controller.jumlahLainC,
                title: 'Jumlah Lain',
                isFilled: true,
                inputFormatters: [
                  CurrencyInputFormatter(),
                ],
                keyboardType: TextInputType.number,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _builderCalculatePayments(BuildContext context) {
    final textTheme = context.textTheme;

    return Obx(
      () => Visibility(
        visible: controller.data.totalFee != null &&
            controller.selectedChipAmountPaid.value != null &&
            ((controller.jumlahLain.value ?? 0) >= 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              'Jumlah Dibayar',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            _builderItemCalculatePayments(
              textTheme: textTheme,
              title: 'Kembalian',
              amount: controller.calculatePayment(true),
            ),
            // const SizedBox(height: 4),
            // _builderItemCalculatePayments(
            //   textTheme: textTheme,
            //   title: 'Hutang',
            //   amount: controller.calculatePayment(false),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _builderItemCalculatePayments({
    required TextTheme textTheme,
    required String title,
    required int? amount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          title,
          style: textTheme.bodyMedium,
        ),
        const SizedBox(width: 12),
        AutoSizeText(
          TextHelper.formatRupiah(amount: amount),
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: SharedTheme.bold,
          ),
        ),
      ],
    );
  }

  Widget _builderPay() {
    return Obx(() {
      final isEnabled = !controller.isLoading.value &&
          controller.selectedChipMetodePembayaran.value != null &&
          controller.selectedChipAmountPaid.value != null;

      var isNotZeroAnotherAmount = false;

      if (controller.selectedChipAmountPaid.value?.toLowerCase() ==
          'jumlah lain') {
        isNotZeroAnotherAmount = (controller.jumlahLain.value ?? 0) > 0;
      } else {
        isNotZeroAnotherAmount = true;
      }

      return Buttons.filled(
        width: double.infinity,
        onPressed:
            (isEnabled && isNotZeroAnotherAmount) ? controller.pay : null,
        state: controller.isLoading.value,
        child: const Text('Bayar'),
      );
    });
  }
}
