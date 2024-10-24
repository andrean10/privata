import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_model.freezed.dart';
part 'family_model.g.dart';

@freezed
class FamilyModel with _$FamilyModel {
  const factory FamilyModel({
    String? name,
    String? relation,
    int? gender,
    String? phoneNumber,
    String? bloodType,
    String? occupation,
    String? address,
    @JsonKey(name: 'created_at') String? createdAt,
    String? updatedAt,
    @JsonKey(name: 'created_id') String? createdId,
    String? updatedId,
    int? id,
    String? email,
    String? dateOfBirth,
    // FullAddress? fullAddress,
  }) = _FamilyModel;

  factory FamilyModel.fromJson(Map<String, Object?> json) =>
      _$FamilyModelFromJson(json);
}

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