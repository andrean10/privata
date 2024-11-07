// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_notes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DoctorNotesModel _$DoctorNotesModelFromJson(Map<String, dynamic> json) {
  return _DoctorNotesModel.fromJson(json);
}

/// @nodoc
mixin _$DoctorNotesModel {
  List<String>? get subjective => throw _privateConstructorUsedError;
  List<String>? get objective => throw _privateConstructorUsedError;
  List<String>? get plan => throw _privateConstructorUsedError;
  List<String>? get assessment =>
      throw _privateConstructorUsedError; // @JsonKey(fromJson: freeTextFromJson) List<DrugsModel>? freeText,
  String? get freeText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoctorNotesModelCopyWith<DoctorNotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorNotesModelCopyWith<$Res> {
  factory $DoctorNotesModelCopyWith(
          DoctorNotesModel value, $Res Function(DoctorNotesModel) then) =
      _$DoctorNotesModelCopyWithImpl<$Res, DoctorNotesModel>;
  @useResult
  $Res call(
      {List<String>? subjective,
      List<String>? objective,
      List<String>? plan,
      List<String>? assessment,
      String? freeText});
}

/// @nodoc
class _$DoctorNotesModelCopyWithImpl<$Res, $Val extends DoctorNotesModel>
    implements $DoctorNotesModelCopyWith<$Res> {
  _$DoctorNotesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjective = freezed,
    Object? objective = freezed,
    Object? plan = freezed,
    Object? assessment = freezed,
    Object? freeText = freezed,
  }) {
    return _then(_value.copyWith(
      subjective: freezed == subjective
          ? _value.subjective
          : subjective // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      objective: freezed == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      assessment: freezed == assessment
          ? _value.assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      freeText: freezed == freeText
          ? _value.freeText
          : freeText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorNotesModelImplCopyWith<$Res>
    implements $DoctorNotesModelCopyWith<$Res> {
  factory _$$DoctorNotesModelImplCopyWith(_$DoctorNotesModelImpl value,
          $Res Function(_$DoctorNotesModelImpl) then) =
      __$$DoctorNotesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? subjective,
      List<String>? objective,
      List<String>? plan,
      List<String>? assessment,
      String? freeText});
}

/// @nodoc
class __$$DoctorNotesModelImplCopyWithImpl<$Res>
    extends _$DoctorNotesModelCopyWithImpl<$Res, _$DoctorNotesModelImpl>
    implements _$$DoctorNotesModelImplCopyWith<$Res> {
  __$$DoctorNotesModelImplCopyWithImpl(_$DoctorNotesModelImpl _value,
      $Res Function(_$DoctorNotesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjective = freezed,
    Object? objective = freezed,
    Object? plan = freezed,
    Object? assessment = freezed,
    Object? freeText = freezed,
  }) {
    return _then(_$DoctorNotesModelImpl(
      subjective: freezed == subjective
          ? _value._subjective
          : subjective // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      objective: freezed == objective
          ? _value._objective
          : objective // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      plan: freezed == plan
          ? _value._plan
          : plan // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      assessment: freezed == assessment
          ? _value._assessment
          : assessment // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      freeText: freezed == freeText
          ? _value.freeText
          : freeText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorNotesModelImpl implements _DoctorNotesModel {
  const _$DoctorNotesModelImpl(
      {final List<String>? subjective,
      final List<String>? objective,
      final List<String>? plan,
      final List<String>? assessment,
      this.freeText})
      : _subjective = subjective,
        _objective = objective,
        _plan = plan,
        _assessment = assessment;

  factory _$DoctorNotesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorNotesModelImplFromJson(json);

  final List<String>? _subjective;
  @override
  List<String>? get subjective {
    final value = _subjective;
    if (value == null) return null;
    if (_subjective is EqualUnmodifiableListView) return _subjective;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _objective;
  @override
  List<String>? get objective {
    final value = _objective;
    if (value == null) return null;
    if (_objective is EqualUnmodifiableListView) return _objective;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _plan;
  @override
  List<String>? get plan {
    final value = _plan;
    if (value == null) return null;
    if (_plan is EqualUnmodifiableListView) return _plan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _assessment;
  @override
  List<String>? get assessment {
    final value = _assessment;
    if (value == null) return null;
    if (_assessment is EqualUnmodifiableListView) return _assessment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// @JsonKey(fromJson: freeTextFromJson) List<DrugsModel>? freeText,
  @override
  final String? freeText;

  @override
  String toString() {
    return 'DoctorNotesModel(subjective: $subjective, objective: $objective, plan: $plan, assessment: $assessment, freeText: $freeText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorNotesModelImpl &&
            const DeepCollectionEquality()
                .equals(other._subjective, _subjective) &&
            const DeepCollectionEquality()
                .equals(other._objective, _objective) &&
            const DeepCollectionEquality().equals(other._plan, _plan) &&
            const DeepCollectionEquality()
                .equals(other._assessment, _assessment) &&
            (identical(other.freeText, freeText) ||
                other.freeText == freeText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_subjective),
      const DeepCollectionEquality().hash(_objective),
      const DeepCollectionEquality().hash(_plan),
      const DeepCollectionEquality().hash(_assessment),
      freeText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorNotesModelImplCopyWith<_$DoctorNotesModelImpl> get copyWith =>
      __$$DoctorNotesModelImplCopyWithImpl<_$DoctorNotesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorNotesModelImplToJson(
      this,
    );
  }
}

abstract class _DoctorNotesModel implements DoctorNotesModel {
  const factory _DoctorNotesModel(
      {final List<String>? subjective,
      final List<String>? objective,
      final List<String>? plan,
      final List<String>? assessment,
      final String? freeText}) = _$DoctorNotesModelImpl;

  factory _DoctorNotesModel.fromJson(Map<String, dynamic> json) =
      _$DoctorNotesModelImpl.fromJson;

  @override
  List<String>? get subjective;
  @override
  List<String>? get objective;
  @override
  List<String>? get plan;
  @override
  List<String>? get assessment;
  @override // @JsonKey(fromJson: freeTextFromJson) List<DrugsModel>? freeText,
  String? get freeText;
  @override
  @JsonKey(ignore: true)
  _$$DoctorNotesModelImplCopyWith<_$DoctorNotesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
