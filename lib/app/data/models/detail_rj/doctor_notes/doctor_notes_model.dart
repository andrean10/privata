import 'package:freezed_annotation/freezed_annotation.dart';


part 'doctor_notes_model.freezed.dart';
part 'doctor_notes_model.g.dart';

@freezed
class DoctorNotesModel with _$DoctorNotesModel {
  const factory DoctorNotesModel({
    List<String>? subjective,
    List<String>? objective,
    List<String>? plan,
    List<String>? assessment,
    // @JsonKey(fromJson: freeTextFromJson) List<DrugsModel>? freeText,
     String? freeText,
  }) = _DoctorNotesModel;

  factory DoctorNotesModel.fromJson(Map<String, Object?> json) =>
      _$DoctorNotesModelFromJson(json);
}

// String? freeTextFromJson(dynamic json) {
//   if (json is String) {
//     return json;
//   } else if (json is List<dynamic>) {
//     return json.map((e) => DrugsModel.fromJson(e)).toList();
//   }

//   return null;
// }
