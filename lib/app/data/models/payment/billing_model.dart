import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'billing_model.freezed.dart';
part 'billing_model.g.dart';

@freezed
class BillingModel with _$BillingModel {
  const factory BillingModel({
    required String? token,
    @JsonKey(name: 'redirect_url') required String? url,
  }) = _BillingModel;

  factory BillingModel.fromJson(Map<String, Object?> json) =>
      _$BillingModelFromJson(json);
}
