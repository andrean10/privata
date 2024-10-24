// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) {
  return _ScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$ScheduleModel {
  int? get mulai => throw _privateConstructorUsedError;
  int? get selesai => throw _privateConstructorUsedError;
  int? get menit => throw _privateConstructorUsedError;
  List<String>? get tipe => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleModelCopyWith<ScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleModelCopyWith<$Res> {
  factory $ScheduleModelCopyWith(
          ScheduleModel value, $Res Function(ScheduleModel) then) =
      _$ScheduleModelCopyWithImpl<$Res, ScheduleModel>;
  @useResult
  $Res call(
      {int? mulai, int? selesai, int? menit, List<String>? tipe, String? id});
}

/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res, $Val extends ScheduleModel>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mulai = freezed,
    Object? selesai = freezed,
    Object? menit = freezed,
    Object? tipe = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      mulai: freezed == mulai
          ? _value.mulai
          : mulai // ignore: cast_nullable_to_non_nullable
              as int?,
      selesai: freezed == selesai
          ? _value.selesai
          : selesai // ignore: cast_nullable_to_non_nullable
              as int?,
      menit: freezed == menit
          ? _value.menit
          : menit // ignore: cast_nullable_to_non_nullable
              as int?,
      tipe: freezed == tipe
          ? _value.tipe
          : tipe // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleModelImplCopyWith<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  factory _$$ScheduleModelImplCopyWith(
          _$ScheduleModelImpl value, $Res Function(_$ScheduleModelImpl) then) =
      __$$ScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? mulai, int? selesai, int? menit, List<String>? tipe, String? id});
}

/// @nodoc
class __$$ScheduleModelImplCopyWithImpl<$Res>
    extends _$ScheduleModelCopyWithImpl<$Res, _$ScheduleModelImpl>
    implements _$$ScheduleModelImplCopyWith<$Res> {
  __$$ScheduleModelImplCopyWithImpl(
      _$ScheduleModelImpl _value, $Res Function(_$ScheduleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mulai = freezed,
    Object? selesai = freezed,
    Object? menit = freezed,
    Object? tipe = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ScheduleModelImpl(
      mulai: freezed == mulai
          ? _value.mulai
          : mulai // ignore: cast_nullable_to_non_nullable
              as int?,
      selesai: freezed == selesai
          ? _value.selesai
          : selesai // ignore: cast_nullable_to_non_nullable
              as int?,
      menit: freezed == menit
          ? _value.menit
          : menit // ignore: cast_nullable_to_non_nullable
              as int?,
      tipe: freezed == tipe
          ? _value._tipe
          : tipe // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleModelImpl
    with DiagnosticableTreeMixin
    implements _ScheduleModel {
  const _$ScheduleModelImpl(
      {this.mulai, this.selesai, this.menit, final List<String>? tipe, this.id})
      : _tipe = tipe;

  factory _$ScheduleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleModelImplFromJson(json);

  @override
  final int? mulai;
  @override
  final int? selesai;
  @override
  final int? menit;
  final List<String>? _tipe;
  @override
  List<String>? get tipe {
    final value = _tipe;
    if (value == null) return null;
    if (_tipe is EqualUnmodifiableListView) return _tipe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleModel(mulai: $mulai, selesai: $selesai, menit: $menit, tipe: $tipe, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleModel'))
      ..add(DiagnosticsProperty('mulai', mulai))
      ..add(DiagnosticsProperty('selesai', selesai))
      ..add(DiagnosticsProperty('menit', menit))
      ..add(DiagnosticsProperty('tipe', tipe))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleModelImpl &&
            (identical(other.mulai, mulai) || other.mulai == mulai) &&
            (identical(other.selesai, selesai) || other.selesai == selesai) &&
            (identical(other.menit, menit) || other.menit == menit) &&
            const DeepCollectionEquality().equals(other._tipe, _tipe) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mulai, selesai, menit,
      const DeepCollectionEquality().hash(_tipe), id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      __$$ScheduleModelImplCopyWithImpl<_$ScheduleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleModelImplToJson(
      this,
    );
  }
}

abstract class _ScheduleModel implements ScheduleModel {
  const factory _ScheduleModel(
      {final int? mulai,
      final int? selesai,
      final int? menit,
      final List<String>? tipe,
      final String? id}) = _$ScheduleModelImpl;

  factory _ScheduleModel.fromJson(Map<String, dynamic> json) =
      _$ScheduleModelImpl.fromJson;

  @override
  int? get mulai;
  @override
  int? get selesai;
  @override
  int? get menit;
  @override
  List<String>? get tipe;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
