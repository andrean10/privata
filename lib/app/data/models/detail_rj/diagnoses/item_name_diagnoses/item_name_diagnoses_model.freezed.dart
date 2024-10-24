// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_name_diagnoses_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemNameDiagnosesModel _$ItemNameDiagnosesModelFromJson(
    Map<String, dynamic> json) {
  return _ItemNameDiagnosesModel.fromJson(json);
}

/// @nodoc
mixin _$ItemNameDiagnosesModel {
  String? get id => throw _privateConstructorUsedError;
  bool? get isICD10 => throw _privateConstructorUsedError;
  String? get keyword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemNameDiagnosesModelCopyWith<ItemNameDiagnosesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemNameDiagnosesModelCopyWith<$Res> {
  factory $ItemNameDiagnosesModelCopyWith(ItemNameDiagnosesModel value,
          $Res Function(ItemNameDiagnosesModel) then) =
      _$ItemNameDiagnosesModelCopyWithImpl<$Res, ItemNameDiagnosesModel>;
  @useResult
  $Res call({String? id, bool? isICD10, String? keyword});
}

/// @nodoc
class _$ItemNameDiagnosesModelCopyWithImpl<$Res,
        $Val extends ItemNameDiagnosesModel>
    implements $ItemNameDiagnosesModelCopyWith<$Res> {
  _$ItemNameDiagnosesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isICD10 = freezed,
    Object? keyword = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isICD10: freezed == isICD10
          ? _value.isICD10
          : isICD10 // ignore: cast_nullable_to_non_nullable
              as bool?,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemNameDiagnosesModelImplCopyWith<$Res>
    implements $ItemNameDiagnosesModelCopyWith<$Res> {
  factory _$$ItemNameDiagnosesModelImplCopyWith(
          _$ItemNameDiagnosesModelImpl value,
          $Res Function(_$ItemNameDiagnosesModelImpl) then) =
      __$$ItemNameDiagnosesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, bool? isICD10, String? keyword});
}

/// @nodoc
class __$$ItemNameDiagnosesModelImplCopyWithImpl<$Res>
    extends _$ItemNameDiagnosesModelCopyWithImpl<$Res,
        _$ItemNameDiagnosesModelImpl>
    implements _$$ItemNameDiagnosesModelImplCopyWith<$Res> {
  __$$ItemNameDiagnosesModelImplCopyWithImpl(
      _$ItemNameDiagnosesModelImpl _value,
      $Res Function(_$ItemNameDiagnosesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isICD10 = freezed,
    Object? keyword = freezed,
  }) {
    return _then(_$ItemNameDiagnosesModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isICD10: freezed == isICD10
          ? _value.isICD10
          : isICD10 // ignore: cast_nullable_to_non_nullable
              as bool?,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemNameDiagnosesModelImpl implements _ItemNameDiagnosesModel {
  const _$ItemNameDiagnosesModelImpl({this.id, this.isICD10, this.keyword});

  factory _$ItemNameDiagnosesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemNameDiagnosesModelImplFromJson(json);

  @override
  final String? id;
  @override
  final bool? isICD10;
  @override
  final String? keyword;

  @override
  String toString() {
    return 'ItemNameDiagnosesModel(id: $id, isICD10: $isICD10, keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemNameDiagnosesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isICD10, isICD10) || other.isICD10 == isICD10) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, isICD10, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemNameDiagnosesModelImplCopyWith<_$ItemNameDiagnosesModelImpl>
      get copyWith => __$$ItemNameDiagnosesModelImplCopyWithImpl<
          _$ItemNameDiagnosesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemNameDiagnosesModelImplToJson(
      this,
    );
  }
}

abstract class _ItemNameDiagnosesModel implements ItemNameDiagnosesModel {
  const factory _ItemNameDiagnosesModel(
      {final String? id,
      final bool? isICD10,
      final String? keyword}) = _$ItemNameDiagnosesModelImpl;

  factory _ItemNameDiagnosesModel.fromJson(Map<String, dynamic> json) =
      _$ItemNameDiagnosesModelImpl.fromJson;

  @override
  String? get id;
  @override
  bool? get isICD10;
  @override
  String? get keyword;
  @override
  @JsonKey(ignore: true)
  _$$ItemNameDiagnosesModelImplCopyWith<_$ItemNameDiagnosesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
