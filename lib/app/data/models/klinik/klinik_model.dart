import 'package:freezed_annotation/freezed_annotation.dart';

part 'klinik_model.freezed.dart';
part 'klinik_model.g.dart';

@freezed
class KlinikModel with _$KlinikModel {
  const factory KlinikModel({
    String? logo,
  }) = _KlinikModel;

  factory KlinikModel.fromJson(Map<String, Object?> json) =>
      _$KlinikModelFromJson(json);
}
