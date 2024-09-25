import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:privata/app/data/models/range/range_model.dart';
import 'package:privata/app/helpers/validations.dart';
import 'package:privata/app/modules/widgets/textformfield/text_form_fields.dart';

import '../../../../helpers/helper.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/card/cards.dart';
import '../controllers/emr_controller.dart';
import '../controllers/search_action_controller.dart';

class EmrView extends GetView<EmrController> {
  const EmrView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('EMR'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.moveToTimelineEMR,
            icon: const Icon(Icons.view_timeline_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Obx(() {
              final itemRJ = controller.itemRJ.value;
              final patient = itemRJ?.pasiens;

              var gender = '-';

              if (patient?.gender != null) {
                gender = patient!.gender == 1 ? 'Laki-laki' : 'Perempuan';
              }

              return builderCard(
                [
                  AutoSizeText(
                    '${patient?.nama ?? '-'}, ${Helper.getAge(patient?.tanggalLahir)} Thn, $gender',
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 4),
                  AutoSizeText(
                    // 'MR0000000039, Use Apps',
                    '${patient?.ph?.first.code ?? '-'}, Use Apps, ${itemRJ?.paymentMethod ?? '-'}',
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  AutoSizeText(
                    'Tenaga Medis : ${itemRJ?.doctorName ?? '-'}',
                    style: textTheme.bodyMedium,
                  ),
                ],
              );
            }),
            const SizedBox(height: 16),
            builderCard(
              [
                builderPatientComplaint(),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: builderHeight()),
                    const SizedBox(width: 8),
                    Expanded(child: builderWeight()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: builderTemperature()),
                    const SizedBox(width: 8),
                    Expanded(child: builderPulse()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: builderBreath()),
                    const SizedBox(width: 8),
                    Expanded(child: builderBloodSugar()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: builderSystole()),
                    const SizedBox(width: 8),
                    Expanded(child: builderDiastole()),
                  ],
                ),
                const SizedBox(height: 12),
                builderAction(context, textTheme),
                const SizedBox(height: 12),
                builderDrug(context, textTheme),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget builderCard(List<Widget> widgets) {
    return Cards.elevated(
      inPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 21,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: widgets,
        ),
      ),
    );
  }

  Widget builderPatientComplaint() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.patientComplaintC,
        focusNode: controller.patientComplaintF,
        title: 'Keluhan Pasien',
        hintText: 'Misal Pusing dsb',
        suffixIconState: controller.patientComplaint.value.isNotEmpty,
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        validator: (value) => Validation.formField(
          titleField: 'Keluhan Pasien',
          value: value,
        ),
      ),
    );
  }

  Widget builderHeight() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.heightC,
        focusNode: controller.heightF,
        title: 'Tinggi',
        hintText: 'Misal 175 cm',
        suffixText: 'cm',
        suffixIconState: controller.height.value.isNotEmpty,
        maxLength: 3,
        keyboardType: TextInputType.number,
        onFieldSubmitted: (_) => controller.weightF.requestFocus(),
        validator: (value) => Validation.formField(
          titleField: 'Tinggi',
          value: value,
          isNumericOnly: true,
          isNotZero: true,
          range: RangeModel(
            minRange: 30,
            maxRange: 250,
            type: 'cm',
          ),
        ),
      ),
    );
  }

  Widget builderWeight() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.weightC,
        focusNode: controller.weightF,
        title: 'Berat',
        hintText: 'Misal 60 kg',
        suffixText: 'Kg',
        suffixIconState: controller.weight.value.isNotEmpty,
        maxLength: 3,
        keyboardType: TextInputType.number,
        onFieldSubmitted: (_) => controller.temperatureF.requestFocus(),
        validator: (value) => Validation.formField(
          titleField: 'Berat',
          value: value,
          isNumericOnly: true,
          isNotZero: true,
          range: RangeModel(
            minRange: 2,
            maxRange: 300,
            type: 'kg',
          ),
        ),
      ),
    );
  }

  Widget builderTemperature() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.temperatureC,
        focusNode: controller.temperatureF,
        title: 'Suhu',
        hintText: 'Misal 37 Celcius',
        suffixText: '°C',
        suffixIconState: controller.temperature.value.isNotEmpty,
        maxLength: 2,
        keyboardType: TextInputType.number,
        onFieldSubmitted: (_) => controller.pulseF.requestFocus(),
        validator: (value) => Validation.formField(
          titleField: 'Suhu',
          value: value,
          isNumericOnly: true,
          isNotZero: true,
          range: RangeModel(
            minRange: 25,
            maxRange: 45,
            type: '°C',
          ),
        ),
      ),
    );
  }

  Widget builderPulse() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.pulseC,
        focusNode: controller.pulseF,
        title: 'Denyut',
        hintText: 'Misal 95 hbpm',
        suffixText: 'hbpm',
        suffixIconState: controller.pulse.value.isNotEmpty,
        maxLength: 3,
        keyboardType: TextInputType.number,
        onFieldSubmitted: (_) => controller.breathF.requestFocus(),
        validator: (value) => Validation.formField(
          titleField: 'Denyut',
          value: value,
          isNumericOnly: true,
          isNotZero: true,
          range: RangeModel(
            minRange: 30,
            maxRange: 160,
            type: 'hbpm',
          ),
        ),
      ),
    );
  }

  Widget builderBreath() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.breathC,
        focusNode: controller.breathF,
        title: 'Nafas',
        hintText: 'Misal 12 bpm',
        suffixText: 'bpm',
        suffixIconState: controller.breath.value.isNotEmpty,
        maxLength: 3,
        keyboardType: TextInputType.number,
        onFieldSubmitted: (_) => controller.bloodSugarF.requestFocus(),
        validator: (value) => Validation.formField(
          titleField: 'Nafas',
          value: value,
          isNumericOnly: true,
          isNotZero: true,
          range: RangeModel(
            minRange: 5,
            maxRange: 70,
            type: 'bpm',
          ),
        ),
      ),
    );
  }

  Widget builderBloodSugar() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.bloodSugarC,
        focusNode: controller.bloodSugarF,
        title: 'Gula Darah',
        hintText: 'Misal 140 mmHg',
        suffixText: 'mmHg',
        suffixIconState: controller.bloodSugar.value.isNotEmpty,
        maxLength: 3,
        keyboardType: TextInputType.number,
        onFieldSubmitted: (_) => controller.systoleF.requestFocus(),
        validator: (value) => Validation.formField(
          titleField: 'Gula Darah',
          value: value,
          isNumericOnly: true,
          isNotZero: true,
        ),
      ),
    );
  }

  Widget builderSystole() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.systoleC,
        focusNode: controller.systoleF,
        title: 'Systole',
        hintText: 'Misal 90 mmHg',
        suffixText: 'mmHg',
        suffixIconState: controller.systole.value.isNotEmpty,
        maxLength: 3,
        keyboardType: TextInputType.number,
        onFieldSubmitted: (_) => controller.diastoleF.requestFocus(),
        validator: (value) => Validation.formField(
          titleField: 'Systole',
          value: value,
          isNumericOnly: true,
          isNotZero: true,
          range: RangeModel(
            minRange: 40,
            maxRange: 250,
            type: 'mmHg',
          ),
        ),
      ),
    );
  }

  Widget builderDiastole() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.diastoleC,
        focusNode: controller.diastoleF,
        title: 'Diastole',
        hintText: 'Misal 60 mmHg',
        suffixText: 'mmHg',
        suffixIconState: controller.diastole.value.isNotEmpty,
        maxLength: 3,
        keyboardType: TextInputType.number,
        validator: (value) => Validation.formField(
          titleField: 'Diastole',
          value: value,
          isNumericOnly: true,
          isNotZero: true,
          range: RangeModel(
            minRange: 30,
            maxRange: 180,
            type: 'mmHg',
          ),
        ),
      ),
    );
  }

  Widget builderAction(BuildContext context, TextTheme textTheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Tindakan',
              style: textTheme.titleLarge,
            ),
            IconButton(
              onPressed: () =>
                  controller.showActionDialog(type: SearchType.action),
              icon: const Icon(Icons.add_rounded),
              tooltip: 'Tambah Tindakan',
            ),
          ],
        ),
        const SizedBox(height: 4),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final title = controller.listAction[index].title;
              final price = controller.listAction[index].price;

              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(title),
                titleTextStyle: textTheme.titleMedium,
                subtitle: Text('Rp. $price'),
                trailing: Buttons.text(
                  onPressed: () {},
                  child: const Text('Coret'),
                ),
              );
            },
            itemCount: controller.listAction.length,
          ),
        ),
      ],
    );
  }

  Widget builderDrug(BuildContext context, TextTheme textTheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Obat',
              style: textTheme.titleLarge,
            ),
            IconButton(
              onPressed: () =>
                  controller.showActionDialog(type: SearchType.drugs),
              icon: const Icon(Icons.add_rounded),
              tooltip: 'Tambah Obat',
            ),
          ],
        ),
        const SizedBox(height: 4),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final title = controller.listDrugs[index].title;
              final price = controller.listDrugs[index].price;

              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(title),
                titleTextStyle: textTheme.titleMedium,
                subtitle: Text('Rp. $price'),
                trailing: builderCross(context),
              );
            },
            itemCount: controller.listDrugs.length,
          ),
        ),
      ],
    );
  }

  Widget builderCross(BuildContext context) {
    return Buttons.text(
      onPressed: () {
        showAdaptiveDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            title: const Text('Perhatian'),
            content: const Text(
              'Apakah anda ingin mencoret tindakan ini?',
            ),
            actions: [
              Buttons.text(
                onPressed: () => Get.back(),
                child: const Text('Tidak'),
              ),
              Buttons.text(
                onPressed: () => Get.back(),
                child: const Text('Ya'),
              ),
            ],
          ),
        );
      },
      child: const Text('Coret'),
    );
  }
}
