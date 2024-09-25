import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:privata/app/modules/widgets/buttons/buttons.dart';
import 'package:privata/app/modules/widgets/textformfield/text_form_fields.dart';

import '../../../../../../../utils/constants_strings.dart';
import '../../../../../../helpers/validations.dart';
import '../controllers/new_patient_controller.dart';

class NewPatientView extends GetView<NewPatientController> {
  const NewPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pasien Baru'),
        centerTitle: true,
        actions: [
          Buttons.text(
            onPressed: () {},
            child: const Text('Simpan'),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 21,
          vertical: 16,
        ),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              builderFullName(),
              const SizedBox(height: 16),
              builderNoEMR(),
              const SizedBox(height: 16),
              builderPlaceBirth(),
              const SizedBox(height: 16),
              builderBirthDate(context),
              const SizedBox(height: 16),
              builderProvince(context.textTheme),
              const SizedBox(height: 16),
              builderRegency(context.textTheme),
              const SizedBox(height: 16),
              builderDistricts(context.textTheme),
              const SizedBox(height: 16),
              builderVillage(context.textTheme),
              const SizedBox(height: 16),
              builderAddress(),
              const SizedBox(height: 16),
              builderPostalCode(),
              const SizedBox(height: 16),
              builderNumberPhone(),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget builderFullName() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.fullNameC,
        focusNode: controller.fullNameF,
        title: '${ConstantsStrings.fullName} *',
        hintText: ConstantsStrings.hintFullName,
        suffixIconState: controller.fullName.value.isNotEmpty,
        keyboardType: TextInputType.name,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.fullName,
        ),
        // onFieldSubmitted: (_) => controller.nextFocus(controller.placeBirthF),
      ),
    );
  }

  Widget builderNoEMR() {
    return Obx(
      () => TextFormFields.outlined(
        controller: controller.noMRC,
        focusNode: controller.noMRF,
        title: ConstantsStrings.noMR,
        hintText: ConstantsStrings.hintNoMR,
        isReadOnly: true,
        isEnable: false,
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
        title: '${ConstantsStrings.placeBirth} *',
        hintText: ConstantsStrings.hintPlaceBirth,
        suffixIconState: controller.placeBirth.value.isNotEmpty,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.placeBirth,
        ),
        // onFieldSubmitted: (_) => controller.nextFocus(controller.placeBirthC),
      ),
    );
  }

  Widget builderBirthDate(BuildContext context) {
    return TextFormFields.outlined(
      controller: controller.birthDateC,
      focusNode: controller.birthDateF,
      title: '${ConstantsStrings.birthDate} *',
      hintText: ConstantsStrings.hintDate,
      suffixIcon: const Icon(Icons.date_range_rounded),
      keyboardType: TextInputType.datetime,
      isReadOnly: true,
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          // initialDate: DateTime.now(),
          firstDate: DateTime(1945),
          lastDate: DateTime.now(),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        );

        if (date != null) {
          controller.setDate(date);
        }
      },
      validator: (value) => Validation.formField(
        value: value,
        titleField: ConstantsStrings.birthDate,
      ),
      // onFieldSubmitted: (_) => controller.nextFocus(controller.placeBirthF),
    );
  }

  Widget builderProvince(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.provinceC,
        focusNode: controller.provinceF,
        title: ConstantsStrings.province,
        isExpanded: true,
        isFilled: false,
        items: controller.tempDataProvinces
            .map(
              (item) => DropdownMenuEntry(
                value: item.id ?? '',
                label: item.name ?? '',
              ),
            )
            .toList(),
        isEnabled: controller.tempDataProvinces.isNotEmpty,
        textStyle: textTheme.titleMedium,
        menuStyle: const MenuStyle(
          maximumSize: WidgetStatePropertyAll(
            Size.fromHeight(300),
          ),
        ),
        onSelected: controller.selectedProvince,
      ),
    );
  }

  Widget builderRegency(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.regenciesC,
        focusNode: controller.regenciesF,
        title: ConstantsStrings.regency,
        isExpanded: true,
        isFilled: false,
        items: controller.tempDataRegencies
            .map(
              (item) => DropdownMenuEntry(
                value: item.id ?? '',
                label: item.name ?? '',
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnabled: controller.tempDataRegencies.isNotEmpty,
        menuStyle: const MenuStyle(
          maximumSize: WidgetStatePropertyAll(
            Size.fromHeight(300),
          ),
        ),
        onSelected: controller.selectedRegency,
      ),
    );
  }

  Widget builderDistricts(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.districtsC,
        focusNode: controller.districtsF,
        title: ConstantsStrings.district,
        isExpanded: true,
        isFilled: false,
        items: controller.tempDataDistricts
            .map(
              (item) => DropdownMenuEntry(
                value: item.id ?? '',
                label: item.name ?? '',
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnabled: controller.tempDataDistricts.isNotEmpty,
        menuStyle: const MenuStyle(
          maximumSize: WidgetStatePropertyAll(
            Size.fromHeight(300),
          ),
        ),
        onSelected: controller.selectedDistrict,
      ),
    );
  }

  Widget builderVillage(TextTheme textTheme) {
    return Obx(
      () => TextFormFields.dropdown(
        controller: controller.villagesC,
        focusNode: controller.villagesF,
        title: ConstantsStrings.village,
        isExpanded: true,
        isFilled: false,
        items: controller.tempDataVillages
            .map(
              (item) => DropdownMenuEntry(
                value: item.id ?? '',
                label: item.name ?? '',
              ),
            )
            .toList(),
        textStyle: textTheme.titleMedium,
        isEnabled: controller.tempDataVillages.isNotEmpty,
        menuStyle: const MenuStyle(
          maximumSize: WidgetStatePropertyAll(
            Size.fromHeight(300),
          ),
        ),
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
        // onFieldSubmitted: (_) => controller.nextFocus(controller.placeBirthF),
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
          minLength: 5,
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
        title: '${ConstantsStrings.noPhone} *',
        hintText: ConstantsStrings.hintNoPhone,
        suffixIconState: controller.noPhone.value.isNotEmpty,
        keyboardType: TextInputType.number,
        maxLength: 13,
        maxLines: 1,
        validator: (value) => Validation.formField(
          value: value,
          titleField: ConstantsStrings.noPhone,
          isNumericOnly: true,
          minLength: 11,
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
          titleField: ConstantsStrings.noKTP,
          isNumericOnly: true,
          minLength: 16,
        ),
        // onFieldSubmitted: (_) => controller.nextFocus(controller.placeBirthF),
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

  Widget builderReligion(TextTheme textTheme) {
    return TextFormFields.dropdown(
      // controller: controller.religionC,
      // focusNode: controller.religionF,
      title: ConstantsStrings.religion,
      isExpanded: true,
      isFilled: false,
      items: ConstantsStrings.dataReligion
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
      onSelected: controller.selectedReligion,
    );
  }

  Widget builderMarriedStatus(TextTheme textTheme) {
    return TextFormFields.dropdown(
      // controller: controller.marriedStatusC,
      // focusNode: controller.marriedStatusF,
      title: ConstantsStrings.marriedStatus,
      isExpanded: true,
      isFilled: false,
      items: ConstantsStrings.dataMarriedStatus
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
      onSelected: controller.selectedMarriedStatus,
    );
  }

  Widget builderBloodType(TextTheme textTheme) {
    return TextFormFields.dropdown(
      // controller: controller.bloodTypeC,
      // focusNode: controller.bloodTypeF,
      title: ConstantsStrings.bloodType,
      isExpanded: true,
      isFilled: false,
      items: ConstantsStrings.dataBloodType
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
      onSelected: controller.selectedBloodType,
    );
  }
}
