// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_procedure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemProcedureModel _$ItemProcedureModelFromJson(Map<String, dynamic> json) {
  return _ItemProcedureModel.fromJson(json);
}

/// @nodoc
mixin _$ItemProcedureModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get basicFee => throw _privateConstructorUsedError;
  int? get totalFee => throw _privateConstructorUsedError;
  bool? get isPriceLock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemProcedureModelCopyWith<ItemProcedureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemProcedureModelCopyWith<$Res> {
  factory $ItemProcedureModelCopyWith(
          ItemProcedureModel value, $Res Function(ItemProcedureModel) then) =
      _$ItemProcedureModelCopyWithImpl<$Res, ItemProcedureModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      int? basicFee,
      int? totalFee,
      bool? isPriceLock});
}

/// @nodoc
class _$ItemProcedureModelCopyWithImpl<$Res, $Val extends ItemProcedureModel>
    implements $ItemProcedureModelCopyWith<$Res> {
  _$ItemProcedureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? basicFee = freezed,
    Object? totalFee = freezed,
    Object? isPriceLock = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      basicFee: freezed == basicFee
          ? _value.basicFee
          : basicFee // ignore: cast_nullable_to_non_nullable
              as int?,
      totalFee: freezed == totalFee
          ? _value.totalFee
          : totalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      isPriceLock: freezed == isPriceLock
          ? _value.isPriceLock
          : isPriceLock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemProcedureModelImplCopyWith<$Res>
    implements $ItemProcedureModelCopyWith<$Res> {
  factory _$$ItemProcedureModelImplCopyWith(_$ItemProcedureModelImpl value,
          $Res Function(_$ItemProcedureModelImpl) then) =
      __$$ItemProcedureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      int? basicFee,
      int? totalFee,
      bool? isPriceLock});
}

/// @nodoc
class __$$ItemProcedureModelImplCopyWithImpl<$Res>
    extends _$ItemProcedureModelCopyWithImpl<$Res, _$ItemProcedureModelImpl>
    implements _$$ItemProcedureModelImplCopyWith<$Res> {
  __$$ItemProcedureModelImplCopyWithImpl(_$ItemProcedureModelImpl _value,
      $Res Function(_$ItemProcedureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? basicFee = freezed,
    Object? totalFee = freezed,
    Object? isPriceLock = freezed,
  }) {
    return _then(_$ItemProcedureModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      basicFee: freezed == basicFee
          ? _value.basicFee
          : basicFee // ignore: cast_nullable_to_non_nullable
              as int?,
      totalFee: freezed == totalFee
          ? _value.totalFee
          : totalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      isPriceLock: freezed == isPriceLock
          ? _value.isPriceLock
          : isPriceLock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemProcedureModelImpl implements _ItemProcedureModel {
  const _$ItemProcedureModelImpl(
      {this.id, this.name, this.basicFee, this.totalFee, this.isPriceLock});

  factory _$ItemProcedureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemProcedureModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final int? basicFee;
  @override
  final int? totalFee;
  @override
  final bool? isPriceLock;

  @override
  String toString() {
    return 'ItemProcedureModel(id: $id, name: $name, basicFee: $basicFee, totalFee: $totalFee, isPriceLock: $isPriceLock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemProcedureModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.basicFee, basicFee) ||
                other.basicFee == basicFee) &&
            (identical(other.totalFee, totalFee) ||
                other.totalFee == totalFee) &&
            (identical(other.isPriceLock, isPriceLock) ||
                other.isPriceLock == isPriceLock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, basicFee, totalFee, isPriceLock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemProcedureModelImplCopyWith<_$ItemProcedureModelImpl> get copyWith =>
      __$$ItemProcedureModelImplCopyWithImpl<_$ItemProcedureModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemProcedureModelImplToJson(
      this,
    );
  }
}

abstract class _ItemProcedureModel implements ItemProcedureModel {
  const factory _ItemProcedureModel(
      {final String? id,
      final String? name,
      final int? basicFee,
      final int? totalFee,
      final bool? isPriceLock}) = _$ItemProcedureModelImpl;

  factory _ItemProcedureModel.fromJson(Map<String, dynamic> json) =
      _$ItemProcedureModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  int? get basicFee;
  @override
  int? get totalFee;
  @override
  bool? get isPriceLock;
  @override
  @JsonKey(ignore: true)
  _$$ItemProcedureModelImplCopyWith<_$ItemProcedureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
