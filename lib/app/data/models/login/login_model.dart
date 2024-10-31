import 'package:freezed_annotation/freezed_annotation.dart';

import '../location/position/position_model.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    required String username,
    required String password,
    PositionModel? location,
    @Default(true) bool isMobile,
    @Default('-') String? deviceName,
    @Default('-') String browserName,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?> json) =>
      _$LoginModelFromJson(json);
}
