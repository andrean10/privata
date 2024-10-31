import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/data/db/range/range_model.dart';
import 'package:privata/app/data/models/detail_rj/detail_rj_model.dart';
import 'package:privata/app/helpers/format_date_time.dart';
import 'package:privata/app/helpers/validations.dart';
import 'package:privata/app/modules/widgets/textformfield/custom_dropdown_type_form_field.dart';

import '../../../../../utils/constants_strings.dart';
import '../../../../helpers/helper.dart';
import '../../../../helpers/text_helper.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/card/cards.dart';
import '../../../widgets/dialog/dialogs.dart';
import '../../../widgets/textformfield/custom_textform_field.dart';
import '../controllers/emr_controller.dart';

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
          const SizedBox(height: 8),
          Form(
            key: controller.formKey,
            child: builderCard(
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
                  firstTitle: 'Sistolik',
                  secondTitle: 'Diastolik',
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
                builderSave(context),
                const SizedBox(height: 18),
              ],
            ),
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
          tooltip: 'Timeline',
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
        // hintText: 'Isi Keluhan',
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
            // hintText: 'Isi ${firstTitle.toLowerCase()}',
            // hintMaxLines: 1,
            isFilled: true,
            isNumericOnly: true,
            maxLength: firstMaxLength,
            suffixText: firstSuffixText,
            keyboardType: TextInputType.number,
            validator: (value) => Validation.formField(
              value: value,
              titleField: TextHelper.capitalizeEachWords(firstTitle) ?? '',
              isRequired: false,
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
            // hintText: 'Isi ${secondTitle.toLowerCase()}',
            // hintMaxLines: 1,
            isFilled: true,
            isNumericOnly: true,
            maxLength: secondMaxLength,
            suffixText: secondSuffixText,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (_) => nextFocus?.nextFocus(),
            validator: (value) => Validation.formField(
              value: value,
              titleField: TextHelper.capitalizeEachWords(secondTitle) ?? '',
              isRequired: false,
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
                final (code, _) = TextHelper.extractCodeAndDescription(
                  input: keyword,
                );
                final writeBy = e.createdName;
                final streakBy = e.streakName;
                final date = FormatDateTime.dateToString(
                  newPattern: 'dd MMMM yyyy HH:mm',
                  value: e.createdAt,
                );
                final isStroke = e.streakId != null && streakBy != null;

                return InputChip(
                  onPressed: () => _showDialogInfo(
                    context: context,
                    title: 'Diagnosa',
                    name: keyword,
                    writeBy: writeBy,
                    streakBy: streakBy,
                    date: date,
                  ),
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
                  deleteIcon:
                      (!isStroke) ? const Icon(Icons.clear_rounded) : null,
                  onDeleted: (!isStroke)
                      ? () async {
                          final state = await _showCrossAlertDialog(
                            context: context,
                            type: 'diagnosa',
                            description: keyword,
                          );

                          if (state != null) {
                            if (state) {
                              controller.strokeDiagnose(e.id);
                            }
                          }
                        }
                      : null,
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
              style: textTheme.titleMedium,
            ),
            IconButton(
              onPressed: controller.showProcedureDialog,
              icon: const Icon(Icons.add_rounded),
              tooltip: 'Tambah Tindakan',
            ),
          ],
        ),
        const SizedBox(height: 4),
        Obx(
          () => Cards.filled(
            context: context,
            inPadding: EdgeInsets.zero,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = controller.itemsProcedures[index];
                final name = item.procedureName;
                final basicFee = item.basicFee;
                final discountFee = item.discountFee;
                final totalFee = item.totalFee;
                final writeBy = item.createdName;
                final fee = item.basicFee;
                final streakBy = item.streakName;
                final date = FormatDateTime.dateToString(
                  newPattern: 'dd MMMM yyyy HH:mm',
                  value: item.createdAt,
                );
                final isStroke = item.streakId != null || streakBy != null;

                return ListTile(
                  onTap: () => _showDialogInfo(
                    context: context,
                    title: 'Tindakan',
                    name: name,
                    basicFee: basicFee,
                    discountFee: discountFee,
                    totalFee: totalFee,
                    writeBy: writeBy,
                    streakBy: streakBy,
                    date: date,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  title: Text(name ?? '-'),
                  titleTextStyle: textTheme.titleMedium?.copyWith(
                    decoration: isStroke ? TextDecoration.lineThrough : null,
                  ),
                  subtitle: Text(
                    TextHelper.formatRupiah(
                      amount: fee,
                      isCompact: false,
                    ),
                  ),
                  subtitleTextStyle: textTheme.bodyMedium?.copyWith(
                    decoration: isStroke ? TextDecoration.lineThrough : null,
                  ),
                  trailing: (!isStroke)
                      ? IconButton(
                          onPressed: () async {
                            final state = await _showCrossAlertDialog(
                              context: context,
                              type: 'tindakan',
                              description: name ?? '',
                            );

                            if (state != null) {
                              if (state) {
                                controller.strokeProcedure(index, item.id);
                              }
                            }
                          },
                          icon: const Icon(Icons.clear_rounded),
                        )
                      : null,
                );
              },
              itemCount: controller.itemsProcedures.length,
            ),
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
              style: textTheme.titleMedium,
            ),
            IconButton(
              onPressed: () => controller.showDrugsModal(context),
              icon: const Icon(Icons.add_rounded),
              tooltip: 'Tambah Obat',
            ),
          ],
        ),
        const SizedBox(height: 4),
        Obx(
          () => Cards.filled(
            context: context,
            inPadding: EdgeInsets.zero,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = controller.itemsDrugs[index];
                final name = item.medicineName ?? '-';
                final quantity = item.quantity;
                final unit = item.unit;
                final cigna = item.cigna;
                final basicFee = item.basicFee;
                final totalFee = item.totalFee;
                final writeBy = item.createdName;
                final streakBy = item.streakName;
                final date = FormatDateTime.dateToString(
                  newPattern: 'dd MMMM yyyy HH:mm',
                  value: item.createdAt,
                );
                final isStroke =
                    item.streakId != null && item.streakName != null;

                return ListTile(
                  onTap: () => _showDialogInfo(
                    context: context,
                    title: 'Obat',
                    name: name,
                    quantity: quantity,
                    unit: unit,
                    cigna: cigna,
                    basicFee: basicFee?.toInt(),
                    totalFee: totalFee,
                    writeBy: writeBy,
                    streakBy: streakBy,
                    date: date,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  title: Text(name),
                  titleTextStyle: textTheme.titleMedium?.copyWith(
                    decoration: isStroke ? TextDecoration.lineThrough : null,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TextHelper.formatRupiah(
                          amount: totalFee,
                          isCompact: false,
                        ),
                      ),
                      if (cigna != null) ...[
                        const SizedBox(height: 2),
                        Text(cigna),
                      ]
                    ],
                  ),
                  subtitleTextStyle: textTheme.bodyMedium?.copyWith(
                    decoration: isStroke ? TextDecoration.lineThrough : null,
                  ),
                  trailing: (!isStroke)
                      ? IconButton(
                          onPressed: () async {
                            final state = await _showCrossAlertDialog(
                              context: context,
                              type: 'obat',
                              description: name,
                            );

                            if (state != null) {
                              if (state) {
                                controller.strokeDrugs(index, item.id);
                              }
                            }
                          },
                          icon: const Icon(Icons.clear_rounded),
                        )
                      : null,
                );
              },
              itemCount: controller.itemsDrugs.length,
            ),
          ),
        ),
      ],
    );
  }

  Future<bool?> _showCrossAlertDialog({
    required BuildContext context,
    required String type,
    required String description,
  }) async {
    return await Dialogs.alert(
      context: context,
      title: 'Perhatian',
      content: Text(
        'Apakah anda yakin ingin mencoret $type $description ini ?',
      ),
      textYes: 'Coret',
    );
  }

  Widget builderRowFee({
    required TextTheme textTheme,
    required String name,
    int? fee,
    String? notFee,
  }) {
    Widget text = const SizedBox.shrink();

    if (fee != null) {
      text = Text(
        TextHelper.formatRupiah(amount: fee),
      );
    }

    if (notFee != null) {
      text = Text(notFee);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: textTheme.labelLarge,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(child: text),
      ],
    );
  }

  void _showDialogInfo({
    required BuildContext context,
    required String title,
    required String? name,
    int? quantity,
    String? unit,
    String? cigna,
    int? basicFee,
    int? discountFee,
    int? totalFee,
    required String? writeBy,
    String? streakBy,
    required String? date,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    final widgetPrice = <Widget>[
      const SizedBox(height: 16),
    ];

    if (title == 'Tindakan') {
      widgetPrice.addAll([
        builderRowFee(
          textTheme: textTheme,
          name: 'Nama Tindakan',
          notFee: name,
        ),
        const SizedBox(height: 4),
        builderRowFee(
          textTheme: textTheme,
          name: 'Harga Jual',
          fee: basicFee,
        ),
        const SizedBox(height: 4),
        builderRowFee(
          textTheme: textTheme,
          name: 'Discount',
          fee: discountFee,
        ),
        const SizedBox(height: 4),
        builderRowFee(
          textTheme: textTheme,
          name: 'Total',
          fee: totalFee,
        ),
        const SizedBox(height: 4),
      ]);
    }

    if (title == 'Obat') {
      widgetPrice.addAll([
        builderRowFee(
          textTheme: textTheme,
          name: 'Jumlah',
          notFee: quantity.toString(),
        ),
        const SizedBox(height: 4),
        builderRowFee(
          textTheme: textTheme,
          name: 'Satuan',
          notFee: unit,
        ),
        builderRowFee(
          textTheme: textTheme,
          name: 'Cigna',
          notFee: cigna,
        ),
        const SizedBox(height: 4),
        builderRowFee(
          textTheme: textTheme,
          name: 'Harga Satuan',
          fee: basicFee,
        ),
        const SizedBox(height: 4),
        builderRowFee(
          textTheme: textTheme,
          name: 'Total',
          fee: totalFee,
        ),
      ]);
    }

    Dialogs.alert(
      context: context,
      title: title,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name ?? '-',
            style: textTheme.bodyLarge,
          ),
          ...widgetPrice,
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Ditulis oleh $writeBy'),
                if (streakBy != null)
                  Text(
                    'Dicoret oleh $streakBy',
                    style: TextStyle(
                      color: theme.colorScheme.error,
                    ),
                  ),
                const SizedBox(height: 8),
                Text(date ?? '-'),
              ],
            ),
          ),
        ],
      ),
      isSingleAction: true,
    );
  }

  Widget builderSave(BuildContext context) {
    return Obx(
      () {
        final isEnabledSave =
            !controller.isLoading.value && controller.keluhan.isNotEmpty;

        return Buttons.filled(
          width: double.infinity,
          state: controller.isLoading.value,
          onPressed: isEnabledSave ? () => controller.save(context) : null,
          child: const Text(ConstantsStrings.save),
        );
      },
    );
  }
}
