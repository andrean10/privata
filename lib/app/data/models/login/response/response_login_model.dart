import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:privata/app/data/models/user/user_model.dart';

part 'response_login_model.freezed.dart';
part 'response_login_model.g.dart';

@freezed
class ResponseLoginModel with _$ResponseLoginModel {
  const factory ResponseLoginModel({
    String? id,
    // int? ttl,
    String? created,
    String? userId,
    UserModel? user,
    int? timestamp,
  }) = _ResponseLoginModel;

  factory ResponseLoginModel.fromJson(Map<String, Object?> json) =>
      _$ResponseLoginModelFromJson(json);
}
