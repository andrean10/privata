// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'allergic_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllergicHistoryModel _$AllergicHistoryModelFromJson(Map<String, dynamic> json) {
  return _AllergicHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$AllergicHistoryModel {
  String? get code => throw _privateConstructorUsedError;
  String? get display => throw _privateConstructorUsedError;
  String? get system => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get criticality => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllergicHistoryModelCopyWith<AllergicHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllergicHistoryModelCopyWith<$Res> {
  factory $AllergicHistoryModelCopyWith(AllergicHistoryModel value,
          $Res Function(AllergicHistoryModel) then) =
      _$AllergicHistoryModelCopyWithImpl<$Res, AllergicHistoryModel>;
  @useResult
  $Res call(
      {String? code,
      String? display,
      String? system,
      String? id,
      String? status,
      String? category,
      String? criticality});
}

/// @nodoc
class _$AllergicHistoryModelCopyWithImpl<$Res,
        $Val extends AllergicHistoryModel>
    implements $AllergicHistoryModelCopyWith<$Res> {
  _$AllergicHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? display = freezed,
    Object? system = freezed,
    Object? id = freezed,
    Object? status = freezed,
    Object? category = freezed,
    Object? criticality = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      display: freezed == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      criticality: freezed == criticality
          ? _value.criticality
          : criticality // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllergicHistoryModelImplCopyWith<$Res>
    implements $AllergicHistoryModelCopyWith<$Res> {
  factory _$$AllergicHistoryModelImplCopyWith(_$AllergicHistoryModelImpl value,
          $Res Function(_$AllergicHistoryModelImpl) then) =
      __$$AllergicHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      String? display,
      String? system,
      String? id,
      String? status,
      String? category,
      String? criticality});
}

/// @nodoc
class __$$AllergicHistoryModelImplCopyWithImpl<$Res>
    extends _$AllergicHistoryModelCopyWithImpl<$Res, _$AllergicHistoryModelImpl>
    implements _$$AllergicHistoryModelImplCopyWith<$Res> {
  __$$AllergicHistoryModelImplCopyWithImpl(_$AllergicHistoryModelImpl _value,
      $Res Function(_$AllergicHistoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? display = freezed,
    Object? system = freezed,
    Object? id = freezed,
    Object? status = freezed,
    Object? category = freezed,
    Object? criticality = freezed,
  }) {
    return _then(_$AllergicHistoryModelImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      display: freezed == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String?,
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      criticality: freezed == criticality
          ? _value.criticality
          : criticality // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllergicHistoryModelImpl implements _AllergicHistoryModel {
  const _$AllergicHistoryModelImpl(
      {this.code,
      this.display,
      this.system,
      this.id,
      this.status,
      this.category,
      this.criticality});

  factory _$AllergicHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllergicHistoryModelImplFromJson(json);

  @override
  final String? code;
  @override
  final String? display;
  @override
  final String? system;
  @override
  final String? id;
  @override
  final String? status;
  @override
  final String? category;
  @override
  final String? criticality;

  @override
  String toString() {
    return 'AllergicHistoryModel(code: $code, display: $display, system: $system, id: $id, status: $status, category: $category, criticality: $criticality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllergicHistoryModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.display, display) || other.display == display) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.criticality, criticality) ||
                other.criticality == criticality));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, display, system, id, status, category, criticality);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllergicHistoryModelImplCopyWith<_$AllergicHistoryModelImpl>
      get copyWith =>
          __$$AllergicHistoryModelImplCopyWithImpl<_$AllergicHistoryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllergicHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _AllergicHistoryModel implements AllergicHistoryModel {
  const factory _AllergicHistoryModel(
      {final String? code,
      final String? display,
      final String? system,
      final String? id,
      final String? status,
      final String? category,
      final String? criticality}) = _$AllergicHistoryModelImpl;

  factory _AllergicHistoryModel.fromJson(Map<String, dynamic> json) =
      _$AllergicHistoryModelImpl.fromJson;

  @override
  String? get code;
  @override
  String? get display;
  @override
  String? get system;
  @override
  String? get id;
  @override
  String? get status;
  @override
  String? get category;
  @override
  String? get criticality;
  @override
  @JsonKey(ignore: true)
  _$$AllergicHistoryModelImplCopyWith<_$AllergicHistoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
