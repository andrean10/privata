import 'package:freezed_annotation/freezed_annotation.dart';

part 'ph_model.freezed.dart';
part 'ph_model.g.dart';

@freezed
class PHModel with _$PHModel {
  const factory PHModel({
    String? code,
    String? idRs,
    String? date,
    String? id,
  }) = _PHModel;

  factory PHModel.fromJson(Map<String, Object?> json) =>
      _$PHModelFromJson(json);
}
