// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) {
  return _DistrictModel.fromJson(json);
}

/// @nodoc
mixin _$DistrictModel {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'regency_id')
  String? get regencyId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistrictModelCopyWith<DistrictModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictModelCopyWith<$Res> {
  factory $DistrictModelCopyWith(
          DistrictModel value, $Res Function(DistrictModel) then) =
      _$DistrictModelCopyWithImpl<$Res, DistrictModel>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'regency_id') String? regencyId,
      String? name});
}

/// @nodoc
class _$DistrictModelCopyWithImpl<$Res, $Val extends DistrictModel>
    implements $DistrictModelCopyWith<$Res> {
  _$DistrictModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? regencyId = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      regencyId: freezed == regencyId
          ? _value.regencyId
          : regencyId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistrictModelImplCopyWith<$Res>
    implements $DistrictModelCopyWith<$Res> {
  factory _$$DistrictModelImplCopyWith(
          _$DistrictModelImpl value, $Res Function(_$DistrictModelImpl) then) =
      __$$DistrictModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'regency_id') String? regencyId,
      String? name});
}

/// @nodoc
class __$$DistrictModelImplCopyWithImpl<$Res>
    extends _$DistrictModelCopyWithImpl<$Res, _$DistrictModelImpl>
    implements _$$DistrictModelImplCopyWith<$Res> {
  __$$DistrictModelImplCopyWithImpl(
      _$DistrictModelImpl _value, $Res Function(_$DistrictModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? regencyId = freezed,
    Object? name = freezed,
  }) {
    return _then(_$DistrictModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      regencyId: freezed == regencyId
          ? _value.regencyId
          : regencyId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistrictModelImpl
    with DiagnosticableTreeMixin
    implements _DistrictModel {
  const _$DistrictModelImpl(
      {required this.id,
      @JsonKey(name: 'regency_id') required this.regencyId,
      required this.name});

  factory _$DistrictModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictModelImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'regency_id')
  final String? regencyId;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DistrictModel(id: $id, regencyId: $regencyId, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DistrictModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('regencyId', regencyId))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.regencyId, regencyId) ||
                other.regencyId == regencyId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, regencyId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictModelImplCopyWith<_$DistrictModelImpl> get copyWith =>
      __$$DistrictModelImplCopyWithImpl<_$DistrictModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistrictModelImplToJson(
      this,
    );
  }
}

abstract class _DistrictModel implements DistrictModel {
  const factory _DistrictModel(
      {required final String? id,
      @JsonKey(name: 'regency_id') required final String? regencyId,
      required final String? name}) = _$DistrictModelImpl;

  factory _DistrictModel.fromJson(Map<String, dynamic> json) =
      _$DistrictModelImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'regency_id')
  String? get regencyId;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$DistrictModelImplCopyWith<_$DistrictModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
