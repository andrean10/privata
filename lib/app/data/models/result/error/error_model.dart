import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model.freezed.dart';
part 'error_model.g.dart';

@freezed
class ErrorModel with _$ErrorModel {
  const factory ErrorModel({
    String? name,
    required int status,
    String? message,
    required int statusCode,
    String? code,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json['error']);
}
