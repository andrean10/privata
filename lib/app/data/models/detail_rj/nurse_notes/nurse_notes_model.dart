import 'package:freezed_annotation/freezed_annotation.dart';

part 'nurse_notes_model.freezed.dart';
part 'nurse_notes_model.g.dart';

@freezed
class NurseNotesModel with _$NurseNotesModel {
  const factory NurseNotesModel({
    List<String>? situation,
    List<String>? background,
    List<String>? assessment,
    List<String>? recommendation,
    String? freeText,
    String? mrNo,
    String? mrId,
    String? patientId,
    String? hospitalId,
    String? practiceId,
    String? appointId,
    String? createdName,
    String? createdId,
    String? createdAt,
    String? id,
  }) = _NurseNotesModel;

  factory NurseNotesModel.fromJson(Map<String, Object?> json) =>
      _$NurseNotesModelFromJson(json);
}
