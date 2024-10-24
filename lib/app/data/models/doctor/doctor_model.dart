import 'package:freezed_annotation/freezed_annotation.dart';

import 'item_doctor/item_doctor_model.dart';

part 'doctor_model.freezed.dart';
part 'doctor_model.g.dart';

@freezed
class DoctorModel with _$DoctorModel {
  const factory DoctorModel({
    String? nama,
    String? rs,
    // this.alamat,
    // this.posisi,
    String? telepon,
    String? pengenal,
    String? spesialis,
    // this.spesialisEn,
    String? dokterFkIds,
    String? rumahSakitId,
    // this.senin,
    // this.selasa,
    // this.rabu,
    // this.kamis,
    // this.jumat,
    // this.sabtu,
    // this.minggu,
    // this.gender,
    @JsonKey(name: 'is_verified') bool? isVerified,
    @JsonKey(name: 'is_visible') bool? isVisible,
    // this.rekomendasi,
    // @JsonKey(name: 'gambar_latar') String? gambarLatar,
    // this.isHideAntreanTV,
    // String? kodeDokterBpjs,
    // String? prefixAntrean,
    String? id,
    String? slugRs,
    // @JsonKey(name: 'level_doctor') bool? levelDoctor,
    // this.bpjsResponse,
    // String? noKTP,
    // this.displayQueueName,
    // this.updatedAt,
    // this.updatedId,
    // this.updatedName,
    // this.dkonsulDoctorId,
    // this.oldpractitionerIhsId,
    // this.practitionerIhsId,
    // this.createdAt,
    @JsonKey(name: 'Dokters') ItemDoctorModel? dokters,
    // this.halangans,
  }) = _DoctorModel;

  factory DoctorModel.fromJson(Map<String, Object?> json) =>
      _$DoctorModelFromJson(json);
}

// class Alamat {
//   String? jalan;
//   String? region;
//   String? city;
//   String? district;
//   String? postcode;

//   Alamat({this.jalan, this.region, this.city, this.district, this.postcode});

//   Alamat.fromJson(Map<String, dynamic> json) {
//     jalan = json['jalan'];
//     region = json['region'];
//     city = json['city'];
//     district = json['district'];
//     postcode = json['postcode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['jalan'] = this.jalan;
//     data['region'] = this.region;
//     data['city'] = this.city;
//     data['district'] = this.district;
//     data['postcode'] = this.postcode;
//     return data;
//   }
// }

// class Posisi {
//   double? lat;
//   double? lng;

//   Posisi({this.lat, this.lng});

//   Posisi.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     lng = json['lng'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lat'] = this.lat;
//     data['lng'] = this.lng;
//     return data;
//   }
// }

// class Senin {
//   int? mulai;
//   int? selesai;
//   int? menit;
//   int? totalSlot;
//   int? sisaSlot;
//   String? id;
//   List<String>? tipe;

//   Senin(
//       {this.mulai,
//       this.selesai,
//       this.menit,
//       this.totalSlot,
//       this.sisaSlot,
//       this.id,
//       this.tipe});

//   Senin.fromJson(Map<String, dynamic> json) {
//     mulai = json['mulai'];
//     selesai = json['selesai'];
//     menit = json['menit'];
//     totalSlot = json['total_slot'];
//     sisaSlot = json['sisa_slot'];
//     id = json['id'];
//     tipe = json['tipe'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['mulai'] = this.mulai;
//     data['selesai'] = this.selesai;
//     data['menit'] = this.menit;
//     data['total_slot'] = this.totalSlot;
//     data['sisa_slot'] = this.sisaSlot;
//     data['id'] = this.id;
//     data['tipe'] = this.tipe;
//     return data;
//   }
// }

// class BpjsResponse {
//   Metadata? metadata;

//   BpjsResponse({this.metadata});

//   BpjsResponse.fromJson(Map<String, dynamic> json) {
//     metadata = json['metadata'] != null
//         ? new Metadata.fromJson(json['metadata'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.metadata != null) {
//       data['metadata'] = this.metadata!.toJson();
//     }
//     return data;
//   }
// }

// class Metadata {
//   String? message;
//   int? code;

//   Metadata({this.message, this.code});

//   Metadata.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     code = json['code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     data['code'] = this.code;
//     return data;
//   }
// }


// class Registrasi {
//   String? nomer;
//   String? lembaga;
//   Null? tanggal;
//   String? id;

//   Registrasi({this.nomer, this.lembaga, this.tanggal, this.id});

//   Registrasi.fromJson(Map<String, dynamic> json) {
//     nomer = json['nomer'];
//     lembaga = json['lembaga'];
//     tanggal = json['tanggal'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['nomer'] = this.nomer;
//     data['lembaga'] = this.lembaga;
//     data['tanggal'] = this.tanggal;
//     data['id'] = this.id;
//     return data;
//   }
// }

// class RegistrasiSIP {
//   String? nomer;
//   String? lembaga;
//   String? tanggal;
//   String? id;

//   RegistrasiSIP({this.nomer, this.lembaga, this.tanggal, this.id});

//   RegistrasiSIP.fromJson(Map<String, dynamic> json) {
//     nomer = json['nomer'];
//     lembaga = json['lembaga'];
//     tanggal = json['tanggal'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['nomer'] = this.nomer;
//     data['lembaga'] = this.lembaga;
//     data['tanggal'] = this.tanggal;
//     data['id'] = this.id;
//     return data;
//   }
// }

// class Halangans {
//   String? praktekFkId;
//   String? startDate;
//   String? endDate;
//   String? reason;
//   String? exchangeId;
//   bool? isExchange;
//   String? rsId;
//   String? id;

//   Halangans(
//       {this.praktekFkId,
//       this.startDate,
//       this.endDate,
//       this.reason,
//       this.exchangeId,
//       this.isExchange,
//       this.rsId,
//       this.id})
// }

