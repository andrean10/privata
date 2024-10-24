import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_server.freezed.dart';
part 'patient_server.g.dart';

@freezed
class PatientServer with _$PatientServer {
  const factory PatientServer({
    required String? nama,
    required int? gender,
    required String? tanggalLahir,
    required List<Map<String, dynamic>>? ph,
    required String? religion,
    @JsonKey(name: 'birth_place') required String? birthPlace,
    @JsonKey(name: 'address_domicile') required String? addressDomicile,
    required Map<String, dynamic>? address,
    required String? status,
    required String? job,
    @JsonKey(name: 'blood_type') required String? bloodType,
    required String? phone,
    required String? email,
    required String? education,
    required bool? isShareMr,
    required String? noKTP,
    required List<Map<String, dynamic>>? paymentMethod,
    required List<Map<String, dynamic>>? family,
    @JsonKey(name: 'created_at') required String? createdAt,
    required String? hp,
    required bool? isGenerateMrCode,
    String? profilePicture,
  }) = _PatientServer;

  factory PatientServer.fromJson(Map<String, Object?> json) =>
      _$PatientServerFromJson(json);
}
