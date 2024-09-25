import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required String? token,
    @JsonKey(name: 'redirect_url') required String? url,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, Object?> json) =>
      _$PaymentModelFromJson(json);
}
