import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:privata/app/data/models/extra/extra_model.dart';

part 'role_actions_model.freezed.dart';
part 'role_actions_model.g.dart';

@freezed
class RoleActionsModel with _$RoleActionsModel {
  const factory RoleActionsModel({
    String? name,
    String? type,
    bool? isLocal,
    ExtraModel? extra,
    String? createdAt,
    String? createdId,
    String? id,
  }) = _RoleActionsModel;

  factory RoleActionsModel.fromJson(Map<String, Object?> json) =>
      _$RoleActionsModelFromJson(json);
}
