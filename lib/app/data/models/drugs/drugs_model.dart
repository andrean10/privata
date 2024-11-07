import 'package:freezed_annotation/freezed_annotation.dart';

part 'drugs_model.freezed.dart';
part 'drugs_model.g.dart';

@freezed
class DrugsModel with _$DrugsModel {
  const factory DrugsModel({
    String? medicineName,
    int? quantity,
    String? unit,
    String? rule,
  }) = _DrugsModel;

  factory DrugsModel.fromJson(Map<String, Object?> json) =>
      _$DrugsModelFromJson(json);
}
