import 'package:freezed_annotation/freezed_annotation.dart';

import '../hospital/hospital_model.dart';
import '../role_actions/role_actions_model.dart';

part 'links_model.freezed.dart';
part 'links_model.g.dart';

@freezed
class LinksModel with _$LinksModel {
  const factory LinksModel({
    @JsonKey(includeToJson: false) String? accountId,
    @JsonKey(includeToJson: false) String? configId,
    @JsonKey(includeToJson: false) String? name,
    bool? active,
    String? type,
    String? role,
    @JsonKey(includeToJson: false) String? roleId,
    @JsonKey(includeToJson: false) String? occupation,
    @JsonKey(includeToJson: false) String? employeeNo,
    @JsonKey(includeToJson: false) String? accountToken,
    @JsonKey(includeToJson: false) String? hospitalId,
    @JsonKey(includeToJson: false) String? createdAt,
    @JsonKey(includeToJson: false) String? createdId,
    @JsonKey(includeToJson: false) String? id,
    @JsonKey(includeToJson: false) String? note,
    @JsonKey(includeToJson: false) String? assistPref,
    @JsonKey(
      name: 'RoleActions',
      includeToJson: false,
    )
    RoleActionsModel? roleActions,
    @JsonKey(
      name: 'Hospitals',
      includeToJson: false,
    )
    HospitalModel? hospitals,
  }) = _LinksModel;

  factory LinksModel.fromJson(Map<String, Object?> json) =>
      _$LinksModelFromJson(json);
}
