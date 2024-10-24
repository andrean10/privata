import 'package:freezed_annotation/freezed_annotation.dart';

import 'tags/tags_model.dart';

part 'ph_model.freezed.dart';
part 'ph_model.g.dart';

@freezed
class PHModel with _$PHModel {
  const factory PHModel({
    String? code,
    @JsonKey(name: 'id_rs') String? idRs,
    String? date,
    String? id,
    List<TagsModel>? tags,
  }) = _PHModel;

  factory PHModel.fromJson(Map<String, Object?> json) =>
      _$PHModelFromJson(json);
}
