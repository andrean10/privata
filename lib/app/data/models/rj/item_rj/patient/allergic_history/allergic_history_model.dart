import 'package:freezed_annotation/freezed_annotation.dart';

part 'allergic_history_model.freezed.dart';
part 'allergic_history_model.g.dart';

@freezed
class AllergicHistoryModel with _$AllergicHistoryModel {
  const factory AllergicHistoryModel({
    String? code,
    String? display,
    String? system,
    String? id,
    String? status,
    String? category,
    String? criticality,
  }) = _AllergicHistoryModel;

  factory AllergicHistoryModel.fromJson(Map<String, Object?> json) =>
      _$AllergicHistoryModelFromJson(json);
}