import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/helpers/text_helper.dart';
import 'package:privata/app/modules/widgets/textformfield/text_form_fields.dart';
import 'package:privata/shared/shared_theme.dart';
import '../../../../../data/models/practice_schedule/practice_schedule_model.dart';
import '../../../../widgets/buttons/buttons.dart';

import '../../../../../../utils/constants_strings.dart';
import '../../../../../helpers/validations.dart';
import '../controllers/add_doctor_controller.dart';

class AddDoctorView extends GetView<AddDoctorController> {
  const AddDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Dokter'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Simpan'),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 21,
          horizontal: 16,
        ),
        child: Column(
          children: [
            builderDoctorName(),
            const SizedBox(height: 16),
            builderGender(textTheme),
            const SizedBox(height: 16),
            builderSTR(textTheme),
            const SizedBox(height: 16),
            builderNoSTR(),
            const SizedBox(height: 16),
            builderDateExpireSTR(context),
            const SizedBox(height: 16),
            builderSIP(textTheme),
            const SizedBox(height: 16),
            builderNoSIP(),
            const SizedBox(height: 16),
            builderRegistDateSIP(context),
            const SizedBox(height: 16),
            builderNoPhone(),
            const SizedBox(height: 16),
            builderEmail(),
            const SizedBox(height: 16),
            builderDegree(textTheme),
            const SizedBox(height: 16),
            builderMedicalJob(textTheme),
            const SizedBox(height: 16),
            builderSpecialist(textTheme),
            // const SizedBox(height: 16),
            // builderSubSpecialist(textTheme),
            const SizedBox(height: 16),
            builderEstimateConsultTime(),
            const SizedBox(height: 16),
            builderPracticeSchedule(
              context: context,
              textTheme: textTheme,
              dayTitle: ConstantsStrings.days[0],
            )
          ],
        ),
      ),
    );
  }

  Widget builderDoctorName() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.doctorNameC,
        focusNode: controller.doctorNameF,
        title: '${ConstantsStrings.doctorName} *',
        hintText: ConstantsStrings.hintDoctorName,
        suffixIconState: controller.doctorName.value.isNotEmpty,
        keyboardType: TextInputType.name,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.doctorName,
        ),
        onFieldSubmitted: (_) => controller.genderF.requestFocus(),
      ),
    );
  }

  Widget builderGender(TextTheme textTheme) {
    return TextFormFields.dropdown(
      // controller: controller.genderC,
      // focusNode: controller.genderF,
      title: ConstantsStrings.gender,
      isExpanded: true,
      isFilled: false,

      items: ConstantsStrings.dataGender
          .map(
            (item) => DropdownMenuEntry(
              value: item,
              label: item,
            ),
          )
          .toList(),
      textStyle: textTheme.titleMedium,
      isEnableSearch: false,
      menuStyle: const MenuStyle(
        maximumSize: WidgetStatePropertyAll(
          Size.fromHeight(300),
        ),
      ),
      onSelected: controller.selectedGender,
    );
  }

  Widget builderSTR(TextTheme textTheme) {
    return TextFormFields.dropdown(
      // controller: controller.strC,
      // focusNode: controller.strF,
      title: ConstantsStrings.str,
      isExpanded: true,
      isFilled: false,
      items: ConstantsStrings.dataSTR
          .map(
            (item) => DropdownMenuEntry(
              value: item,
              label: item,
            ),
          )
          .toList(),
      textStyle: textTheme.titleMedium,
      menuStyle: const MenuStyle(
        maximumSize: WidgetStatePropertyAll(
          Size.fromHeight(300),
        ),
      ),
      onSelected: controller.selectedStr,
    );
  }

  Widget builderNoSTR() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.noSTRC,
        focusNode: controller.noSTRF,
        title: '${ConstantsStrings.noSTR} *',
        hintText: ConstantsStrings.hintNoSTR,
        suffixIconState: controller.noSTR.value.isNotEmpty,
        keyboardType: TextInputType.number,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.noSTR,
          isNumericOnly: true,
          isNotZero: true,
        ),
        onFieldSubmitted: (_) => controller.noSIPF.requestFocus(),
      ),
    );
  }

  Widget builderDateExpireSTR(BuildContext context) {
    return TextFormFields.outlined(
      controller: controller.expireSTRC,
      focusNode: controller.expireSTRF,
      title: '${ConstantsStrings.expireDateSTR} *',
      hintText: ConstantsStrings.hintDate,
      suffixIcon: const Icon(Icons.date_range_rounded),
      keyboardType: TextInputType.datetime,
      isReadOnly: true,
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1980),
          lastDate: DateTime.now(),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        );

        if (date != null) {
          controller.setExpiresDate(date);
        }
      },
      validator: (value) => Validation.formField(
        value: value,
        titleField: ConstantsStrings.expireDateSTR,
      ),
      // onFieldSubmitted: (_) => controller.nextFocus(controller.placeBirthF),
    );
  }

  Widget builderSIP(TextTheme textTheme) {
    return TextFormFields.dropdown(
      title: ConstantsStrings.sip,
      isExpanded: true,
      isFilled: false,
      items: ConstantsStrings.dataSIP
          .map(
            (item) => DropdownMenuEntry(
              value: item,
              label: item,
            ),
          )
          .toList(),
      textStyle: textTheme.titleMedium,
      menuStyle: const MenuStyle(
        maximumSize: WidgetStatePropertyAll(
          Size.fromHeight(300),
        ),
      ),
      onSelected: controller.selectedSip,
    );
  }

  Widget builderNoSIP() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.noSIPC,
        focusNode: controller.noSIPF,
        title: ConstantsStrings.noSIP,
        hintText: ConstantsStrings.hintNoSIP,
        suffixIconState: controller.noSIP.value.isNotEmpty,
        keyboardType: TextInputType.number,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.noSIP,
          isNumericOnly: true,
          isNotZero: true,
        ),
        onFieldSubmitted: (_) => controller.registDateSIPF.requestFocus(),
      ),
    );
  }

  Widget builderRegistDateSIP(BuildContext context) {
    return TextFormFields.outlined(
      controller: controller.registDateSIPC,
      focusNode: controller.registDateSIPF,
      title: '${ConstantsStrings.registDateSIP} *',
      hintText: ConstantsStrings.hintDate,
      suffixIcon: const Icon(Icons.date_range_rounded),
      keyboardType: TextInputType.datetime,
      isReadOnly: true,
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1980),
          lastDate: DateTime.now(),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        );
      },
      validator: (value) => Validation.formField(
        value: value,
        titleField: ConstantsStrings.registDateSIP,
      ),
    );
  }

  Widget builderNoPhone() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.noPhoneC,
        focusNode: controller.noPhoneF,
        title: ConstantsStrings.noPhone,
        hintText: ConstantsStrings.hintNoPhone,
        suffixIconState: controller.noPhone.value.isNotEmpty,
        keyboardType: TextInputType.number,
        maxLines: 1,
        maxLength: 13,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.noPhone,
          isNumericOnly: true,
          isNotZero: true,
          minLength: 10,
        ),
        onFieldSubmitted: (_) => controller.emailF.requestFocus(),
      ),
    );
  }

  Widget builderEmail() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.emailC,
        focusNode: controller.emailF,
        title: ConstantsStrings.email,
        hintText: ConstantsStrings.hintEmail,
        suffixIconState: controller.email.value.isNotEmpty,
        keyboardType: TextInputType.emailAddress,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.email,
          isEmail: true,
        ),
        onFieldSubmitted: (_) => controller.lastDegreeF.requestFocus(),
      ),
    );
  }

  Widget builderDegree(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AutoSizeText(
          ConstantsStrings.degreeTitle,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: SharedTheme.bold,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormFields.dropdown(
                title: '${ConstantsStrings.degree} *',
                isExpanded: true,
                isFilled: false,
                items: ConstantsStrings.dataDegree
                    .map(
                      (item) => DropdownMenuEntry(
                        value: item,
                        label: item,
                      ),
                    )
                    .toList(),
                textStyle: textTheme.titleMedium,
                menuStyle: const MenuStyle(
                  maximumSize: WidgetStatePropertyAll(
                    Size.fromHeight(300),
                  ),
                ),
                onSelected: controller.selectedDegree,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormFields.outlined(
                controller: controller.lastDegreeC,
                focusNode: controller.lastDegreeF,
                title: ConstantsStrings.lastDegree,
                hintText: ConstantsStrings.lastDegree,
                suffixIconState: controller.lastDegree.value.isNotEmpty,
                maxLines: 1,
                validator: (value) => Validation.formField(
                  value: value,
                  titleField:
                      '${ConstantsStrings.degreeTitle} ${ConstantsStrings.lastDegree}',
                ),
                onFieldSubmitted: (_) =>
                    controller.estimateConsultTimeF.requestFocus(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget builderMedicalJob(TextTheme textTheme) {
    return TextFormFields.dropdown(
      title: '${ConstantsStrings.medicalJob} *',
      isExpanded: true,
      isFilled: false,
      items: ConstantsStrings.dataMedicalJob
          .map(
            (item) => DropdownMenuEntry(
              value: item,
              label: item,
            ),
          )
          .toList(),
      textStyle: textTheme.titleMedium,
      menuStyle: const MenuStyle(
        maximumSize: WidgetStatePropertyAll(
          Size.fromHeight(300),
        ),
      ),
      onSelected: controller.selectedMedicalJob,
    );
  }

  // ! Masih error dibagian Menu Style
  Widget builderSpecialist(TextTheme textTheme) {
    return TextFormFields.dropdown(
      controller: controller.specialistC,
      focusNode: controller.specialistF,
      title: ConstantsStrings.specialist,
      isExpanded: true,
      isFilled: false,
      items: ConstantsStrings.dataSpecialist.indexed
          .map(
            (e) => DropdownMenuEntry(
              value: e.$1,
              label: e.$2,
            ),
          )
          .toList(),
      textStyle: textTheme.titleMedium,
      menuStyle: const MenuStyle(
        maximumSize: WidgetStatePropertyAll(
          Size.fromHeight(300),
        ),
      ),
      onSelected: controller.selectedSpecialist,
    );
  }

  // ! Error perbaiki nanti
  Widget builderSubSpecialist(TextTheme textTheme) {
    return Obx(() {
      final data =
          controller.filterSubSpecialist(controller.indexSpecialist.value);

      return TextFormFields.dropdown(
        title: ConstantsStrings.subSpecialist,
        isExpanded: true,
        isFilled: false,
        items: (data != null && data.isEmpty)
            ? data.map(
                (value) {
                  return DropdownMenuEntry(
                    value: value,
                    label: value,
                  );
                },
              ).toList()
            : null,
        textStyle: textTheme.titleMedium,
        menuStyle: const MenuStyle(
          maximumSize: WidgetStatePropertyAll(
            Size.fromHeight(300),
          ),
        ),
        // onSelected: controller.selectedSpecialist,
      );
    });
  }

  Widget builderEstimateConsultTime() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.estimateConsultTimeC,
        focusNode: controller.estimateConsultTimeF,
        title: '${ConstantsStrings.estimateConsultTime} *',
        hintText: ConstantsStrings.hintEstimateConsultTime,
        suffixIconState: controller.estimateConsultTime.value.isNotEmpty,
        suffixText: 'Menit',
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField:
              '${ConstantsStrings.degreeTitle} ${ConstantsStrings.estimateConsultTime}',
        ),
        onFieldSubmitted: (_) => controller.medicalJobF.requestFocus(),
      ),
    );
  }

  Widget builderPracticeSchedule({
    required BuildContext context,
    required TextTheme textTheme,
    required String dayTitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AutoSizeText(
          ConstantsStrings.practiceScheduleTitle,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: SharedTheme.bold,
          ),
        ),
        const SizedBox(height: 4),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = controller.practiceScheduleModel[index];

            return Column(
              children: [
                ListTile(
                  title: Text(
                    TextHelper.capitalizeEachWords(item.day) ?? '',
                  ),
                  titleTextStyle: textTheme.titleMedium,
                  trailing: Buttons.text(
                    child: const Text('Tambah'),
                    onPressed: () => controller.addItemDay(item),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                Obx(
                  () => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        builderItemPracticeSchedule(
                      context: context,
                      index: index,
                      item: item,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: item.startTextC.length,
                  ),
                ),
              ],
            );
          },
          itemCount: controller.practiceScheduleModel.length,
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget builderItemPracticeSchedule({
    required BuildContext context,
    required int index,
    required PracticeScheduleModel item,
  }) {
    final theme = context.theme;
    final startC = item.startTextC[index];
    final endC = item.endTextC[index];

    return Row(
      children: [
        Expanded(
          child: TextFormFields.outlined(
            controller: startC,
            title: ConstantsStrings.titleStart,
            hintText: ConstantsStrings.hintTime,
            suffixIcon: const Icon(Icons.alarm_on_rounded),
            keyboardType: TextInputType.datetime,
            isReadOnly: true,
            isLabel: true,
            onTap: () => controller.onTapTimePicker(
              context: context,
              textC: startC,
            ),
            validator: (value) => Validation.formField(
              value: value,
              titleField: ConstantsStrings.titleStart,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextFormFields.outlined(
            controller: endC,
            title: ConstantsStrings.titleEnd,
            hintText: ConstantsStrings.hintTime,
            suffixIcon: const Icon(Icons.alarm_off_rounded),
            keyboardType: TextInputType.datetime,
            isReadOnly: true,
            isLabel: true,
            onTap: () => controller.onTapTimePicker(
              context: context,
              textC: endC,
            ),
            validator: (value) => Validation.formField(
              value: value,
              titleField: ConstantsStrings.titleEnd,
            ),
          ),
        ),
        if (index != 0)
          IconButton(
            onPressed: () => controller.removeItemDay(item, index),
            icon: const Icon(Icons.remove_rounded),
            color: theme.colorScheme.error,
          ),
      ],
    );
  }
}
