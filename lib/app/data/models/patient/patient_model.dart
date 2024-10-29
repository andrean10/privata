import 'package:freezed_annotation/freezed_annotation.dart';

import '../rj/item_rj/patient/ph/ph_model.dart';
import 'address/address_model.dart';

part 'patient_model.freezed.dart';
part 'patient_model.g.dart';

@freezed
class PatientModel with _$PatientModel {
  const factory PatientModel({
    String? nama,
    int? gender,
    String? tanggalLahir,
    List<PHModel>? ph,
    @JsonKey(fromJson: addressFromJson) AddressModel? address,
    String? phone,
    String? id,

  }) = _PatientModel;

  factory PatientModel.fromJson(Map<String, Object?> json) =>
      _$PatientModelFromJson(json);
}

AddressModel? addressFromJson(dynamic json) {
  if (json is Map<String, dynamic>) {
    return AddressModel.fromJson(json);
  } else if (json is String) {
    return const AddressModel(
      jalan: '',
      city: '',
      district: '',
      postcode: '',
      region: '',
      post: 0,
    );
  }

  return null;
}
