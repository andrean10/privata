import 'package:freezed_annotation/freezed_annotation.dart';

part 'tags_model.freezed.dart';
part 'tags_model.g.dart';

@freezed
class TagsModel with _$TagsModel {
  const factory TagsModel({
    String? name,
    String? desc,
  }) = _TagsModel;

  factory TagsModel.fromJson(Map<String, Object?> json) =>
      _$TagsModelFromJson(json);
}
