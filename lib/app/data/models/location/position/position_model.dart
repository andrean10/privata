import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_model.freezed.dart';
part 'position_model.g.dart';

@freezed
class PositionModel with _$PositionModel {
  const factory PositionModel({
    @Default('') String? latitude,
    @Default('') String? longitude,
  }) = _PositionModel;

  factory PositionModel.fromJson(Map<String, Object?> json) =>
      _$PositionModelFromJson(json);
}
