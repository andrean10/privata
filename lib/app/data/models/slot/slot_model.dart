import 'package:freezed_annotation/freezed_annotation.dart';

part 'slot_model.freezed.dart';
part 'slot_model.g.dart';

@freezed
class SlotModel with _$SlotModel {
  const factory SlotModel({
    int? start,
    int? end,
    dynamic menit,
    int? maxDuration,
  }) = _SlotModel;

  factory SlotModel.fromJson(Map<String, Object?> json) =>
      _$SlotModelFromJson(json);
}
