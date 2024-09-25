import 'package:freezed_annotation/freezed_annotation.dart';

import '../links/links_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? email,
    bool? emailVerified,
    bool? notifSubscribe,
    String? hp,
    String? nama,
    String? platform,
    String? id,
    // dynamic data,
    @JsonKey(name: 'is_partner') bool? isPartner,
    bool? isNeedChangePassword,
    @JsonKey(name: 'last_login') String? lastLogin,
    bool? isPhoneVerified,
    String? lastChangePassword,
    @JsonKey(name: 'created_date') String? createdDate,
    String? occupation,
    String? employeeNo,
    String? uniqueCode,
    @JsonKey(name: 'Links') List<LinksModel>? links,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
