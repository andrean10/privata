import 'package:freezed_annotation/freezed_annotation.dart';

import 'item_rj/item_rj_model.dart';

part 'rj_model.freezed.dart';
part 'rj_model.g.dart';

@freezed
class RJModel with _$RJModel {
  const factory RJModel({
    required List<ItemRJModel> items,
    @JsonKey(name: 'total_item') required int? totalItem,
    @JsonKey(name: 'total_page') required int? totalPage,
    @JsonKey(name: 'current_page') required int? currentPage,
  }) = _RJModel;

  factory RJModel.fromJson(Map<String, Object?> json) =>
      _$RJModelFromJson(json);
}

// class Address {
//   String? jalan;
//   String? region;
//   String? city;
//   String? district;
//   String? postcode;
//   Null? id;
//   String? subdistrict;
//   int? post;

//   Address(
//       {this.jalan,
//       this.region,
//       this.city,
//       this.district,
//       this.postcode,
//       this.id,
//       this.subdistrict,
//       this.post});

//   Address.fromJson(Map<String, dynamic> json) {
//     jalan = json['jalan'];
//     region = json['region'];
//     city = json['city'];
//     district = json['district'];
//     postcode = json['postcode'];
//     id = json['id'];
//     subdistrict = json['subdistrict'];
//     post = json['post'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['jalan'] = this.jalan;
//     data['region'] = this.region;
//     data['city'] = this.city;
//     data['district'] = this.district;
//     data['postcode'] = this.postcode;
//     data['id'] = this.id;
//     data['subdistrict'] = this.subdistrict;
//     data['post'] = this.post;
//     return data;
//   }
// }

// class PaymentMethod {
//   String? name;
//   String? type;
//   String? no;
//   Null? createdAt;
//   Null? updatedAt;
//   Null? createdId;
//   Null? updatedId;
//   int? id;
//   String? createdAt;
//   String? createdId;

//   PaymentMethod(
//       {this.name,
//       this.type,
//       this.no,
//       this.createdAt,
//       this.updatedAt,
//       this.createdId,
//       this.updatedId,
//       this.id,
//       this.createdAt,
//       this.createdId});

//   PaymentMethod.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     type = json['type'];
//     no = json['no'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     createdId = json['createdId'];
//     updatedId = json['updatedId'];
//     id = json['id'];
//     createdAt = json['created_at'];
//     createdId = json['created_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['type'] = this.type;
//     data['no'] = this.no;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['createdId'] = this.createdId;
//     data['updatedId'] = this.updatedId;
//     data['id'] = this.id;
//     data['created_at'] = this.createdAt;
//     data['created_id'] = this.createdId;
//     return data;
//   }
// }

// class Family {
//   String? name;
//   String? relation;
//   int? gender;
//   String? phoneNumber;
//   String? bloodType;
//   String? occupation;
//   String? address;
//   Null? createdAt;
//   Null? updatedAt;
//   Null? createdId;
//   Null? updatedId;
//   int? id;
//   String? email;
//   String? dateOfBirth;
//   FullAddress? fullAddress;
//   String? createdAt;
//   String? createdId;

//   Family(
//       {this.name,
//       this.relation,
//       this.gender,
//       this.phoneNumber,
//       this.bloodType,
//       this.occupation,
//       this.address,
//       this.createdAt,
//       this.updatedAt,
//       this.createdId,
//       this.updatedId,
//       this.id,
//       this.email,
//       this.dateOfBirth,
//       this.fullAddress,
//       this.createdAt,
//       this.createdId});

//   Family.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     relation = json['relation'];
//     gender = json['gender'];
//     phoneNumber = json['phoneNumber'];
//     bloodType = json['bloodType'];
//     occupation = json['occupation'];
//     address = json['address'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     createdId = json['createdId'];
//     updatedId = json['updatedId'];
//     id = json['id'];
//     email = json['email'];
//     dateOfBirth = json['dateOfBirth'];
//     fullAddress = json['full_address'] != null
//         ? new FullAddress.fromJson(json['full_address'])
//         : null;
//     createdAt = json['created_at'];
//     createdId = json['created_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['relation'] = this.relation;
//     data['gender'] = this.gender;
//     data['phoneNumber'] = this.phoneNumber;
//     data['bloodType'] = this.bloodType;
//     data['occupation'] = this.occupation;
//     data['address'] = this.address;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['createdId'] = this.createdId;
//     data['updatedId'] = this.updatedId;
//     data['id'] = this.id;
//     data['email'] = this.email;
//     data['dateOfBirth'] = this.dateOfBirth;
//     if (this.fullAddress != null) {
//       data['full_address'] = this.fullAddress!.toJson();
//     }
//     data['created_at'] = this.createdAt;
//     data['created_id'] = this.createdId;
//     return data;
//   }
// }

// class FullAddress {
//   String? jalan;
//   String? region;
//   String? city;
//   String? district;
//   String? subdistrict;
//   String? postcode;
//   int? post;

//   FullAddress(
//       {this.jalan,
//       this.region,
//       this.city,
//       this.district,
//       this.subdistrict,
//       this.postcode,
//       this.post});

//   FullAddress.fromJson(Map<String, dynamic> json) {
//     jalan = json['jalan'];
//     region = json['region'];
//     city = json['city'];
//     district = json['district'];
//     subdistrict = json['subdistrict'];
//     postcode = json['postcode'];
//     post = json['post'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['jalan'] = this.jalan;
//     data['region'] = this.region;
//     data['city'] = this.city;
//     data['district'] = this.district;
//     data['subdistrict'] = this.subdistrict;
//     data['postcode'] = this.postcode;
//     data['post'] = this.post;
//     return data;
//   }
// }

// class BpjsInfo {
//   String? noKartu;
//   String? nama;
//   String? hubunganKeluarga;
//   String? sex;
//   String? tglLahir;
//   String? tglMulaiAktif;
//   String? tglAkhirBerlaku;
//   KdProviderPst? kdProviderPst;
//   KdProviderGigi? kdProviderGigi;
//   JnsKelas? jnsKelas;
//   JnsKelas? jnsPeserta;
//   String? golDarah;
//   String? noHP;
//   String? noKTP;
//   Null? pstProl;
//   Null? pstPrb;
//   bool? aktif;
//   String? ketAktif;
//   Asuransi? asuransi;
//   int? tunggakan;

//   BpjsInfo(
//       {this.noKartu,
//       this.nama,
//       this.hubunganKeluarga,
//       this.sex,
//       this.tglLahir,
//       this.tglMulaiAktif,
//       this.tglAkhirBerlaku,
//       this.kdProviderPst,
//       this.kdProviderGigi,
//       this.jnsKelas,
//       this.jnsPeserta,
//       this.golDarah,
//       this.noHP,
//       this.noKTP,
//       this.pstProl,
//       this.pstPrb,
//       this.aktif,
//       this.ketAktif,
//       this.asuransi,
//       this.tunggakan});

//   BpjsInfo.fromJson(Map<String, dynamic> json) {
//     noKartu = json['noKartu'];
//     nama = json['nama'];
//     hubunganKeluarga = json['hubunganKeluarga'];
//     sex = json['sex'];
//     tglLahir = json['tglLahir'];
//     tglMulaiAktif = json['tglMulaiAktif'];
//     tglAkhirBerlaku = json['tglAkhirBerlaku'];
//     kdProviderPst = json['kdProviderPst'] != null
//         ? new KdProviderPst.fromJson(json['kdProviderPst'])
//         : null;
//     kdProviderGigi = json['kdProviderGigi'] != null
//         ? new KdProviderGigi.fromJson(json['kdProviderGigi'])
//         : null;
//     jnsKelas = json['jnsKelas'] != null
//         ? new JnsKelas.fromJson(json['jnsKelas'])
//         : null;
//     jnsPeserta = json['jnsPeserta'] != null
//         ? new JnsKelas.fromJson(json['jnsPeserta'])
//         : null;
//     golDarah = json['golDarah'];
//     noHP = json['noHP'];
//     noKTP = json['noKTP'];
//     pstProl = json['pstProl'];
//     pstPrb = json['pstPrb'];
//     aktif = json['aktif'];
//     ketAktif = json['ketAktif'];
//     asuransi = json['asuransi'] != null
//         ? new Asuransi.fromJson(json['asuransi'])
//         : null;
//     tunggakan = json['tunggakan'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['noKartu'] = this.noKartu;
//     data['nama'] = this.nama;
//     data['hubunganKeluarga'] = this.hubunganKeluarga;
//     data['sex'] = this.sex;
//     data['tglLahir'] = this.tglLahir;
//     data['tglMulaiAktif'] = this.tglMulaiAktif;
//     data['tglAkhirBerlaku'] = this.tglAkhirBerlaku;
//     if (this.kdProviderPst != null) {
//       data['kdProviderPst'] = this.kdProviderPst!.toJson();
//     }
//     if (this.kdProviderGigi != null) {
//       data['kdProviderGigi'] = this.kdProviderGigi!.toJson();
//     }
//     if (this.jnsKelas != null) {
//       data['jnsKelas'] = this.jnsKelas!.toJson();
//     }
//     if (this.jnsPeserta != null) {
//       data['jnsPeserta'] = this.jnsPeserta!.toJson();
//     }
//     data['golDarah'] = this.golDarah;
//     data['noHP'] = this.noHP;
//     data['noKTP'] = this.noKTP;
//     data['pstProl'] = this.pstProl;
//     data['pstPrb'] = this.pstPrb;
//     data['aktif'] = this.aktif;
//     data['ketAktif'] = this.ketAktif;
//     if (this.asuransi != null) {
//       data['asuransi'] = this.asuransi!.toJson();
//     }
//     data['tunggakan'] = this.tunggakan;
//     return data;
//   }
// }

// class KdProviderPst {
//   String? kdProvider;
//   String? nmProvider;

//   KdProviderPst({this.kdProvider, this.nmProvider});

//   KdProviderPst.fromJson(Map<String, dynamic> json) {
//     kdProvider = json['kdProvider'];
//     nmProvider = json['nmProvider'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['kdProvider'] = this.kdProvider;
//     data['nmProvider'] = this.nmProvider;
//     return data;
//   }
// }

// class KdProviderGigi {
//   Null? kdProvider;
//   Null? nmProvider;

//   KdProviderGigi({this.kdProvider, this.nmProvider});

//   KdProviderGigi.fromJson(Map<String, dynamic> json) {
//     kdProvider = json['kdProvider'];
//     nmProvider = json['nmProvider'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['kdProvider'] = this.kdProvider;
//     data['nmProvider'] = this.nmProvider;
//     return data;
//   }
// }

// class JnsKelas {
//   String? nama;
//   String? kode;

//   JnsKelas({this.nama, this.kode});

//   JnsKelas.fromJson(Map<String, dynamic> json) {
//     nama = json['nama'];
//     kode = json['kode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['nama'] = this.nama;
//     data['kode'] = this.kode;
//     return data;
//   }
// }

// class Asuransi {
//   Null? kdAsuransi;
//   Null? nmAsuransi;
//   Null? noAsuransi;
//   bool? cob;

//   Asuransi({this.kdAsuransi, this.nmAsuransi, this.noAsuransi, this.cob});

//   Asuransi.fromJson(Map<String, dynamic> json) {
//     kdAsuransi = json['kdAsuransi'];
//     nmAsuransi = json['nmAsuransi'];
//     noAsuransi = json['noAsuransi'];
//     cob = json['cob'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['kdAsuransi'] = this.kdAsuransi;
//     data['nmAsuransi'] = this.nmAsuransi;
//     data['noAsuransi'] = this.noAsuransi;
//     data['cob'] = this.cob;
//     return data;
//   }
// }

// class CompanyInfo {
//   String? companyName;
//   String? nip;
//   String? employeeStatus;
//   String? employeePosition;

//   CompanyInfo(
//       {this.companyName, this.nip, this.employeeStatus, this.employeePosition});

//   CompanyInfo.fromJson(Map<String, dynamic> json) {
//     companyName = json['companyName'];
//     nip = json['nip'];
//     employeeStatus = json['employeeStatus'];
//     employeePosition = json['employeePosition'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['companyName'] = this.companyName;
//     data['nip'] = this.nip;
//     data['employeeStatus'] = this.employeeStatus;
//     data['employeePosition'] = this.employeePosition;
//     return data;
//   }
// }

// class AllergicHistory {
//   String? code;
//   String? display;
//   String? system;
//   String? id;
//   String? status;
//   String? category;
//   String? criticality;

//   AllergicHistory(
//       {this.code,
//       this.display,
//       this.system,
//       this.id,
//       this.status,
//       this.category,
//       this.criticality});

//   AllergicHistory.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     display = json['display'];
//     system = json['system'];
//     id = json['id'];
//     status = json['status'];
//     category = json['category'];
//     criticality = json['criticality'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['display'] = this.display;
//     data['system'] = this.system;
//     data['id'] = this.id;
//     data['status'] = this.status;
//     data['category'] = this.category;
//     data['criticality'] = this.criticality;
//     return data;
//   }
// }

// class MedicalHistoryFamily {
//   String? name;
//   String? createdAt;

//   MedicalHistoryFamily({this.name, this.createdAt});

//   MedicalHistoryFamily.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     createdAt = json['createdAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['createdAt'] = this.createdAt;
//     return data;
//   }
// }

// class AllergyIntolerance {
//   String? resourceID;
//   String? location;
//   String? resourceType;
//   String? encounterId;

//   AllergyIntolerance(
//       {this.resourceID, this.location, this.resourceType, this.encounterId});

//   AllergyIntolerance.fromJson(Map<String, dynamic> json) {
//     resourceID = json['resourceID'];
//     location = json['location'];
//     resourceType = json['resourceType'];
//     encounterId = json['encounterId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['resourceID'] = this.resourceID;
//     data['location'] = this.location;
//     data['resourceType'] = this.resourceType;
//     data['encounterId'] = this.encounterId;
//     return data;
//   }
// }

// class Prakteks {
//   String? nama;
//   String? rs;
//   int? harga;
//   Alamat? alamat;
//   Posisi? posisi;
//   String? telepon;
//   String? pengenal;
//   String? spesialis;
//   String? dokterFkIds;
//   String? rumahSakitId;
//   List<Senin>? senin;
//   List<Selasa>? selasa;
//   List<Rabu>? rabu;
//   List<Kamis>? kamis;
//   List<Jumat>? jumat;
//   List<Sabtu>? sabtu;
//   List<Minggu>? minggu;
//   int? gender;
//   bool? isVerified;
//   bool? isVisible;
//   int? rekomendasi;
//   String? gambarLatar;
//   String? kodeDokterBpjs;
//   String? id;
//   String? slugRs;
//   bool? levelDoctor;
//   String? noKTP;
//   BpjsResponse? bpjsResponse;
//   String? displayQueueName;
//   String? updatedAt;
//   String? updatedId;
//   String? updatedName;
//   String? dkonsulDoctorId;
//   String? createdAt;
//   Dokters? dokters;
//   String? spesialisEn;
//   bool? isHideAntreanTV;
//   String? prefixAntrean;
//   String? oldpractitionerIhsId;
//   String? practitionerIhsId;
//   String? duration;
//   bool? is24hour;

//   Prakteks(
//       {this.nama,
//       this.rs,
//       this.harga,
//       this.alamat,
//       this.posisi,
//       this.telepon,
//       this.pengenal,
//       this.spesialis,
//       this.dokterFkIds,
//       this.rumahSakitId,
//       this.senin,
//       this.selasa,
//       this.rabu,
//       this.kamis,
//       this.jumat,
//       this.sabtu,
//       this.minggu,
//       this.gender,
//       this.isVerified,
//       this.isVisible,
//       this.rekomendasi,
//       this.gambarLatar,
//       this.kodeDokterBpjs,
//       this.id,
//       this.slugRs,
//       this.levelDoctor,
//       this.noKTP,
//       this.bpjsResponse,
//       this.displayQueueName,
//       this.updatedAt,
//       this.updatedId,
//       this.updatedName,
//       this.dkonsulDoctorId,
//       this.createdAt,
//       this.dokters,
//       this.spesialisEn,
//       this.isHideAntreanTV,
//       this.prefixAntrean,
//       this.oldpractitionerIhsId,
//       this.practitionerIhsId,
//       this.duration,
//       this.is24hour});

//   Prakteks.fromJson(Map<String, dynamic> json) {
//     nama = json['nama'];
//     rs = json['rs'];
//     harga = json['harga'];
//     alamat =
//         json['alamat'] != null ? new Alamat.fromJson(json['alamat']) : null;
//     posisi =
//         json['posisi'] != null ? new Posisi.fromJson(json['posisi']) : null;
//     telepon = json['telepon'];
//     pengenal = json['pengenal'];
//     spesialis = json['spesialis'];
//     dokterFkIds = json['dokterFkIds'];
//     rumahSakitId = json['rumahSakitId'];
//     if (json['senin'] != null) {
//       senin = <Senin>[];
//       json['senin'].forEach((v) {
//         senin!.add(new Senin.fromJson(v));
//       });
//     }
//     if (json['selasa'] != null) {
//       selasa = <Selasa>[];
//       json['selasa'].forEach((v) {
//         selasa!.add(new Selasa.fromJson(v));
//       });
//     }
//     if (json['rabu'] != null) {
//       rabu = <Rabu>[];
//       json['rabu'].forEach((v) {
//         rabu!.add(new Rabu.fromJson(v));
//       });
//     }
//     if (json['kamis'] != null) {
//       kamis = <Kamis>[];
//       json['kamis'].forEach((v) {
//         kamis!.add(new Kamis.fromJson(v));
//       });
//     }
//     if (json['jumat'] != null) {
//       jumat = <Jumat>[];
//       json['jumat'].forEach((v) {
//         jumat!.add(new Jumat.fromJson(v));
//       });
//     }
//     if (json['sabtu'] != null) {
//       sabtu = <Sabtu>[];
//       json['sabtu'].forEach((v) {
//         sabtu!.add(new Sabtu.fromJson(v));
//       });
//     }
//     if (json['minggu'] != null) {
//       minggu = <Minggu>[];
//       json['minggu'].forEach((v) {
//         minggu!.add(new Minggu.fromJson(v));
//       });
//     }
//     gender = json['gender'];
//     isVerified = json['is_verified'];
//     isVisible = json['is_visible'];
//     rekomendasi = json['rekomendasi'];
//     gambarLatar = json['gambar_latar'];
//     kodeDokterBpjs = json['kodeDokterBpjs'];
//     id = json['id'];
//     slugRs = json['slug_rs'];
//     levelDoctor = json['level_doctor'];
//     noKTP = json['noKTP'];
//     bpjsResponse = json['bpjsResponse'] != null
//         ? new BpjsResponse.fromJson(json['bpjsResponse'])
//         : null;
//     displayQueueName = json['displayQueueName'];
//     updatedAt = json['updatedAt'];
//     updatedId = json['updatedId'];
//     updatedName = json['updatedName'];
//     dkonsulDoctorId = json['dkonsulDoctorId'];
//     createdAt = json['createdAt'];
//     dokters =
//         json['Dokters'] != null ? new Dokters.fromJson(json['Dokters']) : null;
//     spesialisEn = json['spesialis_en'];
//     isHideAntreanTV = json['isHideAntreanTV'];
//     prefixAntrean = json['prefixAntrean'];
//     oldpractitionerIhsId = json['oldpractitionerIhsId'];
//     practitionerIhsId = json['practitionerIhsId'];
//     duration = json['duration'];
//     is24hour = json['is24hour'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['nama'] = this.nama;
//     data['rs'] = this.rs;
//     data['harga'] = this.harga;
//     if (this.alamat != null) {
//       data['alamat'] = this.alamat!.toJson();
//     }
//     if (this.posisi != null) {
//       data['posisi'] = this.posisi!.toJson();
//     }
//     data['telepon'] = this.telepon;
//     data['pengenal'] = this.pengenal;
//     data['spesialis'] = this.spesialis;
//     data['dokterFkIds'] = this.dokterFkIds;
//     data['rumahSakitId'] = this.rumahSakitId;
//     if (this.senin != null) {
//       data['senin'] = this.senin!.map((v) => v.toJson()).toList();
//     }
//     if (this.selasa != null) {
//       data['selasa'] = this.selasa!.map((v) => v.toJson()).toList();
//     }
//     if (this.rabu != null) {
//       data['rabu'] = this.rabu!.map((v) => v.toJson()).toList();
//     }
//     if (this.kamis != null) {
//       data['kamis'] = this.kamis!.map((v) => v.toJson()).toList();
//     }
//     if (this.jumat != null) {
//       data['jumat'] = this.jumat!.map((v) => v.toJson()).toList();
//     }
//     if (this.sabtu != null) {
//       data['sabtu'] = this.sabtu!.map((v) => v.toJson()).toList();
//     }
//     if (this.minggu != null) {
//       data['minggu'] = this.minggu!.map((v) => v.toJson()).toList();
//     }
//     data['gender'] = this.gender;
//     data['is_verified'] = this.isVerified;
//     data['is_visible'] = this.isVisible;
//     data['rekomendasi'] = this.rekomendasi;
//     data['gambar_latar'] = this.gambarLatar;
//     data['kodeDokterBpjs'] = this.kodeDokterBpjs;
//     data['id'] = this.id;
//     data['slug_rs'] = this.slugRs;
//     data['level_doctor'] = this.levelDoctor;
//     data['noKTP'] = this.noKTP;
//     if (this.bpjsResponse != null) {
//       data['bpjsResponse'] = this.bpjsResponse!.toJson();
//     }
//     data['displayQueueName'] = this.displayQueueName;
//     data['updatedAt'] = this.updatedAt;
//     data['updatedId'] = this.updatedId;
//     data['updatedName'] = this.updatedName;
//     data['dkonsulDoctorId'] = this.dkonsulDoctorId;
//     data['createdAt'] = this.createdAt;
//     if (this.dokters != null) {
//       data['Dokters'] = this.dokters!.toJson();
//     }
//     data['spesialis_en'] = this.spesialisEn;
//     data['isHideAntreanTV'] = this.isHideAntreanTV;
//     data['prefixAntrean'] = this.prefixAntrean;
//     data['oldpractitionerIhsId'] = this.oldpractitionerIhsId;
//     data['practitionerIhsId'] = this.practitionerIhsId;
//     data['duration'] = this.duration;
//     data['is24hour'] = this.is24hour;
//     return data;
//   }
// }

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
//   String? menit;
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

// class Dokters {
//   String? nama;
//   String? gelar;
//   String? pekerjaan;
//   String? slug;
//   String? id;

//   Dokters({this.nama, this.gelar, this.pekerjaan, this.slug, this.id});

//   Dokters.fromJson(Map<String, dynamic> json) {
//     nama = json['nama'];
//     gelar = json['gelar'];
//     pekerjaan = json['pekerjaan'];
//     slug = json['slug'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['nama'] = this.nama;
//     data['gelar'] = this.gelar;
//     data['pekerjaan'] = this.pekerjaan;
//     data['slug'] = this.slug;
//     data['id'] = this.id;
//     return data;
//   }
// }

// class Procedures {
//   String? procedureName;
//   String? procedureId;
//   int? basicFee;
//   int? quantity;
//   Icd9Cm? icd9Cm;
//   bool? isDb;
//   int? discountFee;
//   int? totalFee;
//   String? notes;
//   String? mrNo;
//   String? mrId;
//   String? patientId;
//   List<Null>? medicalHelperIds;
//   String? hospitalId;
//   String? practiceId;
//   String? appointId;
//   bool? isPriceLock;
//   String? createdName;
//   String? createdId;
//   String? createdAt;
//   String? discountType;
//   String? id;
//   List<Null>? itemsUsed;

//   Procedures(
//       {this.procedureName,
//       this.procedureId,
//       this.basicFee,
//       this.quantity,
//       this.icd9Cm,
//       this.isDb,
//       this.discountFee,
//       this.totalFee,
//       this.notes,
//       this.mrNo,
//       this.mrId,
//       this.patientId,
//       this.medicalHelperIds,
//       this.hospitalId,
//       this.practiceId,
//       this.appointId,
//       this.isPriceLock,
//       this.createdName,
//       this.createdId,
//       this.createdAt,
//       this.discountType,
//       this.id,
//       this.itemsUsed});

//   Procedures.fromJson(Map<String, dynamic> json) {
//     procedureName = json['procedureName'];
//     procedureId = json['procedureId'];
//     basicFee = json['basicFee'];
//     quantity = json['quantity'];
//     icd9Cm =
//         json['icd9Cm'] != null ? new Icd9Cm.fromJson(json['icd9Cm']) : null;
//     isDb = json['isDb'];
//     discountFee = json['discountFee'];
//     totalFee = json['totalFee'];
//     notes = json['notes'];
//     mrNo = json['mrNo'];
//     mrId = json['mrId'];
//     patientId = json['patientId'];
//     if (json['medicalHelperIds'] != null) {
//       medicalHelperIds = <Null>[];
//       json['medicalHelperIds'].forEach((v) {
//         medicalHelperIds!.add(new Null.fromJson(v));
//       });
//     }
//     hospitalId = json['hospitalId'];
//     practiceId = json['practiceId'];
//     appointId = json['appointId'];
//     isPriceLock = json['isPriceLock'];
//     createdName = json['createdName'];
//     createdId = json['createdId'];
//     createdAt = json['createdAt'];
//     discountType = json['discountType'];
//     id = json['id'];
//     if (json['itemsUsed'] != null) {
//       itemsUsed = <Null>[];
//       json['itemsUsed'].forEach((v) {
//         itemsUsed!.add(new Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['procedureName'] = this.procedureName;
//     data['procedureId'] = this.procedureId;
//     data['basicFee'] = this.basicFee;
//     data['quantity'] = this.quantity;
//     if (this.icd9Cm != null) {
//       data['icd9Cm'] = this.icd9Cm!.toJson();
//     }
//     data['isDb'] = this.isDb;
//     data['discountFee'] = this.discountFee;
//     data['totalFee'] = this.totalFee;
//     data['notes'] = this.notes;
//     data['mrNo'] = this.mrNo;
//     data['mrId'] = this.mrId;
//     data['patientId'] = this.patientId;
//     if (this.medicalHelperIds != null) {
//       data['medicalHelperIds'] =
//           this.medicalHelperIds!.map((v) => v.toJson()).toList();
//     }
//     data['hospitalId'] = this.hospitalId;
//     data['practiceId'] = this.practiceId;
//     data['appointId'] = this.appointId;
//     data['isPriceLock'] = this.isPriceLock;
//     data['createdName'] = this.createdName;
//     data['createdId'] = this.createdId;
//     data['createdAt'] = this.createdAt;
//     data['discountType'] = this.discountType;
//     data['id'] = this.id;
//     if (this.itemsUsed != null) {
//       data['itemsUsed'] = this.itemsUsed!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Icd9Cm {
//   String? code;
//   String? description;

//   Icd9Cm({this.code, this.description});

//   Icd9Cm.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['description'] = this.description;
//     return data;
//   }
// }

// class Diagnoses {
//   List<Name>? name;
//   String? mrNo;
//   String? mrId;
//   String? patientId;
//   String? hospitalId;
//   String? practiceId;
//   String? appointId;
//   String? createdName;
//   String? createdId;
//   String? createdAt;
//   String? id;
//   String? updatedAt;

//   Diagnoses(
//       {this.name,
//       this.mrNo,
//       this.mrId,
//       this.patientId,
//       this.hospitalId,
//       this.practiceId,
//       this.appointId,
//       this.createdName,
//       this.createdId,
//       this.createdAt,
//       this.id,
//       this.updatedAt});

//   Diagnoses.fromJson(Map<String, dynamic> json) {
//     if (json['name'] != null) {
//       name = <Name>[];
//       json['name'].forEach((v) {
//         name!.add(new Name.fromJson(v));
//       });
//     }
//     mrNo = json['mrNo'];
//     mrId = json['mrId'];
//     patientId = json['patientId'];
//     hospitalId = json['hospitalId'];
//     practiceId = json['practiceId'];
//     appointId = json['appointId'];
//     createdName = json['createdName'];
//     createdId = json['createdId'];
//     createdAt = json['createdAt'];
//     id = json['id'];
//     updatedAt = json['updatedAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.name != null) {
//       data['name'] = this.name!.map((v) => v.toJson()).toList();
//     }
//     data['mrNo'] = this.mrNo;
//     data['mrId'] = this.mrId;
//     data['patientId'] = this.patientId;
//     data['hospitalId'] = this.hospitalId;
//     data['practiceId'] = this.practiceId;
//     data['appointId'] = this.appointId;
//     data['createdName'] = this.createdName;
//     data['createdId'] = this.createdId;
//     data['createdAt'] = this.createdAt;
//     data['id'] = this.id;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }

// class Name {
//   String? keyword;
//   bool? isICD10;
//   String? id;

//   Name({this.keyword, this.isICD10, this.id});

//   Name.fromJson(Map<String, dynamic> json) {
//     keyword = json['keyword'];
//     isICD10 = json['isICD10'];
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['keyword'] = this.keyword;
//     data['isICD10'] = this.isICD10;
//     data['id'] = this.id;
//     return data;
//   }
// }

// class VitalSigns {
//   int? height;
//   int? weight;
//   int? temperature;
//   int? heartPulse;
//   int? repiratoryRate;
//   int? sistole;
//   int? diastole;
//   int? bloodSugar;
//   int? oxygenSaturation;
//   int? lingkarPerut;
//   String? mrNo;
//   String? mrId;
//   String? patientId;
//   String? hospitalId;
//   String? practiceId;
//   String? appointId;
//   String? createdName;
//   String? createdId;
//   String? createdAt;
//   String? id;
//   bool? submitted;
//   int? compiled;

//   VitalSigns(
//       {this.height,
//       this.weight,
//       this.temperature,
//       this.heartPulse,
//       this.repiratoryRate,
//       this.sistole,
//       this.diastole,
//       this.bloodSugar,
//       this.oxygenSaturation,
//       this.lingkarPerut,
//       this.mrNo,
//       this.mrId,
//       this.patientId,
//       this.hospitalId,
//       this.practiceId,
//       this.appointId,
//       this.createdName,
//       this.createdId,
//       this.createdAt,
//       this.id,
//       this.submitted,
//       this.compiled});

//   VitalSigns.fromJson(Map<String, dynamic> json) {
//     height = json['height'];
//     weight = json['weight'];
//     temperature = json['temperature'];
//     heartPulse = json['heartPulse'];
//     repiratoryRate = json['repiratoryRate'];
//     sistole = json['sistole'];
//     diastole = json['diastole'];
//     bloodSugar = json['bloodSugar'];
//     oxygenSaturation = json['oxygenSaturation'];
//     lingkarPerut = json['lingkarPerut'];
//     mrNo = json['mrNo'];
//     mrId = json['mrId'];
//     patientId = json['patientId'];
//     hospitalId = json['hospitalId'];
//     practiceId = json['practiceId'];
//     appointId = json['appointId'];
//     createdName = json['createdName'];
//     createdId = json['createdId'];
//     createdAt = json['createdAt'];
//     id = json['id'];
//     submitted = json['submitted'];
//     compiled = json['compiled'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['height'] = this.height;
//     data['weight'] = this.weight;
//     data['temperature'] = this.temperature;
//     data['heartPulse'] = this.heartPulse;
//     data['repiratoryRate'] = this.repiratoryRate;
//     data['sistole'] = this.sistole;
//     data['diastole'] = this.diastole;
//     data['bloodSugar'] = this.bloodSugar;
//     data['oxygenSaturation'] = this.oxygenSaturation;
//     data['lingkarPerut'] = this.lingkarPerut;
//     data['mrNo'] = this.mrNo;
//     data['mrId'] = this.mrId;
//     data['patientId'] = this.patientId;
//     data['hospitalId'] = this.hospitalId;
//     data['practiceId'] = this.practiceId;
//     data['appointId'] = this.appointId;
//     data['createdName'] = this.createdName;
//     data['createdId'] = this.createdId;
//     data['createdAt'] = this.createdAt;
//     data['id'] = this.id;
//     data['submitted'] = this.submitted;
//     data['compiled'] = this.compiled;
//     return data;
//   }
// }
