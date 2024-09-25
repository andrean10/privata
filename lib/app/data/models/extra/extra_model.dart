import 'package:freezed_annotation/freezed_annotation.dart';

part 'extra_model.freezed.dart';
part 'extra_model.g.dart';

@freezed
class ExtraModel with _$ExtraModel {
  const factory ExtraModel({
    List<String>? action,
    String? id,
  }) = _ExtraModel;

  factory ExtraModel.fromJson(Map<String, Object?> json) =>
      _$ExtraModelFromJson(json);
}
