import 'package:freezed_annotation/freezed_annotation.dart';

import '../hospital/hospital_model.dart';
import '../role_actions/role_actions_model.dart';

part 'links_model.freezed.dart';
part 'links_model.g.dart';

@freezed
class LinksModel with _$LinksModel {
  const factory LinksModel({
    String? accountId,
    String? configId,
    String? name,
    bool? active,
    String? type,
    String? role,
    String? roleId,
    String? occupation,
    String? employeeNo,
    String? accountToken,
    String? hospitalId,
    String? createdAt,
    String? createdId,
    String? id,
    String? note,
    String? assistPref,
    @JsonKey(name: 'RoleActions') RoleActionsModel? roleActions,
    @JsonKey(name: 'Hospitals') HospitalModel? hospitals,
  }) = _LinksModel;

  factory LinksModel.fromJson(Map<String, Object?> json) =>
      _$LinksModelFromJson(json);
}
