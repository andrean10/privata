import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice_model.freezed.dart';
part 'practice_model.g.dart';

@freezed
class PracticeModel with _$PracticeModel {
  const factory PracticeModel({
    required int? totalItem,
    @JsonKey(name: 'total_page') required int? totalPage,
    @JsonKey(name: 'current_page') required int? currentPage,
    String? nama,
    String? rs,
    int? harga,
    // Alamat? alamat,
    // Posisi? posisi,
    String? telepon,
    String? pengenal,
    String? spesialis,
    String? dokterFkIds,
    String? rumahSakitId,
    // List<Senin>? senin,
    // List<Selasa>? selasa,
    // List<Rabu>? rabu,
    // List<Kamis>? kamis,
    // List<Jumat>? jumat,
    // List<Sabtu>? sabtu,
    // List<Minggu>? minggu,
    int? gender,
    @JsonKey(name: 'is_verified') bool? isVerified,
    @JsonKey(name: 'is_visible') bool? isVisible,
    int? rekomendasi,
    @JsonKey(name: 'gambar_latar') String? gambarLatar,
    String? kodeDokterBpjs,
    String? id,
    @JsonKey(name: 'slug_rs') String? slugRs,
    @JsonKey(name: 'level_doctor') bool? levelDoctor,
    @JsonKey(fromJson: noKTPFromJson) String? noKTP,
    // BpjsResponse? bpjsResponse,
    String? displayQueueName,
    String? updatedAt,
    String? updatedId,
    String? updatedName,
    String? dkonsulDoctorId,
    String? createdAt,
    // Dokters? dokters,
    // String? spesialisEn,
    // bool? isHideAntreanTV,
    String? prefixAntrean,
    // String? oldpractitionerIhsId,
    String? practitionerIhsId,
    // String? duration,
    // bool? is24hour,
  }) = _PracticeModel;

  factory PracticeModel.fromJson(Map<String, Object?> json) =>
      _$PracticeModelFromJson(json);
}

String? noKTPFromJson(dynamic json) {
  if (json is String) {
    return json;
  } else if (json is int) {
    return json.toString();
  }

  return null;
}
