import 'package:freezed_annotation/freezed_annotation.dart';

import '../rj/item_rj/patient/ph/ph_model.dart';
import 'address/address_model.dart';

part 'patient_model.freezed.dart';
part 'patient_model.g.dart';

@freezed
class PatientModel with _$PatientModel {
  const factory PatientModel({
    String? nama,
    String? tanggalLahir,
    List<PHModel>? ph,
    AddressModel? address,
    String? phone,
    String? id,
  }) = _PatientModel;

  factory PatientModel.fromJson(Map<String, Object?> json) =>
      _$PatientModelFromJson(json);
}
