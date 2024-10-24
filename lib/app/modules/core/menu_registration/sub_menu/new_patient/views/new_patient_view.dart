import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:privata/app/helpers/format_date_time.dart';
import 'package:privata/app/modules/widgets/buttons/buttons.dart';
import 'package:privata/app/modules/widgets/textformfield/text_form_fields.dart';

import '../../../../../../../shared/shared_theme.dart';
import '../../../../../../../utils/constants_assets.dart';
import '../../../../../../../utils/constants_strings.dart';
import '../../../../../../helpers/helper.dart';
import '../../../../../../helpers/validations.dart';
import '../../../../../widgets/modal/modals.dart';
import '../controllers/new_patient_controller.dart';

class NewPatientView extends GetView<NewPatientController> {
  const NewPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builderAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 21,
          vertical: 16,
        ),
        child: builderForm(context),
      ),
    );
  }

  AppBar builderAppBar() {
    return AppBar(
      title: const Text('Pasien Baru'),
      centerTitle: true,
      actions: [
        Obx(
          () => Buttons.text(
            onPressed: controller.save,
            state: controller.isLoading.value,
            child: const Text('Simpan'),
          ),
        )
      ],
    );
  }

  Widget builderForm(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          builderPicture(context),
          const SizedBox(height: 16),
          builderFullName(),
          const SizedBox(height: 16),
          builderNoMR(),
          const SizedBox(height: 16),
          builderPlaceBirth(),
          const SizedBox(height: 16),
          builderBirthDate(context),
          const SizedBox(height: 16),
          builderNoKTP(),
          const SizedBox(height: 16),
          builderGender(context.textTheme),
          const SizedBox(height: 16),
          builderReligion(context.textTheme),
          const SizedBox(height: 16),
          builderMarriedStatus(context.textTheme),
          const SizedBox(height: 16),
          builderBloodType(context.textTheme),
          const SizedBox(height: 16),
          builderLastEducation(context.textTheme),
          const SizedBox(height: 16),
          builderJob(context.textTheme),
          const SizedBox(height: 16),
          builderNumberPhone(),
          const SizedBox(height: 16),
          builderEmail(),
          const SizedBox(height: 16),
          builderAddress(),
          const SizedBox(height: 16),
          builderProvince(context.textTheme),
          const SizedBox(height: 16),
          builderRegency(context.textTheme),
          const SizedBox(height: 16),
          builderDistricts(context.textTheme),
          const SizedBox(height: 16),
          builderVillage(context.textTheme),
          const SizedBox(height: 16),
          builderPostalCode(),
        ],
      ),
    );
  }

  Widget builderPicture(BuildContext context) {
    final theme = context.theme;
    final textTheme = theme.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Obx(
                () => CircleAvatar(
                  foregroundImage: (controller.imageCropped.value != null)
                      ? FileImage(File(controller.imageCropped.value!.path))
                      : const AssetImage(ConstantsAssets.imgNoPhoto),
                  minRadius: 40,
                  maxRadius: 54,
                ),
              ),
              Positioned(
                right: 0,
                bottom: -4,
                child: IconButton.filled(
                  iconSize: 14,
                  visualDensity: VisualDensity.comfortable,
                  style: ButtonStyle(
                    side: WidgetStatePropertyAll(
                      BorderSide(
                        color: theme.colorScheme.surface,
                        width: 3,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Modals.bottomSheet(
                      context: context,
                      content: LayoutBuilder(builder: (context, constraints) {
                        final maxWidth = constraints.maxWidth;

                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AutoSizeText(
                                'Pilih Opsi',
                                style: textTheme.titleLarge?.copyWith(
                                  fontWeight: SharedTheme.bold,
                                ),
                              ),
                              const SizedBox(height: 21),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  builderItemSource(
                                    width: maxWidth / 7,
                                    asset: ConstantsAssets.icGallery,
                                    title: 'Galeri',
                                    textTheme: textTheme,
                                    onPressed: () async {
                                      final file = await Helper.pickFile(
                                          ImageSource.gallery);

                                      if (file != null) {
                                        final result = await Helper.cropImage(
                                          imageFile: file,
                                        );

                                        if (result != null) {
                                          controller.imageCropped.value =
                                              result;
                                          Get.back();
                                        }
                                      }
                                    },
                                  ),
                                  builderItemSource(
                                    width: maxWidth / 7,
                                    asset: ConstantsAssets.icCamera,
                                    title: 'Kamera',
                                    textTheme: textTheme,
                                    onPressed: () async {
                                      final file = await Helper.pickFile(
                                          ImageSource.camera);

                                      if (file != null) {
                                        final result = await Helper.cropImage(
                                          imageFile: file,
                                        );

                                        if (result != null) {
                                          controller.imageCropped.value =
                                              result;
                                          Get.back();
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                  icon: Icon(
                    Icons.edit_rounded,
                    color: theme.colorScheme.surface,
                  ),
                  tooltip: 'Ubah Foto',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget builderItemSource({
    required double width,
    required String asset,
    required String title,
    required TextTheme textTheme,
    required Function() onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            asset,
            width: width,
          ),
          const SizedBox(height: 12),
          AutoSizeText(
            title,
            style: textTheme.labelLarge,
          ),
        ],
      ),
    );
  }

  Widget builderFullName() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.fullNameC,
        focusNode: controller.fullNameF,
        isRequired: true,
        title: ConstantsStrings.fullName,
        hintText: ConstantsStrings.hintFullName,
        suffixIconState: controller.fullName.value.isNotEmpty,
        keyboardType: TextInputType.name,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.fullName,
        ),
      ),
    );
  }

  Widget builderNoMR() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.noMRC,
        focusNode: controller.noMRF,
        isRequired: true,
        title: ConstantsStrings.noMR,
        hintText: ConstantsStrings.hintNoMR,
        isReadOnly: true,
        isEnable: controller.noMR.value.isEmpty,
        suffixIconState: controller.noMR.value.isNotEmpty,
        maxLines: 1,
      ),
    );
  }

  Widget builderPlaceBirth() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.placeBirthC,
        focusNode: controller.placeBirthF,
        title: ConstantsStrings.placeBirth,
        hintText: ConstantsStrings.hintPlaceBirth,
        suffixIconState: controller.placeBirth.value.isNotEmpty,
      ),
    );
  }

  Widget builderBirthDate(BuildContext context) {
    return TextFormFields.outlined(
      controller: controller.birthDateC,
      // focusNode: controller.birthDateF,
      isRequired: true,
      title: ConstantsStrings.birthDate,
      hintText: ConstantsStrings.hintDate,
      suffixIcon: const Icon(Icons.date_range_rounded),
      keyboardType: TextInputType.datetime,
      isReadOnly: true,
      onTap: () async {
        DateTime? dateTime;

        if (controller.birthDateC.text != '') {
          dateTime = FormatDateTime.stringToDateTime(
            oldPattern: 'dd MMMM yyyy',
            newPattern: 'yyyy-MM-dd',
            value: controller.birthDateC.text,
          );
        }

        final date = await showDatePicker(
          context: context,
          initialDate: dateTime ?? DateTime(1945),
          firstDate: DateTime(1945),
          lastDate: DateTime.now(),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        );

        if (date != null) controller.setDate(date);
      },
      validator: (value) => Validation.formField(
        value: value,
        titleField: ConstantsStrings.birthDate,
      ),
    );
  }

  Widget builderProvince(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.provinceC,
        title: ConstantsStrings.province,
        isExpanded: true,
        isFilled: false,
        items: controller.tempDataProvinces
            .map(
              (item) => DropdownMenuEntry(
                value: item.id,
                label: item.name ?? '',
                enabled: controller.idProvince.value != item.id,
              ),
            )
            .toList(),
        isEnabled: controller.tempDataProvinces.isNotEmpty,
        textStyle: textTheme.titleMedium,
        menuHeight: 300,
        onSelected: controller.selectedProvince,
      ),
    );
  }

  Widget builderRegency(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.regenciesC,
        // focusNode: controller.regenciesF,
        title: ConstantsStrings.regency,
        isExpanded: true,
        isFilled: false,
        items: controller.tempDataRegencies
            .map(
              (item) => DropdownMenuEntry(
                value: item.id ?? '',
                label: item.name ?? '',
                enabled: controller.idRegency.value != item.id,
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnabled: controller.tempDataRegencies.isNotEmpty,
        menuHeight: 300,
        onSelected: controller.selectedRegency,
      ),
    );
  }

  Widget builderDistricts(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.districtsC,
        // focusNode: controller.districtsF,
        title: ConstantsStrings.district,
        isExpanded: true,
        isFilled: false,
        items: controller.tempDataDistricts
            .map(
              (item) => DropdownMenuEntry(
                value: item.id ?? '',
                label: item.name ?? '',
                enabled: controller.idDistrict.value != item.id,
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnabled: controller.tempDataDistricts.isNotEmpty,
        menuHeight: 300,
        onSelected: controller.selectedDistrict,
      ),
    );
  }

  Widget builderVillage(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.villagesC,
        // focusNode: controller.villagesF,
        title: ConstantsStrings.village,
        isExpanded: true,
        isFilled: false,
        items: controller.tempDataVillages
            .map(
              (item) => DropdownMenuEntry(
                value: item.id ?? '',
                label: item.name ?? '',
                enabled: controller.idVillage.value != item.id,
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnabled: controller.tempDataVillages.isNotEmpty,
        menuHeight: 300,
        onSelected: controller.selectedVillage,
      ),
    );
  }

  Widget builderAddress() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.addressC,
        focusNode: controller.addressF,
        title: ConstantsStrings.address,
        hintText: ConstantsStrings.hintAddress,
        suffixIconState: controller.address.value.isNotEmpty,
        keyboardType: TextInputType.streetAddress,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.address,
        ),
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
        textCapitalization: TextCapitalization.none,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.email,
          isEmail: true,
        ),
      ),
    );
  }

  Widget builderPostalCode() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.postalCodeC,
        focusNode: controller.postalCodeF,
        title: ConstantsStrings.postalCode,
        hintText: ConstantsStrings.hintPostalCode,
        suffixIconState: controller.postalCode.value.isNotEmpty,
        keyboardType: TextInputType.number,
        maxLength: 5,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.postalCode,
          isNumericOnly: true,
          isRequired: false,
          minLengthChar: 5,
        ),
        // onFieldSubmitted: (_) => controller.nextFocus(controller.placeBirthF),
      ),
    );
  }

  Widget builderNumberPhone() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.noPhoneC,
        focusNode: controller.noPhoneF,
        title: ConstantsStrings.noPhone,
        hintText: ConstantsStrings.hintNoPhone,
        suffixIconState: controller.noPhone.value.isNotEmpty,
        keyboardType: TextInputType.number,
        maxLength: 13,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.noPhone,
          isNumericOnly: true,
          minLengthChar: 11,
        ),
        // onFieldSubmitted: (_) => controller.nextFocus(controller.placeBirthF),
      ),
    );
  }

  Widget builderNoKTP() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.noKTPC,
        focusNode: controller.noKTPF,
        title: ConstantsStrings.noKTP,
        hintText: ConstantsStrings.hintNoKTP,
        suffixIconState: controller.noKTP.value.isNotEmpty,
        keyboardType: TextInputType.number,
        maxLength: 16,
        validator: (value) => Validation.formField(
          value: value,
          isRequired: false,
          titleField: ConstantsStrings.noKTP,
          isNumericOnly: true,
          minLengthChar: 16,
        ),
      ),
    );
  }

  Widget builderGender(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.genderC,
        // focusNode: controller.genderF,
        isRequired: true,
        title: ConstantsStrings.gender,
        isExpanded: true,
        isFilled: false,
        items: ConstantsStrings.dataGender
            .map(
              (item) => DropdownMenuEntry(
                value: item,
                label: item,
                enabled: controller.gender.value != item,
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnableSearch: false,
        onSelected: (value) => controller.selectedItemDropdown(
          obs: controller.gender,
          value: value,
        ),
      ),
    );
  }

  Widget builderReligion(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.religionC,
        // focusNode: controller.religionF,
        isRequired: true,
        title: ConstantsStrings.religion,
        isExpanded: true,
        isFilled: false,
        items: ConstantsStrings.dataReligion
            .map(
              (item) => DropdownMenuEntry(
                value: item,
                label: item,
                enabled: controller.religion.value != item,
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnableSearch: false,
        menuHeight: 200,
        onSelected: (value) => controller.selectedItemDropdown(
          obs: controller.religion,
          value: value,
        ),
      ),
    );
  }

  Widget builderMarriedStatus(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.marriedStatusC,
        // focusNode: controller.marriedStatusF,
        isRequired: true,
        title: ConstantsStrings.marriedStatus,
        isExpanded: true,
        isFilled: false,
        items: ConstantsStrings.dataMarriedStatus
            .map(
              (item) => DropdownMenuEntry(
                value: item,
                label: item,
                enabled: controller.marriedStatus.value != item,
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnableSearch: false,
        onSelected: (value) => controller.selectedItemDropdown(
          obs: controller.marriedStatus,
          value: value,
        ),
      ),
    );
  }

  Widget builderBloodType(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.bloodTypeC,
        // focusNode: controller.bloodTypeF,
        isRequired: true,
        title: ConstantsStrings.bloodType,
        isExpanded: true,
        isFilled: false,
        items: ConstantsStrings.dataBloodType
            .map(
              (item) => DropdownMenuEntry(
                value: item,
                label: item,
                enabled: controller.bloodType.value != item,
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnableSearch: false,
        menuHeight: 200,
        onSelected: (value) => controller.selectedItemDropdown(
          obs: controller.bloodType,
          value: value,
        ),
      ),
    );
  }

  Widget builderLastEducation(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.lastEducationC,
        isRequired: true,
        title: ConstantsStrings.lastEducation,
        isExpanded: true,
        isFilled: false,
        items: ConstantsStrings.dataLastEducation
            .map(
              (item) => DropdownMenuEntry(
                value: item,
                label: item,
                enabled: controller.lastEducation.value != item,
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnableSearch: false,
        menuHeight: 200,
        onSelected: (value) => controller.selectedItemDropdown(
          obs: controller.lastEducation,
          value: value,
        ),
      ),
    );
  }

  Widget builderJob(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.jobC,
        isRequired: true,
        title: ConstantsStrings.job,
        isExpanded: true,
        isFilled: false,
        items: ConstantsStrings.dataJob
            .map(
              (item) => DropdownMenuEntry(
                value: item,
                label: item,
                enabled: controller.job.value != item,
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnableSearch: false,
        menuHeight: 200,
        onSelected: (value) => controller.selectedItemDropdown(
          obs: controller.job,
          value: value,
        ),
      ),
    );
  }
}
