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
  }) = _DoctorNotesModel;

  factory DoctorNotesModel.fromJson(Map<String, Object?> json) =>
      _$DoctorNotesModelFromJson(json);
}
