import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_doctor_model.freezed.dart';
part 'item_doctor_model.g.dart';

@freezed
class ItemDoctorModel with _$ItemDoctorModel {
  // String? kodeDokterBpjs;
  // String? gelar;
  // String? telepon;
  // String? email;
  // String? pekerjaan;
  // String? spesialis;
  // String? subSpesialis;
  // String? gambarProfil;
  // int? totalPraktek;
  // bool? isVerified;
  // bool? isShareable;
  // String? slug;
  // List<Registrasi>? registrasi;
  // List<RegistrasiSIP>? registrasiSIP;
  // String? id;

  const factory ItemDoctorModel({
    String? gelar,
    @JsonKey(name: 'gambar_profil') String? gambarProfil,
    String? id,
  }) = _ItemDoctorModel;

  factory ItemDoctorModel.fromJson(Map<String, Object?> json) =>
      _$ItemDoctorModelFromJson(json);
}
