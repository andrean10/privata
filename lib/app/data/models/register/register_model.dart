import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:privata/app/data/models/links/links_model.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    @JsonKey(name: 'Links') List<LinksModel>? links,
    String? email,
    int? gender,
    String? hp,
    String? nama,
    String? password,
    String? username,
    String? from,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, Object?> json) =>
      _$RegisterModelFromJson(json);
}
