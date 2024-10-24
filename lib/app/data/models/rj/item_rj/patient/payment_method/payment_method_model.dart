import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_model.freezed.dart';
part 'payment_method_model.g.dart';

@freezed
class PaymentMethodModel with _$PaymentMethodModel {
  const factory PaymentMethodModel({
    String? name,
    String? type,
    String? no,
    @JsonKey(name: 'created_at') String? createdAt,
    int? id,
  }) = _PaymentMethodModel;

  factory PaymentMethodModel.fromJson(Map<String, Object?> json) =>
      _$PaymentMethodModelFromJson(json);
}
