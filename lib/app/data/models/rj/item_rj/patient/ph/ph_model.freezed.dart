// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ph_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PHModel _$PHModelFromJson(Map<String, dynamic> json) {
  return _PHModel.fromJson(json);
}

/// @nodoc
mixin _$PHModel {
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_rs')
  String? get idRs => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  List<TagsModel>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PHModelCopyWith<PHModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PHModelCopyWith<$Res> {
  factory $PHModelCopyWith(PHModel value, $Res Function(PHModel) then) =
      _$PHModelCopyWithImpl<$Res, PHModel>;
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: 'id_rs') String? idRs,
      String? date,
      String? id,
      List<TagsModel>? tags});
}

/// @nodoc
class _$PHModelCopyWithImpl<$Res, $Val extends PHModel>
    implements $PHModelCopyWith<$Res> {
  _$PHModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? idRs = freezed,
    Object? date = freezed,
    Object? id = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      idRs: freezed == idRs
          ? _value.idRs
          : idRs // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PHModelImplCopyWith<$Res> implements $PHModelCopyWith<$Res> {
  factory _$$PHModelImplCopyWith(
          _$PHModelImpl value, $Res Function(_$PHModelImpl) then) =
      __$$PHModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: 'id_rs') String? idRs,
      String? date,
      String? id,
      List<TagsModel>? tags});
}

/// @nodoc
class __$$PHModelImplCopyWithImpl<$Res>
    extends _$PHModelCopyWithImpl<$Res, _$PHModelImpl>
    implements _$$PHModelImplCopyWith<$Res> {
  __$$PHModelImplCopyWithImpl(
      _$PHModelImpl _value, $Res Function(_$PHModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? idRs = freezed,
    Object? date = freezed,
    Object? id = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$PHModelImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      idRs: freezed == idRs
          ? _value.idRs
          : idRs // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PHModelImpl implements _PHModel {
  const _$PHModelImpl(
      {this.code,
      @JsonKey(name: 'id_rs') this.idRs,
      this.date,
      this.id,
      final List<TagsModel>? tags})
      : _tags = tags;

  factory _$PHModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PHModelImplFromJson(json);

  @override
  final String? code;
  @override
  @JsonKey(name: 'id_rs')
  final String? idRs;
  @override
  final String? date;
  @override
  final String? id;
  final List<TagsModel>? _tags;
  @override
  List<TagsModel>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PHModel(code: $code, idRs: $idRs, date: $date, id: $id, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PHModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.idRs, idRs) || other.idRs == idRs) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, idRs, date, id,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PHModelImplCopyWith<_$PHModelImpl> get copyWith =>
      __$$PHModelImplCopyWithImpl<_$PHModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PHModelImplToJson(
      this,
    );
  }
}

abstract class _PHModel implements PHModel {
  const factory _PHModel(
      {final String? code,
      @JsonKey(name: 'id_rs') final String? idRs,
      final String? date,
      final String? id,
      final List<TagsModel>? tags}) = _$PHModelImpl;

  factory _PHModel.fromJson(Map<String, dynamic> json) = _$PHModelImpl.fromJson;

  @override
  String? get code;
  @override
  @JsonKey(name: 'id_rs')
  String? get idRs;
  @override
  String? get date;
  @override
  String? get id;
  @override
  List<TagsModel>? get tags;
  @override
  @JsonKey(ignore: true)
  _$$PHModelImplCopyWith<_$PHModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
