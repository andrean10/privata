import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:privata/app/helpers/format_date_time.dart';
import 'package:privata/app/helpers/text_helper.dart';
import 'package:privata/app/helpers/validations.dart';
import 'package:privata/app/modules/widgets/textformfield/custom_dropdown_type_form_field.dart';
import 'package:privata/app/modules/widgets/textformfield/custom_textform_field.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../../../shared/shared_enum.dart';
import '../../../../../../utils/constants_strings.dart';
import '../../../../../data/db/range/range_model.dart';
import '../../../../../data/models/rj/item_rj/patient/rj_patient_model.dart';
import '../../../../../helpers/helper.dart';
import '../../../../widgets/buttons/buttons.dart';
import '../../../../widgets/card/cards.dart';
import '../../../../widgets/search/search_bars.dart';
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
              child: const Text(ConstantsStrings.save),
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
      // hintText: 'Isi Nama Pasien',
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
        // case MethodPayment.bpjsKesehatan:
        //   title = 'BPJS Kesehatan';
        //   isVisible = true;
        //   isVisibleSearch = false;
        //   maxLength = 11;
        //   break;
        // case MethodPayment.bpjsKetenagakerjaan:
        //   title = 'BPJS Ketenagakerjaan';
        //   isVisible = true;
        //   isVisibleSearch = false;
        //   maxLength = 11;
        //   break;
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
                child: SearchBars.popup(
                  controller: controller.namaPembayaranC,
                  context: Get.context!,
                  hintText: 'Cari $title',
                  suggestions: controller.dataSelectedFilterMetodePembayaran
                      .map(
                        (e) => SearchFieldListItem(
                          e.nama ?? '',
                          item: e,
                          child: Text(e.nama ?? '-'),
                        ),
                      )
                      .toList(),
                  onSuggestionTap: (item) {},
                  state: controller.namaPembayaran.value != null &&
                      controller.namaPembayaran.value!.isNotEmpty,
                  onSearchTextChanged: (filter) {
                    controller.onSearchMetodePembayaran(filter);
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 18),
              child: CustomTextFormField(
                controller: controller.nomorPembayaranC,
                // focusNode: controller.nomorPembayaranF,
                isRequired: true,
                title: 'Nomor $title',
                // hintText: 'Isi $title',
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
        // focusNode: controller.nomorHPF,
        title: 'Nomor HP',
        // hintText: 'Isi Nomor HP',
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
          // focusNode: controller.emailF,
          title: 'Alamat Email',
          // hintText: 'Isi alamat email',
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
      // hintText: 'Pilih Tanggal',
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
        // hintText: '--:--',
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
        // focusNode: controller.lamaDurasiF,
        title: 'Lama Durasi',
        // hintText: 'Isi Lama Durasi',
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
        // focusNode: controller.keluhanF,
        title: 'Keluhan',
        // hintText: 'Isi Keluhan',
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
        // focusNode: controller.prosedurF,
        title: 'Prosedur',
        // hintText: 'Isi Prosedur',
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
              // firstFocusNode: controller.lajuPernapasanF,
              // secondFocusNode: controller.denyutNadiF,
              // nextFocus: controller.tinggiBadanF,
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
              // firstFocusNode: controller.tinggiBadanF,
              // secondFocusNode: controller.beratBadanF,
              // nextFocus: controller.gulaDarahF,
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
              // firstFocusNode: controller.gulaDarahF,
              // secondFocusNode: controller.suhuTubuhF,
              // nextFocus: controller.lingkarPerutF,
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
              // firstFocusNode: controller.lingkarPerutF,
              // secondFocusNode: controller.saturasiOksigenF,
              // nextFocus: controller.darahSistolikF,
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
              // firstFocusNode: controller.darahSistolikF,
              // secondFocusNode: controller.darahDiastolikF,
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
    // required FocusNode firstFocusNode,
    // required FocusNode secondFocusNode,
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
            // focusNode: firstFocusNode,
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
            // focusNode: secondFocusNode,
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
}
