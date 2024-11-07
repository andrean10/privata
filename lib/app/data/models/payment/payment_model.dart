import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    String? type,
    String? name,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, Object?> json) =>
      _$PaymentModelFromJson(json);
}
