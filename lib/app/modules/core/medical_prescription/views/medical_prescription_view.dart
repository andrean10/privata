import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/modules/widgets/textformfield/text_form_fields.dart';
import 'package:privata/shared/shared_theme.dart';

import '../../../../../utils/constants_strings.dart';
import '../../../../helpers/validations.dart';
import '../../../widgets/buttons/buttons.dart';
import '../controllers/medical_prescription_controller.dart';

class MedicalPrescriptionView extends GetView<MedicalPrescriptionController> {
  const MedicalPrescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep Obat'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            builderHeader(),
            const SizedBox(height: 24),
            builderMedicineName(),
            const SizedBox(height: 24),
            builderAmountMedicine(theme),
            const SizedBox(height: 24),
            builderMedicineUnit(context),
            const SizedBox(height: 24),
            builderDrinkingRules(),
            const Spacer(),
            builderConfirm(),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }

  Widget builderHeader() {
    return const AutoSizeText(
      'Silahkan isi resep obat yang ingin anda tambahkan untuk pasien.',
      minFontSize: 16,
    );
  }

  Widget builderMedicineName() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.medicineNameC,
        focusNode: controller.medicineNameF,
        title: ConstantsStrings.medicineName,
        hintText: ConstantsStrings.hintMedicineName,
        suffixIconState: controller.medicineName.value.isNotEmpty,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.medicineName,
        ),
        onFieldSubmitted: (_) => controller.nextFocus(controller.medicineUnitF),
      ),
    );
  }

  Widget builderAmountMedicine(ThemeData theme) {
    final textTheme = theme.textTheme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text('Jumlah Obat'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => IconButton.filledTonal(
              onPressed: (controller.amountMedicine.value != 0)
                  ? controller.decrementAmountMedicine
                  : null,
              icon: const Icon(Icons.remove_rounded),
            ),
          ),
          const SizedBox(width: 16),
          Obx(
            () => Text(
              '${controller.amountMedicine.value}',
              style:
                  textTheme.labelLarge?.copyWith(fontWeight: SharedTheme.bold),
            ),
          ),
          const SizedBox(width: 16),
          IconButton.filled(
            onPressed: controller.incrementAmountMedicine,
            icon: Icon(
              Icons.add_rounded,
              color: theme.colorScheme.surface,
            ),
          )
        ],
      ),
    );
  }

  Widget builderMedicineUnit(BuildContext context) {
    return TextFormFields.outlined(
      controller: controller.medicineUnitC,
      focusNode: controller.medicineUnitF,
      title: 'Satuan Obat',
      hintText: 'Pilih Satuan Obat',
      isReadOnly: true,
      suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
      onTap: () {
        showModalBottomSheet(
          showDragHandle: true,
          context: context,
          builder: (_) => Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: ConstantsStrings.dataMedicineUnit
                  .map(
                    (value) => RadioListTile.adaptive(
                      title: Text(value),
                      value: value,
                      groupValue: controller.medicineUnit.value,
                      onChanged: controller.setMedicineUnit,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  Widget builderDrinkingRules() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.drinkingRulesC,
        focusNode: controller.drinkingRulesF,
        title: ConstantsStrings.drinkingRules,
        hintText: ConstantsStrings.hintdrinkingRules,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.done,
        suffixIconState: controller.drinkingRules.value.isNotEmpty,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.drinkingRules,
        ),
        onFieldSubmitted: (_) => controller.confirm(),
      ),
    );
  }

  Widget builderConfirm() {
    return Buttons.filled(
      width: double.infinity,
      onPressed: controller.confirm,
      child: const Text(ConstantsStrings.save),
    );
  }
}
