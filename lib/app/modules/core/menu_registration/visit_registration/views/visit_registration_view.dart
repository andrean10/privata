import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:privata/app/helpers/format_date_time.dart';
import 'package:privata/app/helpers/text_helper.dart';
import 'package:privata/app/helpers/validations.dart';
import 'package:privata/app/modules/widgets/textformfield/custom_dropdown_type_form_field.dart';
import 'package:privata/app/modules/widgets/textformfield/custom_textform_field.dart';

import '../../../../../../utils/constants_strings.dart';
import '../../../../../data/db/range/range_model.dart';
import '../../../../../data/models/rj/item_rj/patient/rj_patient_model.dart';
import '../../../../../helpers/helper.dart';
import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/card/cards.dart';
import '../../../../widgets/snackbar/snackbar.dart';
import '../../../../widgets/textformfield/text_form_fields.dart';
import '../controllers/visit_registration_controller.dart';

class VisitRegistrationView extends GetView<VisitRegistrationController> {
  const VisitRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builderAppBar(),
      body: builderBody(),
    );
  }

  AppBar builderAppBar() {
    return AppBar(
      title: const Text('Pendaftaran Kunjungan'),
      centerTitle: true,
      actions: [
        Obx(
          () {
            final isLoading = controller.isLoading.value;
            return Buttons.text(
              state: isLoading,
              onPressed: (!isLoading) ? controller.save : null,
              child: const Text('Simpan'),
            );
          },
        ),
      ],
    );
  }

  Widget builderBody() {
    return controller.obx(
      (value) {
        return Cards.elevated(
          outPadding: const EdgeInsets.all(8),
          child: builderForm(value),
        );
      },
      onLoading: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }

  Widget builderForm(RJPatientModel? data) {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            builderNamaPasien(data),
            const SizedBox(height: 18),
            builderPenjamin(data),
            const SizedBox(height: 18),
            builderMetodePembayaran(data),
            const SizedBox(height: 18),
            builderPilihanMetodePembayaran(data),
            builderJenisKunjungan(data),
            const SizedBox(height: 18),
            builderJenisPerawatan(data),
            const SizedBox(height: 18),
            builderNoHP(data),
            const SizedBox(height: 18),
            builderAlamatEmail(data),
            const SizedBox(height: 6),
            builderCheckboxEmail(),
            const SizedBox(height: 18),
            builderLokasi(data),
            const SizedBox(height: 18),
            builderPoli(data),
            const SizedBox(height: 18),
            builderTenagaMedis(data),
            const SizedBox(height: 18),
            builderTanggal(),
            const SizedBox(height: 18),
            builderSlot(data),
            const SizedBox(height: 18),
            builderJamDanLamaDurasi(),
            const SizedBox(height: 18),
            builderKeluhan(),
            const SizedBox(height: 18),
            builderProsedur(),
            const SizedBox(height: 18),
            builderVitalSign(),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  Widget builderNamaPasien(RJPatientModel? data) {
    return CustomTextFormField(
      controller: controller.namaPasienC,
      isRequired: true,
      title: 'Nama Pasien',
      hintText: 'Isi Nama Pasien',
      isFilled: true,
      keyboardType: TextInputType.name,
      isReadOnly: data?.nama != null,
      maxLines: 1,
      validator: (value) => Validation.formField(
        titleField: 'Nama pasien',
        value: value,
      ),
    );
  }

  Widget builderPenjamin(RJPatientModel? data) {
    final pribadi = '${controller.args.nama} (pribadi)';
    List<String> penjamin = [pribadi];

    if (data != null && data.family != null && data.family!.isNotEmpty) {
      final map = data.family!
          .where((element) => element.name != null)
          .map(
            (e) => e.name!,
          )
          .toList();

      penjamin.addAll(map);
    }

    return Obx(
      () => CustomDropdownTypeFormField(
        isRequired: true,
        title: 'Penjamin',
        isFilled: true,
        selectedItem: controller.penjamin.value,
        items: penjamin,
        // asyncItems: (filter) {
        //   return penjamin;
        // },
        validator: (value) => Validation.formField(
          titleField: 'Penjamin',
          value: value,
          isRequired: true,
        ),
      ),
    );
  }

  Widget builderMetodePembayaran(RJPatientModel? data) {
    return Obx(
      () => CustomDropdownTypeFormField(
        isRequired: true,
        title: 'Metode Pembayaran',
        isFilled: true,
        selectedItem: controller.metodePembayaran.value,
        // items: (filter, props) => ConstantsStrings.dataMethodPayment,
        items: ConstantsStrings.dataMethodPayment,
        onChanged: controller.onChangedPaymentMethod,
        validator: (value) => Validation.formField(
          titleField: 'Metode pembayaran',
          value: value,
          isRequired: true,
        ),
      ),
    );
  }

  Widget builderPilihanMetodePembayaran(RJPatientModel? data) {
    return Obx(() {
      var title = '';
      int? maxLength;
      var isVisible = false;
      var isVisibleSearch = false;

      switch (controller.selectedMetodePembayaran.value) {
        case MethodPayment.bpjsKesehatan:
          title = 'BPJS Kesehatan';
          isVisible = true;
          isVisibleSearch = false;
          maxLength = 11;
          break;
        case MethodPayment.bpjsKetenagakerjaan:
          title = 'BPJS Ketenagakerjaan';
          isVisible = true;
          isVisibleSearch = false;
          maxLength = 11;
          break;
        case MethodPayment.insurance:
          title = 'Asuransi';
          isVisible = true;
          isVisibleSearch = true;
          maxLength = null;
          break;
        case MethodPayment.company:
          title = 'Perusahaan';
          isVisible = true;
          isVisibleSearch = true;
          maxLength = null;
          break;
        case MethodPayment.cardDebit:
          title = 'Kartu Debit';
          isVisible = true;
          isVisibleSearch = true;
          maxLength = null;
          break;
        case MethodPayment.cardCredit:
          title = 'Kartu Kredit';
          isVisible = true;
          isVisibleSearch = true;
          maxLength = null;
          break;
        default:
          isVisible = false;
          maxLength = null;
          break;
      }

      return Visibility(
        visible: isVisible,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: isVisibleSearch,
              child: Container(
                margin: const EdgeInsets.only(bottom: 18),
                child: TextFormFields.search(
                  controller: controller.namaPembayaranC,
                  focusNode: controller.namaPembayaranF,
                  isRequired: true,
                  title: 'Nama $title',
                  hintText: 'Cari $title',
                  items: [],
                  searchCallback: (_, query) =>
                      controller.searchNamaPembayaran(query),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 18),
              child: CustomTextFormField(
                controller: controller.nomorPembayaranC,
                focusNode: controller.nomorPembayaranF,
                isRequired: true,
                title: 'Nomor $title',
                hintText: 'Isi $title',
                isFilled: true,
                maxLines: 1,
                maxLength: maxLength,
                keyboardType: TextInputType.number,
                validator: (value) => Validation.formField(
                  titleField: 'Nomor $title',
                  value: value,
                  isRequired: true,
                  isNumericOnly: true,
                  minLengthChar: maxLength,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget builderJenisKunjungan(RJPatientModel? data) {
    return Obx(
      () => CustomDropdownTypeFormField(
        isRequired: true,
        title: 'Jenis Kunjungan',
        isFilled: true,
        selectedItem: controller.jenisKunjungan.value,
        // items: (filter, props) => ConstantsStrings.dataVisitType,
        items: ConstantsStrings.dataVisitType,
        itemAsString: (value) => value,
        validator: (value) => Validation.formField(
          titleField: 'jenis kunjungan',
          value: value,
          isRequired: true,
        ),
      ),
    );
  }

  Widget builderJenisPerawatan(RJPatientModel? data) {
    return Obx(
      () => CustomDropdownTypeFormField(
        isRequired: true,
        title: 'Jenis Perawatan',
        isFilled: true,
        selectedItem: controller.jenisPerawatan.value,
        // items: (filter, props) => ConstantsStrings.dataServiceType,
        items: ConstantsStrings.dataServiceType,
        itemAsString: (value) => value,
        validator: (value) => Validation.formField(
          titleField: 'jenis perawatan',
          value: value,
          isRequired: true,
        ),
      ),
    );
  }

  Widget builderNoHP(RJPatientModel? data) {
    return Obx(() {
      final nomorHP = controller.nomorHP.value;

      return CustomTextFormField(
        controller: controller.nomorHPC,
        focusNode: controller.nomorHPF,
        title: 'Nomor HP',
        hintText: 'Isi Nomor HP',
        isFilled: true,
        keyboardType: TextInputType.number,
        maxLines: 1,
        maxLength: 13,
        suffixIconState: nomorHP != null && nomorHP.isNotEmpty,
        validator: (value) => Validation.formField(
          titleField: 'Nomor HP',
          value: value,
          isRequired: false,
          isNumericOnly: true,
          minLengthChar: 10,
        ),
      );
    });
  }

  Widget builderAlamatEmail(RJPatientModel? data) {
    return Obx(
      () {
        final email = controller.email.value;

        return CustomTextFormField(
          controller: controller.emailC,
          focusNode: controller.emailF,
          title: 'Alamat Email',
          hintText: 'Isi alamat email',
          isFilled: true,
          suffixIconState: email != null && email.isNotEmpty,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => Validation.formField(
            titleField: 'alamat email',
            value: value,
            isEmail: true,
            isRequired: false,
          ),
        );
      },
    );
  }

  Widget builderCheckboxEmail() {
    return Obx(
      () => CheckboxListTile(
        value: controller.isCheckedEmail.value,
        title: const Text('Notifikasi Email'),
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
        onChanged: (value) => controller.isCheckedEmail.toggle(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      ),
    );
  }

  Widget builderLokasi(RJPatientModel? data) {
    return Obx(
      () => CustomDropdownTypeFormField(
        isRequired: true,
        title: 'Lokasi',
        isFilled: true,
        // isItemsCached: true,
        disabledItemFn: (item) => item == controller.lokasi.value,
        selectedItem: controller.lokasi.value,
        asyncItems: controller.fetchLocation,
        itemAsString: (value) => value.locationName ?? '',
        onChanged: controller.onChangedLocation,
        validator: (value) => Validation.formField(
          titleField: 'Lokasi',
          value: value?.locationName,
          isRequired: true,
        ),
      ),
    );
  }

  Widget builderPoli(RJPatientModel? data) {
    return Obx(
      () => CustomDropdownTypeFormField(
        isRequired: true,
        title: 'Poli',
        isFilled: true,
        // isItemsCached: true,
        isEnabled: controller.lokasi.value != null,
        selectedItem: controller.poli.value,
        // items: (filter, props) => ConstantsStrings.dataPoly,
        items: ConstantsStrings.dataPoly,
        itemAsString: (value) => value,
        validator: (value) => Validation.formField(
          titleField: 'Poli',
          value: value,
          isRequired: true,
        ),
      ),
    );
  }

  Widget builderTenagaMedis(RJPatientModel? data) {
    return Obx(
      () => CustomDropdownTypeFormField(
        isRequired: true,
        title: 'Tenaga Medis',
        isFilled: true,
        // isItemsCached: true,
        selectedItem: controller.tenagaMedis.value,
        asyncItems: controller.fetchDoctor,
        itemAsString: (value) => TextHelper.replacePrefixText(
          prefix: '*',
          value: value.nama,
          replaceValue: value.dokters?.gelar,
        ),
        onChanged: controller.onChangeTenagaMedis,
        validator: (value) => Validation.formField(
          titleField: 'Tenaga Medis',
          value: value?.nama,
          isRequired: true,
        ),
      ),
    );
  }

  Widget builderTanggal() {
    return CustomTextFormField(
      controller: controller.tanggalC,
      title: 'Tanggal',
      hintText: 'Pilih Tanggal',
      helperText: 'Dokter praktek hari ini',
      isFilled: true,
      suffixIcon: const Icon(Icons.date_range_rounded),
      keyboardType: TextInputType.datetime,
      isReadOnly: true,
      onTap: () async {
        final now = DateTime.now();
        final nextYear = DateTime(now.add(const Duration(days: 365)).year);

        final date = await showDatePicker(
          context: Get.context!,
          initialDate: controller.tanggal.value,
          currentDate: now,
          firstDate: now,
          lastDate: nextYear,
        );

        if (date != null) controller.setDate(date);
      },
      validator: (value) => Validation.formField(
        titleField: 'Tanggal',
        value: value,
        isRequired: true,
      ),
    );
  }

  Widget builderSlot(RJPatientModel? data) {
    return Obx(
      () => CustomDropdownTypeFormField(
        isRequired: true,
        title: 'Slot',
        helperText: 'Pilih slot jadwal dokter',
        isFilled: true,
        // isItemsCached: true,
        selectedItem: controller.slot.value,
        asyncItems: controller.fetchSlot,
        itemAsString: controller.formatSlotTime,
        isEnabled: controller.tenagaMedis.value != null,
        onChanged: controller.onChangedSlot,
        validator: (value) => Validation.formField(
          titleField: 'Slot',
          value: '${value?.start ?? ''}',
          isRequired: true,
        ),
      ),
    );
  }

  Widget builderJamDanLamaDurasi() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: builderJam()),
        const SizedBox(width: 12),
        Expanded(child: builderLamaDurasi()),
      ],
    );
  }

  Widget builderJam() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.jamC,
        isRequired: true,
        title: 'Jam',
        hintText: '--:--',
        isFilled: true,
        keyboardType: TextInputType.datetime,
        suffixIcon: const Icon(Icons.schedule_rounded),
        isReadOnly: true,
        isEnable: controller.tenagaMedis.value != null &&
            controller.slot.value != null,
        onTap: () async {
          final time = await showTimePicker(
            context: Get.context!,
            initialTime: controller.jam.value ?? TimeOfDay.now(),
            builder: (context, child) => MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child!,
            ),
          );

          // check time must include beetween slot selected
          if (time != null) {
            final startTime =
                FormatDateTime.intToTime(controller.slot.value?.start ?? 0);
            final endTime =
                FormatDateTime.intToTime(controller.slot.value?.end ?? 21);

            final isTimeInRange = Helper.isTimeInRange(
              startTime: startTime,
              endTime: endTime,
              selectedTime: time,
            );

            if (isTimeInRange) {
              controller.setTime(time);
            } else {
              Snackbar.failed(
                context: Get.context!,
                content:
                    'Jam yang dipilih tidak sesuai dengan rentang waktu slot',
              );
            }
          }
        },
        validator: (value) => Validation.formField(
          titleField: 'Jam',
          value: value,
        ),
      ),
    );
  }

  Widget builderLamaDurasi() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.lamaDurasiC,
        focusNode: controller.lamaDurasiF,
        title: 'Lama Durasi',
        hintText: 'Isi Lama Durasi',
        helperText: 'Maks. ${controller.slot.value?.maxDuration ?? 0} menit',
        isRequired: true,
        isFilled: true,
        keyboardType: TextInputType.number,
        maxLines: 1,
        isNumericOnly: true,
        isEnable: controller.tenagaMedis.value != null &&
            controller.slot.value != null,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) => Validation.formField(
          titleField: 'Lama Durasi',
          value: value,
          isRequired: true,
          isNumericOnly: true,
          isNotZero: true,
          maxLength: controller.slot.value?.maxDuration,
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
        suffixIconState: controller.keluhan.value != null &&
            controller.keluhan.value!.isNotEmpty,
        validator: (value) => Validation.formField(
          titleField: 'Keluhan',
          value: value,
          isRequired: false,
        ),
      ),
    );
  }

  Widget builderProsedur() {
    return Obx(
      () => CustomTextFormField(
        controller: controller.prosedurC,
        focusNode: controller.prosedurF,
        title: 'Prosedur',
        hintText: 'Isi Prosedur',
        isFilled: true,
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        suffixIconState: controller.prosedur.value != null &&
            controller.prosedur.value!.isNotEmpty,
        validator: (value) => Validation.formField(
          titleField: 'Prosedur',
          value: value,
          isRequired: false,
        ),
      ),
    );
  }

  Widget builderVitalSign() {
    return Obx(
      () => Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Buttons.text(
              onPressed: controller.isShowVitalSign.toggle,
              child: const Text('Tambahkan Vital Sign'),
              icon: Icon(
                (controller.isShowVitalSign.value)
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
              ),
              iconAlignment: IconAlignment.end,
            ),
          ),
          if (controller.isShowVitalSign.value) ...[
            const SizedBox(height: 8),
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
          ],
        ],
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
}

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:privata/app/data/models/rj/item_rj/patient/rj_patient_model.dart';
// import 'package:privata/app/modules/widgets/buttons/buttons.dart';
// import 'package:privata/app/modules/widgets/textformfield/text_form_fields.dart';

// import '../../../../../../shared/shared_theme.dart';
// import '../../../../../data/db/range/range_model.dart';
// import '../../../../../helpers/validations.dart';
// import '../../../../widgets/card/cards.dart';
// import '../../../../widgets/textformfield/custom_textform_field.dart';
// import '../controllers/visit_registration_controller.dart';

// class VisitRegistrationView extends GetView<VisitRegistrationController> {
//   const VisitRegistrationView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: builderAppBar(),
//       body: builderBody(),
//     );
//   }

//   AppBar builderAppBar() {
//     return AppBar(
//       title: const Text('Pendaftaran Kunjungan'),
//       centerTitle: true,
//       actions: [
//         Buttons.text(
//           onPressed: controller.save,
//           child: const Text('Simpan'),
//         ),
//       ],
//     );
//   }

//   Widget builderBody() {
//     return controller.obx(
//       (value) {
//         return Cards.elevated(
//           outPadding: const EdgeInsets.all(8),
//           child: builderForm(value),
//         );
//       },
//       onLoading: const Center(child: CircularProgressIndicator.adaptive()),
//     );
//   }

//   Widget builderForm(RJPatientModel? value) {
//     return Form(
//       key: controller.formKey,
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(6),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: controller.mapWidget.map(
//             (element) {
//               if (element['layout'] == 'row') {
//                 final widgets =
//                     element['widgets'] as List<Map<String, Object?>>;
//                 final isVisible = element['isVisible'] as RxBool?;

//                 return Obx(
//                   () => Visibility(
//                     visible: isVisible?.value ?? RxBool(true).value,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: widgets
//                           .map(
//                             (item) => Expanded(
//                               child: builderItem(
//                                 widgets: widgets,
//                                 item: item,
//                                 margin: const EdgeInsets.fromLTRB(4, 0, 4, 16),
//                               ),
//                             ),
//                           )
//                           .toList(),
//                     ),
//                   ),
//                 );
//               }

//               if (element['layout'] == 'column') {
//                 final widgets =
//                     element['widgets'] as List<Map<String, Object?>>;
//                 return Column(
//                   children: widgets
//                       .map(
//                         (item) => builderItem(
//                           widgets: widgets,
//                           item: item,
//                           margin: const EdgeInsets.only(bottom: 18),
//                         ),
//                       )
//                       .toList(),
//                 );
//               }

//               return const SizedBox.shrink();
//             },
//           ).toList(),
//         ),
//       ),
//     );
//   }

//   Widget builderItem({
//     required List<Map<String, Object?>> widgets,
//     required Map<String, Object?> item,
//     required EdgeInsets margin,
//   }) {
//     return Obx(
//       () {
//         return switch (item['type']) {
//           'textfield' => switch (item['subType']) {
//               'dropdown' => builderNewDropdown(margin, widgets, item),
//               'search' => builderSearch(item, margin),
//               _ => builderTextfield(item, margin),
//             },
//           'checkbox' => builderCheckbox(margin, item),
//           'button' => switch (item['subType']) {
//               'dropdown' => builderButtonDropdown(margin, item, widgets),
//               _ => const SizedBox.shrink(),
//             },
//           _ => const SizedBox.shrink(),
//         };
//       },
//     );
//   }

//   Widget builderTextfield(Map<String, Object?> item, EdgeInsets margin) {
//     bool? suffixIconState;

//     if (item['subType'] == 'date') {
//       final obs = item['obs'] as Rxn<DateTime>;
//       suffixIconState = obs.value != null;
//     } else if (item['subType'] == 'time') {
//       final obs = item['obs'] as Rxn<TimeOfDay>;
//       suffixIconState = obs.value != null;
//     } else {
//       final obs = item['obs'] as Rx<String>;

//       if (item['title'] == 'Nama Pasien') {
//         obs.value;
//       } else {
//         suffixIconState = obs.value.isNotEmpty && obs.value != '';
//       }
//     }

//     return Visibility(
//       visible: (item['isVisible'] as RxBool?)?.value ?? true,
//       child: Container(
//         margin: margin,
//         child: CustomTextFormField(
//           controller: item['controller'] as TextEditingController,
//           focusNode: item['node'] as FocusNode?,
//           isRequired: item['isRequired'] as bool,
//           title: item['title'] as String,
//           hintText: item['hintText'] as String?,
//           helperText: item['helperText'] as String?,
//           isFilled: item['isFilled'] as bool,
//           suffixIcon: item['suffixIcon'] as Icon?,
//           suffixIconState: suffixIconState,
//           maxLines: item['maxLines'] as int?,
//           maxLength: item['maxLength'] as int?,
//           keyboardType: item['keyboardType'] as TextInputType,
//           isReadOnly: item['isReadOnly'] as bool,
//           onChanged: (value) => controller.onChanged(value, item),
//           onTap: () async {
//             if (item['subType'] == 'date') {
//               final now = DateTime.now();
//               final nextYear =
//                   DateTime(now.add(const Duration(days: 365)).year);

//               final date = await showDatePicker(
//                 context: Get.context!,
//                 initialDate:
//                     (item['obs'] as Rxn<DateTime>).value ?? DateTime.now(),
//                 currentDate: now,
//                 firstDate: now,
//                 lastDate: nextYear,
//               );

//               // if (date != null) controller.setDate(date, item);
//             }

//             if (item['subType'] == 'time') {
//               final time = await showTimePicker(
//                 context: Get.context!,
//                 initialTime:
//                     (item['obs'] as Rxn<TimeOfDay>).value ?? TimeOfDay.now(),
//                 builder: (context, child) => MediaQuery(
//                   data: MediaQuery.of(context)
//                       .copyWith(alwaysUse24HourFormat: true),
//                   child: child!,
//                 ),
//               );

//               // check time must include beetween slot selected
//               if (time != null) {
//                 // final startTime = FormatDateTime.intToTime(
//                 //     controller.selectedSlot.value?.start ?? 0);
//                 // final endTime = FormatDateTime.intToTime(
//                 //     controller.selectedSlot.value?.end ?? 21);

//                 // final isTimeInRange = Helper.isTimeInRange(
//                 //   startTime: startTime,
//                 //   endTime: endTime,
//                 //   selectedTime: time,
//                 // );

//                 // if (isTimeInRange) {
//                 //   controller.setTime(time, item);
//                 // } else {
//                 //   Snackbar.failed(
//                 //     context: Get.context!,
//                 //     content:
//                 //         'Jam yang dipilih tidak sesuai dengan rentang waktu slot',
//                 //   );
//                 // }
//               }
//             }
//           },
//           validator: (value) {
//             if (item['validator'] != null) {
//               final validator = item['validator'] as Map<String, dynamic>;
//               return Validation.formField(
//                 value: value,
//                 titleField: validator['title'] as String,
//                 // isRequired: item['isRequired'] as bool, //! soon
//                 isNumericOnly: validator['isNumericOnly'] as bool?,
//                 isEmail: validator['isEmail'] as bool?,
//                 minLengthChar: validator['minLength'] as int?,
//                 maxLengthChar: validator['maxLength'] as int?,
//                 isNotZero: validator['isNotZero'] as bool?,
//                 range: validator['range'] as RangeModel?,
//                 messageNotZero: validator['messageNotZero'] as String?,
//                 messageMinChar: validator['messageMinChar'] as String?,
//                 messageMaxChar: validator['messageMaxChar'] as String?,
//               );
//             }
//             return null;
//           },
//         ),
//       ),
//     );
//   }

//   Widget builderNewDropdown(
//     EdgeInsets margin,
//     List<Map<String, Object?>> widgets,
//     Map<String, Object?> item,
//   ) {
//     List<DropdownMenuItem<String>> itemsBuilder;

//     if (item['items'] is RxList<String>) {
//       final obs = item['obs'] as RxString?;
//       final items = item['items'] as RxList<String>;
//       itemsBuilder = items
//           .map(
//             (item) => DropdownMenuItem(
//               value: item,
//               enabled: obs?.value != item,
//               child: Text(item),
//             ),
//           )
//           .toList();
//     } else {
//       final obs = item['obs'] as RxString?;
//       final items = item['items'] as List<String>;
//       itemsBuilder = items
//           .map(
//             (item) => DropdownMenuItem(
//               value: item,
//               enabled: obs?.value != item,
//               child: Text(item),
//               // child: ListTile(
//               //   title: Text(item),
//               //   trailing: (obs?.value == item)
//               //       ? Icon(
//               //           Icons.check_circle_rounded,
//               //           color: SharedTheme.successColor,
//               //         )
//               //       : null,
//               // ),
//             ),
//           )
//           .toList();
//     }

//     return Visibility(
//       visible: (item['isVisible'] as RxBool?)?.value ?? true,
//       child: Container(
//         margin: margin,
//         child: DropdownButtonFormField(
//           items: itemsBuilder,
//           decoration: InputDecoration(
//             isDense: true,
//             errorMaxLines: 2,
//             border: (!(item['isFilled'] as bool))
//                 ? OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 1,
//                       color: Get.theme.colorScheme.outline,
//                     ),
//                     borderRadius: BorderRadius.circular(12),
//                   )
//                 : null,
//             filled: item['isFilled'] as bool,
//           ),
//           isExpanded: true,
//           menuMaxHeight: 200,
//           onChanged: (value) {
//             print('value item dropdown = $value');
//           },
//         ),
//       ),
//     );
//   }

//   Widget builderDropdown(
//     EdgeInsets margin,
//     List<Map<String, Object?>> widgets,
//     Map<String, Object?> item,
//   ) {
//     List<DropdownMenuEntry<String>> itemsBuilder;

//     if (item['items'] is RxList<String>) {
//       final obs = item['obs'] as RxString?;
//       final items = item['items'] as RxList<String>;
//       itemsBuilder = items
//           .map(
//             (item) => DropdownMenuEntry(
//               value: item,
//               label: item,
//               enabled: obs?.value != item,
//               trailingIcon: (obs?.value == item)
//                   ? Icon(
//                       Icons.check_circle_rounded,
//                       color: SharedTheme.successColor,
//                     )
//                   : null,
//             ),
//           )
//           .toList();
//     } else {
//       final obs = item['obs'] as RxString?;
//       final items = item['items'] as List<String>;
//       itemsBuilder = items
//           .map(
//             (item) => DropdownMenuEntry(
//               value: item,
//               label: item,
//               enabled: obs?.value != item,
//               trailingIcon: (obs?.value == item)
//                   ? Icon(
//                       Icons.check_circle_rounded,
//                       color: SharedTheme.successColor,
//                     )
//                   : null,
//             ),
//           )
//           .toList();
//     }

//     return Visibility(
//       visible: (item['isVisible'] as RxBool?)?.value ?? true,
//       child: Container(
//         margin: margin,
//         child: TextFormFields.dropdown(
//           controller: item['controller'] as TextEditingController,
//           focusNode: item['node'] as FocusNode?,
//           isRequired: item['isRequired'] as bool,
//           title: item['title'] as String,
//           hintText: item['hintText'] as String?,
//           helperText: item['helperText'] as String?,
//           isExpanded: true,
//           isFilled: item['isFilled'] as bool,
//           isDense: true,
//           isEnabled: (item['isEnabled'] as RxBool).value,
//           items: itemsBuilder,
//           menuHeight: 200,
//           onSelected: (value) => controller.onSelected(value, widgets),
//         ),
//       ),
//     );
//   }

//   Widget builderSearch(Map<String, Object?> item, EdgeInsets margin) {
//     return Visibility(
//       visible: (item['isVisible'] as RxBool?)?.value ?? true,
//       child: Container(
//         margin: margin,
//         child: TextFormFields.search(
//           controller: item['controller'] as TextEditingController,
//           focusNode: item['node'] as FocusNode,
//           isRequired: item['isRequired'] as bool,
//           title: item['title'] as String,
//           hintText: item['hintText'] as String?,
//           isEnabled: (item['isEnabled'] as RxBool).value,
//           items: (item['items'] as List<String>)
//               .map(
//                 (item) => DropdownMenuEntry(
//                   value: item,
//                   label: item,
//                 ),
//               )
//               .toList(),
//           searchCallback: (_, query) => controller.searchNamaPembayaran(query),
//         ),
//       ),
//     );
//   }

//   Widget builderCheckbox(EdgeInsets margin, Map<String, Object?> item) {
//     return Container(
//       margin: margin,
//       child: CheckboxListTile.adaptive(
//         value: (item['obs'] as RxBool).value,
//         title: Text(item['title'] as String),
//         controlAffinity: ListTileControlAffinity.leading,
//         dense: true,
//         contentPadding: const EdgeInsets.all(0),
//         visualDensity: VisualDensity.compact,
//         onChanged: (value) => controller.onChangedChecbox(value, item),
//       ),
//     );
//   }

//   Widget builderButtonDropdown(
//     EdgeInsets margin,
//     Map<String, Object?> item,
//     List<Map<String, Object?>> widgets,
//   ) {
//     final obs = (item['obs'] as RxBool);
//     return Container(
//       margin: margin,
//       child: Align(
//         alignment: Alignment.topRight,
//         child: Buttons.text(
//           onPressed: () => controller.onPressed(obs),
//           child: Text('${item['title']}'),
//           icon: Icon(
//             (obs.value)
//                 ? Icons.keyboard_arrow_up_rounded
//                 : Icons.keyboard_arrow_down_rounded,
//           ),
//           iconAlignment: IconAlignment.end,
//         ),
//       ),
//     );
//   }

//   // Widget builderPenjamin(RJPatientModel? value) {
//   //   final list = [controller.penjaminC.text];

//   //   if (value != null) {
//   //     final family = value.family;
//   //     family?.forEach(
//   //       (item) {
//   //         list.addIf(item.name != null, item.name!);
//   //       },
//   //     );
//   //   }

//   //   return TextFormFields.dropdown(
//   //     controller: controller.penjaminC,
//   //     focusNode: controller.penjaminF,
//   //     title: 'Penjamin*',
//   //     hintText: 'Pilih Penjamin',
//   //     isExpanded: true,
//   //     isFilled: true,
//   //     isDense: true,
//   //     items: list
//   //         .map(
//   //           (item) => DropdownMenuEntry(
//   //             value: item,
//   //             label: item,
//   //           ),
//   //         )
//   //         .toList(),
//   //     menuHeight: 200,
//   //     // onSelected: controller.selectedPenjamin,
//   //   );
//   // }

//   // Widget builderMetodePembayaran(RJPatientModel? value) {
//   //   return TextFormFields.dropdown(
//   //     controller: controller.metodePembayaranC,
//   //     focusNode: controller.metodePembayaranF,
//   //     title: 'Metode Pembayaran*',
//   //     isExpanded: true,
//   //     isFilled: true,
//   //     isDense: true,
//   //     items: ConstantsStrings.dataMethodPayment
//   //         .map(
//   //           (e) => DropdownMenuEntry(value: e, label: e),
//   //         )
//   //         .toList(),
//   //     menuHeight: 200,
//   //     onSelected: controller.selectedMetodePembayaran,
//   //   );
//   // }

//   // Widget builderNoBPJSKesehatan() {
//   //   return Obx(
//   //     () => Visibility(
//   //       visible: controller.indexMetodePembayaran.value == 1,
//   //       child: Column(
//   //         children: [
//   //           TextFormFields.filled(
//   //             controller: controller.noBPJSKesehatanC,
//   //             focusNode: controller.noBPJSKesehatanF,
//   //             title: 'Nomor BPJS Kesehatan*',
//   //             hintText: 'Isi Nomor BPJS Kesehatan',
//   //             keyboardType: TextInputType.number,
//   //             maxLines: 1,
//   //             maxLength: 11,
//   //             suffixIconState: controller.noBPJSKesehatan.value.isNotEmpty,
//   //             textInputAction: TextInputAction.next,
//   //             validator: (value) => Validation.formField(
//   //               value: value,
//   //               titleField: 'Nomor BPJS Kesehatan',
//   //               isNumericOnly: true,
//   //               minLength: 11,
//   //             ),
//   //           ),
//   //           const SizedBox(height: 16),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget builderNoBPJSKetenagakerjaan() {
//   //   return Obx(
//   //     () => Visibility(
//   //       visible: controller.indexMetodePembayaran.value == 2,
//   //       child: Column(
//   //         children: [
//   //           TextFormFields.filled(
//   //             controller: controller.noBPJSKetenagakerjaanC,
//   //             focusNode: controller.noBPJSKetenagakerjaanF,
//   //             title: 'Nomor BPJS Ketenagakerjaan*',
//   //             hintText: 'Isi Nomor BPJS Ketenagakerjaan',
//   //             keyboardType: TextInputType.number,
//   //             maxLines: 1,
//   //             maxLength: 11,
//   //             suffixIconState:
//   //                 controller.noBPJSKetenagakerjaan.value.isNotEmpty,
//   //             textInputAction: TextInputAction.next,
//   //             validator: (value) => Validation.formField(
//   //               value: value,
//   //               titleField: 'Nomor BPJS Ketenagakerjaan',
//   //               isNumericOnly: true,
//   //               minLength: 11,
//   //             ),
//   //           ),
//   //           const SizedBox(height: 16),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget builderAsuransi() {
//   //   return Obx(
//   //     () => Visibility(
//   //       visible: controller.indexMetodePembayaran.value == 3,
//   //       child: Column(
//   //         children: [
//   //           TextFormFields.search(
//   //             controller: controller.noBPJSKetenagakerjaanC,
//   //             focusNode: controller.noBPJSKetenagakerjaanF,
//   //             title: 'Asuransi*',
//   //             hintText: 'Isi Asuransi', items: [],
//   //             searchCallback: (_, query) => controller.searchAsuransi(query),
//   //             // keyboardType: TextInputType.number,
//   //             // maxLines: 1,
//   //             // maxLength: 11,
//   //             // suffixIconState: controller.noBPJSKetenagakerjaan.value.isNotEmpty,
//   //             // textInputAction: TextInputAction.next,
//   //             // validator: (value) => Validation.formField(
//   //             //   value: value,
//   //             //   titleField: 'Asuransi',
//   //             //   isNumericOnly: true,
//   //             //   minLength: 11,
//   //             // ),
//   //           ),
//   //           const SizedBox(height: 16),
//   //           TextFormFields.filled(
//   //             controller: controller.noAsuransiC,
//   //             focusNode: controller.noAsuransiF,
//   //             title: 'Nomor Asuransi*',
//   //             hintText: 'Isi Nomor Asuransi',
//   //             keyboardType: TextInputType.number,
//   //             maxLines: 1,
//   //             suffixIconState: controller.noAsuransi.value.isNotEmpty,
//   //             textInputAction: TextInputAction.next,
//   //             validator: (value) => Validation.formField(
//   //               value: value,
//   //               titleField: 'Nomor Asuransi',
//   //               isNumericOnly: true,
//   //             ),
//   //           ),
//   //           const SizedBox(height: 16),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget builderPerusahaan() {
//   //   return Obx(
//   //     () => Visibility(
//   //       visible: controller.indexMetodePembayaran.value == 4,
//   //       child: Column(
//   //         children: [
//   //           TextFormFields.search(
//   //             controller: controller.perusahaanC,
//   //             focusNode: controller.perusahaanF,
//   //             title: 'Perusahaan*',
//   //             hintText: 'Isi Perusahaan',
//   //             items: [],
//   //             searchCallback: (_, query) => controller.searchPerusahaan(query),
//   //           ),
//   //           const SizedBox(height: 16),
//   //           TextFormFields.filled(
//   //             controller: controller.noPerusahaanC,
//   //             focusNode: controller.noPerusahaanF,
//   //             title: 'Nomor Perusahaan*',
//   //             hintText: 'Isi Nomor Perusahaan',
//   //             keyboardType: TextInputType.number,
//   //             maxLines: 1,
//   //             suffixIconState: controller.noPerusahaan.value.isNotEmpty,
//   //             textInputAction: TextInputAction.next,
//   //             validator: (value) => Validation.formField(
//   //               value: value,
//   //               titleField: 'Nomor Perusahaan',
//   //               isNumericOnly: true,
//   //             ),
//   //           ),
//   //           const SizedBox(height: 16),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget builderKartuDebit() {
//   //   return Obx(
//   //     () => Visibility(
//   //       visible: controller.indexMetodePembayaran.value == 5,
//   //       child: Column(
//   //         children: [
//   //           TextFormFields.search(
//   //             controller: controller.kartuDebitC,
//   //             focusNode: controller.kartuDebitF,
//   //             title: 'Kartu Debit*',
//   //             hintText: 'Isi Kartu Debit',
//   //             items: [],
//   //             searchCallback: (_, query) => controller.searchKartuDebit(query),
//   //           ),
//   //           const SizedBox(height: 16),
//   //           TextFormFields.filled(
//   //             controller: controller.noKartuDebitC,
//   //             focusNode: controller.noKartuDebitF,
//   //             title: 'Nomor Kartu Debit*',
//   //             hintText: 'Isi Nomor Kartu Debit',
//   //             keyboardType: TextInputType.number,
//   //             maxLines: 1,
//   //             suffixIconState: controller.noKartuDebit.value.isNotEmpty,
//   //             textInputAction: TextInputAction.next,
//   //             validator: (value) => Validation.formField(
//   //               value: value,
//   //               titleField: 'Nomor kartu debit',
//   //               isNumericOnly: true,
//   //             ),
//   //           ),
//   //           const SizedBox(height: 16),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget builderKartuKredit() {
//   //   return Obx(
//   //     () => Visibility(
//   //       visible: controller.indexMetodePembayaran.value == 6,
//   //       child: Column(
//   //         children: [
//   //           TextFormFields.search(
//   //             controller: controller.kartuKreditC,
//   //             focusNode: controller.kartuKreditF,
//   //             title: 'Kartu Kredit*',
//   //             hintText: 'Isi Kartu Kredit',
//   //             items: [],
//   //             searchCallback: (_, query) => controller.searchKartuKredit(query),
//   //           ),
//   //           const SizedBox(height: 16),
//   //           TextFormFields.filled(
//   //             controller: controller.noKartuKreditC,
//   //             focusNode: controller.noKartuKreditF,
//   //             title: 'Nomor Kartu Kredit*',
//   //             hintText: 'Isi Nomor Kartu Kredit',
//   //             keyboardType: TextInputType.number,
//   //             maxLines: 1,
//   //             suffixIconState: controller.noKartuKredit.value.isNotEmpty,
//   //             textInputAction: TextInputAction.next,
//   //             validator: (value) => Validation.formField(
//   //               value: value,
//   //               titleField: 'Nomor kartu kredit',
//   //               isNumericOnly: true,
//   //             ),
//   //           ),
//   //           const SizedBox(height: 16),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget builderJenisKunjungan() {
//   //   return TextFormFields.dropdown(
//   //     controller: controller.jenisKunjunganC,
//   //     focusNode: controller.jenisKunjunganF,
//   //     title: 'Jenis Kunjungan*',
//   //     isExpanded: true,
//   //     isFilled: true,
//   //     isDense: true,
//   //     isEnableSearch: false,
//   //     items: ConstantsStrings.dataVisitType
//   //         .map(
//   //           (item) => DropdownMenuEntry(
//   //             value: item,
//   //             label: item,
//   //           ),
//   //         )
//   //         .toList(),
//   //     menuHeight: 200,
//   //     onSelected: controller.selectedJenisKunjungan,
//   //   );
//   // }

//   // Widget builderJenisPerawatan() {
//   //   return Obx(
//   //     () {
//   //       List<String> data = [];
//   //       final indexKunjungan = ConstantsStrings.dataVisitType
//   //           .indexOf(controller.jenisKunjungan.value);

//   //       switch (indexKunjungan) {
//   //         case 1:
//   //           // data.clear();
//   //           data.add(ConstantsStrings.dataServiceType.first);
//   //           break;
//   //         case 2:
//   //           // data.clear();
//   //           data.addAll(['Tubuh', 'Wajah']);
//   //           break;
//   //         default:
//   //           // data.clear();
//   //           data.addAll(ConstantsStrings.dataServiceType);
//   //           break;
//   //       }

//   //       return TextFormFields.dropdown(
//   //         controller: controller.jenisPerawatanC,
//   //         focusNode: controller.jenisPerawatanF,
//   //         title: 'Jenis Perawatan*',
//   //         isExpanded: true,
//   //         isFilled: true,
//   //         isDense: true,
//   //         isEnableSearch: false,
//   //         isEnabled: controller.jenisKunjungan.value.isNotEmpty,
//   //         items: data
//   //             .map(
//   //               (item) => DropdownMenuEntry(
//   //                 value: item,
//   //                 label: item,
//   //               ),
//   //             )
//   //             .toList(),
//   //         menuHeight: 200,
//   //         onSelected: controller.selectedMetodePembayaran,
//   //       );
//   //     },
//   //   );
//   // }

//   // Widget builderNomorHP() {
//   //   return Obx(
//   //     () => TextFormFields.filled(
//   //       controller: controller.noHPC,
//   //       focusNode: controller.noHPF,
//   //       title: 'No HP*',
//   //       hintText: 'Isi No HP',
//   //       keyboardType: TextInputType.phone,
//   //       maxLines: 1,
//   //       suffixIconState: controller.noHP.value.isNotEmpty,
//   //       validator: (value) => Validation.formField(
//   //         value: value,
//   //         titleField: 'No HP',
//   //         isNumericOnly: true,
//   //       ),
//   //       onFieldSubmitted: (_) => controller.alamatEmailF.requestFocus(),
//   //     ),
//   //   );
//   // }

//   // Widget builderAlamatEmail() {
//   //   return Obx(
//   //     () => Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       mainAxisSize: MainAxisSize.min,
//   //       children: [
//   //         TextFormFields.filled(
//   //           controller: controller.alamatEmailC,
//   //           focusNode: controller.alamatEmailF,
//   //           title: 'Alamat Email*',
//   //           hintText: 'Isi alamat email',
//   //           keyboardType: TextInputType.emailAddress,
//   //           maxLines: 1,
//   //           suffixIconState: controller.alamatEmail.value.isNotEmpty,
//   //           validator: (value) => Validation.formField(
//   //             value: value,
//   //             titleField: 'Alamat email',
//   //             isEmail: true,
//   //           ),
//   //           onFieldSubmitted: (_) => controller.penjaminF.requestFocus(),
//   //         ),
//   //         const SizedBox(height: 8),
//   //         CheckboxListTile.adaptive(
//   //           value: controller.isCheckNoticationEmail.value,
//   //           title: const Text('Notifikasi Email'),
//   //           controlAffinity: ListTileControlAffinity.leading,
//   //           dense: true,
//   //           contentPadding: const EdgeInsets.symmetric(horizontal: 0),
//   //           onChanged: controller.changeCheckNotification,
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   // Widget builderTenagaMedis() {
//   //   return
//   //       // Obx(
//   //       //   () =>
//   //       TextFormFields.dropdown(
//   //     controller: controller.tenagaMedisC,
//   //     focusNode: controller.tenagaMedisF,
//   //     title: 'Tenaga Medis*',
//   //     isExpanded: true,
//   //     isFilled: true,
//   //     isDense: true,
//   //     isEnableSearch: false,
//   //     items: ['drs. Eka Sinta Aprillia', 'dr. Andrean Ramadhan']
//   //         .map(
//   //           (item) => DropdownMenuEntry(
//   //             value: item,
//   //             label: item,
//   //           ),
//   //         )
//   //         .toList(),
//   //     // isEnabled: controller.tempDataProvinces.isNotEmpty,
//   //     // textStyle: textTheme.titleMedium,
//   //     menuHeight: 200,
//   //     // onSelected: controller.selectedMetodePembayaran,
//   //     // ),
//   //   );
//   // }

//   // Widget builderTanggal() {
//   //   return TextFormFields.filled(
//   //     controller: controller.tanggalC,
//   //     focusNode: controller.tanggalF,
//   //     title: 'Tanggal*',
//   //     hintText: 'Pilih tanggal',
//   //     helperText: 'Dokter praktek hari ini',
//   //     keyboardType: TextInputType.datetime,
//   //     suffixIcon: const Icon(Icons.date_range_rounded),
//   //     maxLines: 1,
//   //     isReadOnly: true,
//   //     validator: (value) => Validation.formField(
//   //       value: value,
//   //       titleField: 'Tanggal',
//   //     ),
//   //     onTap: () async {
//   //       final now = DateTime.now();
//   //       final nextYear = DateTime(now.add(const Duration(days: 365)).year);

//   //       final date = await showDatePicker(
//   //         context: Get.context!,
//   //         initialDate: controller.tanggal.value,
//   //         currentDate: now,
//   //         firstDate: now,
//   //         lastDate: nextYear,
//   //         initialEntryMode: DatePickerEntryMode.calendarOnly,
//   //       );

//   //       if (date != null) {
//   //         controller.setDate(date);
//   //       }
//   //     },
//   //   );
//   // }

//   // Widget builderSlot() {
//   //   return
//   //       // Obx(
//   //       //   () =>
//   //       TextFormFields.dropdown(
//   //     controller: controller.slotC,
//   //     focusNode: controller.slotF,
//   //     title: 'Slot*',
//   //     hintText: 'Pilih Slot Jadwal',
//   //     helperText: 'Pilih slot jadwal dokter',
//   //     isExpanded: true,
//   //     isFilled: true,
//   //     isDense: true,
//   //     isEnableSearch: false,
//   //     items: ['08:00 - 12:00 WIB', '14:00 - 16:00 WIB']
//   //         .map(
//   //           (item) => DropdownMenuEntry(
//   //             value: item,
//   //             label: item,
//   //           ),
//   //         )
//   //         .toList(),
//   //     // isEnabled: controller.tempDataProvinces.isNotEmpty,
//   //     // textStyle: textTheme.titleMedium,
//   //     menuStyle: const MenuStyle(
//   //       maximumSize: WidgetStatePropertyAll(
//   //         Size.fromHeight(300),
//   //       ),
//   //     ),
//   //     // onSelected: controller.selectedMetodePembayaran,
//   //     // ),
//   //   );
//   // }

//   // Widget builderJamDanLamaDurasi() {
//   //   return Row(
//   //     crossAxisAlignment: CrossAxisAlignment.start,
//   //     children: [
//   //       Expanded(
//   //         child: Obx(
//   //           () => TextFormFields.outlined(
//   //             controller: controller.timeC,
//   //             isReadOnly: true,
//   //             title: 'Jam*',
//   //             hintText: 'Pilih Jam',
//   //             isEnable: controller.selectedSlot.value != null,
//   //             keyboardType: TextInputType.datetime,
//   //             textInputAction: TextInputAction.next,
//   //             suffixIcon: const Icon(Icons.schedule_rounded),
//   //             onTap: () async {
//   //               final time = await showTimePicker(
//   //                 context: Get.context!,
//   //                 initialTime: TimeOfDay.now(),
//   //                 // controller.selectedTimeReschedule
//   //                 builder: (context, child) {
//   //                   return MediaQuery(
//   //                     data: MediaQuery.of(context)
//   //                         .copyWith(alwaysUse24HourFormat: true),
//   //                     child: child!,
//   //                   );
//   //                 },
//   //               );

//   //               // check time must include beetween slot selected
//   //               if (time != null) {
//   //                 final startTime = FormatDateTime.intToTime(
//   //                     controller.selectedSlot.value?.start ?? 0);
//   //                 final endTime = FormatDateTime.intToTime(
//   //                     controller.selectedSlot.value?.end ?? 0);

//   //                 final isTimeInRange = Helper.isTimeInRange(
//   //                   startTime: startTime,
//   //                   endTime: endTime,
//   //                   selectedTime: time,
//   //                 );

//   //                 if (isTimeInRange) {
//   //                   controller.setTime(time);
//   //                 } else {
//   //                   Snackbar.failed(
//   //                     context: Get.context!,
//   //                     content:
//   //                         'Jam yang dipilih tidak sesuai dengan rentang waktu slot',
//   //                   );
//   //                 }
//   //               }
//   //             },
//   //           ),
//   //         ),
//   //       ),
//   //       const SizedBox(width: 12),
//   //       Expanded(
//   //         child: Obx(
//   //           () => TextFormFields.outlined(
//   //             controller: controller.durationC,
//   //             title: 'Lama Durasi*',
//   //             hintText: 'Misal 10',
//   //             suffixText: 'Menit',
//   //             keyboardType: TextInputType.number,
//   //             isEnable: controller.selectedSlot.value != null,
//   //             validator: (value) {
//   //               final maxDuration = controller.maxSlot;
//   //               return Validation.formField(
//   //                 value: value,
//   //                 titleField: 'Lama durasi',
//   //                 isNotZero: true,
//   //                 isNumericOnly: true,
//   //                 maxLength: maxDuration,
//   //                 messageMinChar: 'Menit durasi tidak boleh kosong',
//   //                 messageMaxChar: 'Melewati maksimal $maxDuration menit durasi',
//   //               );
//   //             },
//   //           ),
//   //         ),
//   //       ),
//   //     ],
//   //   );
//   // }

//   // Widget builderVitalSign() {
//   //   return Align(
//   //     alignment: Alignment.topRight,
//   //     child: Obx(
//   //       () => Buttons.text(
//   //         onPressed: controller.isShowVitalSign.toggle,
//   //         child: const Text('Tambahkan Vital Sign'),
//   //         icon: Icon(
//   //           (controller.isShowVitalSign.value)
//   //               ? Icons.keyboard_arrow_up_rounded
//   //               : Icons.keyboard_arrow_down_rounded,
//   //         ),
//   //         iconAlignment: IconAlignment.end,
//   //       ),
//   //     ),
//   //   );
//   // }
// }
