import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/data/db/range/range_model.dart';
import 'package:privata/app/data/models/detail_rj/detail_rj_model.dart';
import 'package:privata/app/data/models/detail_rj/diagnoses/item_diagnoses/item_diagnoses_model.dart';
import 'package:privata/app/helpers/format_date_time.dart';
import 'package:privata/app/helpers/validations.dart';
import 'package:privata/app/modules/widgets/textformfield/custom_dropdown_type_form_field.dart';
import 'package:privata/app/modules/widgets/textformfield/custom_dropdown_type_form_field_multi_selection.dart';

import '../../../../helpers/helper.dart';
import '../../../../helpers/text_helper.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/card/cards.dart';
import '../../../widgets/dialog/dialogs.dart';
import '../../../widgets/textformfield/custom_textform_field.dart';
import '../controllers/emr_controller.dart';
import '../controllers/search_action_controller.dart';

class EmrView extends GetView<EmrController> {
  const EmrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builderAppBar(),
      body: builderBody(context),
    );
  }

  Widget builderBody(BuildContext context) {
    return controller.obx(
      (data) => builderContent(context, data),
      onLoading: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      onEmpty: builderContent(context, null),
      // onError: (error) => builderContent(),
    );
  }

  Widget builderContent(BuildContext context, DetailRJModel? data) {
    final textTheme = context.textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          builderHeader(textTheme),
          const SizedBox(height: 18),
          builderCard(
            [
              builderKeluhan(),
              const SizedBox(height: 18),
              builderRowVital(
                firstController: controller.lajuPernapasanC,
                secondController: controller.denyutNadiC,
                firstFocusNode: controller.lajuPernapasanF,
                secondFocusNode: controller.denyutNadiF,
                nextFocus: controller.tinggiBadanF,
                firstTitle: 'Laju Pernapasan',
                secondTitle: 'Denyut Nadi',
                firstSuffixText: 'bpm',
                secondSuffixText: 'hbpm',
                firstMaxLength: 2,
                secondMaxLength: 3,
                firstRangeValidation: RangeModel(
                  minRange: 5,
                  maxRange: 70,
                  type: 'bpm',
                ),
                secondRangeValidation: RangeModel(
                  minRange: 30,
                  maxRange: 160,
                  type: 'hbpm',
                ),
              ),
              const SizedBox(height: 18),
              builderRowVital(
                firstController: controller.tinggiBadanC,
                secondController: controller.beratBadanC,
                firstFocusNode: controller.tinggiBadanF,
                secondFocusNode: controller.beratBadanF,
                nextFocus: controller.gulaDarahF,
                firstTitle: 'Tinggi Badan',
                secondTitle: 'Berat Badan',
                firstSuffixText: 'cm',
                secondSuffixText: 'kg',
                firstMaxLength: 3,
                secondMaxLength: 3,
                firstRangeValidation: RangeModel(
                  minRange: 30,
                  maxRange: 250,
                  type: 'cm',
                ),
                secondRangeValidation: RangeModel(
                  minRange: 2,
                  maxRange: 300,
                  type: 'kg',
                ),
              ),
              const SizedBox(height: 18),
              builderRowVital(
                firstController: controller.gulaDarahC,
                secondController: controller.suhuTubuhC,
                firstFocusNode: controller.gulaDarahF,
                secondFocusNode: controller.suhuTubuhF,
                nextFocus: controller.lingkarPerutF,
                firstTitle: 'Gula Darah',
                secondTitle: 'Suhu Tubuh',
                firstSuffixText: 'mg/dL',
                secondSuffixText: '°C',
                secondMaxLength: 3,
                firstRangeValidation: RangeModel(
                  minRange: 0,
                  maxRange: 99999,
                  type: 'mg/dL',
                ),
                secondRangeValidation: RangeModel(
                  minRange: 25,
                  maxRange: 45,
                  type: '°C',
                ),
              ),
              const SizedBox(height: 18),
              builderRowVital(
                firstController: controller.lingkarPerutC,
                secondController: controller.saturasiOksigenC,
                firstFocusNode: controller.lingkarPerutF,
                secondFocusNode: controller.saturasiOksigenF,
                nextFocus: controller.darahSistolikF,
                firstTitle: 'Lingkar Perut',
                secondTitle: 'Saturasi Oksigen',
                firstSuffixText: 'cm',
                secondSuffixText: 'SpO2',
                firstMaxLength: 3,
                firstRangeValidation: RangeModel(
                  minRange: 25,
                  maxRange: 300,
                  type: 'cm',
                ),
                secondRangeValidation: RangeModel(
                  minRange: 1,
                  maxRange: 99999,
                  type: 'SpO2',
                ),
              ),
              const SizedBox(height: 18),
              builderRowVital(
                firstController: controller.darahSistolikC,
                secondController: controller.darahDiastolikC,
                firstFocusNode: controller.darahSistolikF,
                secondFocusNode: controller.darahDiastolikF,
                firstTitle: 'Tekanan Darah Sistolik',
                secondTitle: 'Tekanan Darah Diastolik',
                firstSuffixText: 'mmHg',
                secondSuffixText: 'mmHg',
                firstMaxLength: 3,
                secondMaxLength: 3,
                firstRangeValidation: RangeModel(
                  minRange: 40,
                  maxRange: 250,
                  type: 'mmHg',
                ),
                secondRangeValidation: RangeModel(
                  minRange: 30,
                  maxRange: 180,
                  type: 'mmHg',
                ),
              ),
              const SizedBox(height: 18),
              builderDiagnosis(context),
              const SizedBox(height: 18),
              builderProcedure(context),
              const SizedBox(height: 18),
              builderDrug(context),
              const SizedBox(height: 18),
              builderSave(),
              const SizedBox(height: 18),
            ],
          ),
        ],
      ),
    );
  }

  AppBar builderAppBar() {
    return AppBar(
      title: const Text('EMR'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: controller.moveToTimelineEMR,
          icon: const Icon(Icons.view_timeline_rounded),
        )
      ],
    );
  }

  Widget builderHeader(TextTheme textTheme) {
    return Builder(builder: (context) {
      final itemRJ = controller.data;
      final patient = itemRJ.pasiens;

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
            '${patient?.ph?.first.code ?? '-'}, Use Apps, ${itemRJ.paymentMethod ?? '-'}',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          AutoSizeText(
            'Tenaga Medis : ${itemRJ.doctorName ?? '-'}',
            style: textTheme.bodyMedium,
          ),
        ],
      );
    });
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

  Widget builderKeluhan() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.keluhanC,
        focusNode: controller.keluhanF,
        title: 'Keluhan',
        hintText: 'Isi Keluhan',
        isFilled: true,
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        suffixIconState: controller.keluhan.value.isNotEmpty,
        validator: (value) => Validation.formField(
          titleField: 'Keluhan',
          value: value,
          isRequired: false,
        ),
      ),
    );
  }

  Widget builderRowVital({
    required TextEditingController firstController,
    required TextEditingController secondController,
    required FocusNode firstFocusNode,
    required FocusNode secondFocusNode,
    required String firstTitle,
    required String secondTitle,
    int? firstMaxLength,
    int? secondMaxLength,
    FocusNode? nextFocus,
    required String firstSuffixText,
    required String secondSuffixText,
    required RangeModel firstRangeValidation,
    required RangeModel secondRangeValidation,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: firstController,
            focusNode: firstFocusNode,
            title: firstTitle,
            hintText: 'Isi ${firstTitle.toLowerCase()}',
            hintMaxLines: 1,
            isFilled: true,
            isNumericOnly: true,
            maxLength: firstMaxLength,
            suffixText: firstSuffixText,
            keyboardType: TextInputType.number,
            validator: (value) => Validation.formField(
              value: value,
              titleField: TextHelper.capitalizeEachWords(firstTitle) ?? '',
              isNotZero: true,
              isNumericOnly: true,
              range: firstRangeValidation,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomTextFormField(
            controller: secondController,
            focusNode: secondFocusNode,
            title: secondTitle,
            hintText: 'Isi ${secondTitle.toLowerCase()}',
            hintMaxLines: 1,
            isFilled: true,
            isNumericOnly: true,
            maxLength: secondMaxLength,
            suffixText: secondSuffixText,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (_) => nextFocus?.nextFocus(),
            validator: (value) => Validation.formField(
              value: value,
              titleField: TextHelper.capitalizeEachWords(secondTitle) ?? '',
              isNotZero: true,
              isNumericOnly: true,
              range: secondRangeValidation,
            ),
          ),
        ),
      ],
    );
  }

  Widget builderDiagnosis(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Diagnosa',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Obx(
          () => Wrap(
            spacing: 8,
            runSpacing: 12,
            children: controller.itemsDiagnoses.map(
              (e) {
                final keyword = e.name?.firstOrNull?.keyword ?? '-';
                final (code, description) =
                    TextHelper.extractCodeAndDescription(
                  input: keyword,
                );
                final date = FormatDateTime.dateToString(
                  newPattern: 'dd MMMM yyyy HH:mm',
                  value: e.createdAt,
                );
                var writeBy = 'Ditulis oleh ${e.createdName ?? '-'}';
                var streakBy = '-';
                var isStroke = false;

                if (e.streakName != null) {
                  streakBy = 'Dicoret oleh ${e.streakName}';
                  isStroke = true;
                }

                return InputChip(
                  onPressed: () {
                    Dialogs.alert(
                      context: context,
                      title: 'Diagnosa',
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            keyword,
                            style: textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 32),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(writeBy),
                                if (e.streakName != null)
                                  Text(
                                    streakBy,
                                    style: TextStyle(
                                      color: theme.colorScheme.error,
                                    ),
                                  ),
                                const SizedBox(height: 8),
                                Text(date),
                              ],
                            ),
                          ),
                        ],
                      ),
                      isSingleAction: true,
                    );
                  },
                  avatar: CircleAvatar(
                    backgroundColor: theme.focusColor,
                    child: Text(
                      e.createdName?[0] ?? '-',
                      style: textTheme.labelMedium,
                    ),
                  ),
                  label: Text(
                    code,
                    style: TextStyle(
                      decoration: isStroke ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  color: WidgetStatePropertyAll(
                    theme.colorScheme.primaryContainer,
                  ),
                  deleteButtonTooltipMessage: 'Coret Diagnosa',
                  deleteIcon: const Icon(Icons.clear_rounded),
                  onDeleted: () async {
                    final state = await Dialogs.alert(
                      context: context,
                      title: 'Perhatian',
                      content: Text(
                        'Apakah anda yakin ingin mencoret diagnosa $description ini ?',
                      ),
                      textYes: 'Coret',
                    );

                    if (state != null) {
                      if (state) {
                        controller.strokeDiagnose(e.id);
                      }
                    }
                  },
                );
              },
            ).toList(),
          ),
        ),
        const SizedBox(height: 21),
        CustomDropdownTypeFormField(
          title: 'Pilih Diagnosa',
          hintText: 'Pilih Diagnosa',
          hintTextSearch: 'Cari Diagnosa',
          isLabel: true,
          isShowSearchBox: true,
          asyncItems: controller.filterDiagnoses,
          itemAsString: (value) => value.description ?? '',
          onBeforeChange: controller.addDiagnosa,
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

  Widget builderProcedure(BuildContext context) {
    final textTheme = context.textTheme;
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
              onPressed: () => controller.showActionDialog(
                type: SearchType.procedure,
              ),
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
              final name = controller.resultProcedures[index].name;
              final fee = controller.resultProcedures[index].basicFee;

              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(name ?? '-'),
                titleTextStyle: textTheme.titleMedium,
                subtitle: Text(
                    TextHelper.formatRupiah(amount: fee, isCompact: false) ??
                        'Rp. 0'),
                trailing: Buttons.text(
                  onPressed: () {},
                  child: const Text('Coret'),
                ),
              );
            },
            itemCount: controller.resultProcedures.length,
          ),
        ),
      ],
    );
  }

  Widget builderDrug(BuildContext context) {
    final textTheme = context.textTheme;

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

  // Widget builderDrug() {
  //   return Obx(
  //     () => CustomTextFormField(
  //       controller: controller.obatC,
  //       focusNode: controller.obatF,
  //       title: 'Obat',
  //       hintText: 'Isi Obat',
  //       isFilled: true,
  //       keyboardType: TextInputType.multiline,
  //       maxLines: 5,
  //       suffixIconState: controller.obat.value.isNotEmpty,
  //       validator: (value) => Validation.formField(
  //         titleField: 'Obat',
  //         value: value,
  //         isRequired: false,
  //       ),
  //     ),
  //   );
  // }

  Widget builderSave() {
    return Obx(
      () => Buttons.filled(
        width: double.infinity,
        state: controller.isLoading.value,
        onPressed: !controller.isLoading.value ? controller.save : null,
        child: const Text('Simpan'),
      ),
    );
  }
}
