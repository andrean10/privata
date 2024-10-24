// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DayModel _$DayModelFromJson(Map<String, dynamic> json) {
  return _DayModel.fromJson(json);
}

/// @nodoc
mixin _$DayModel {
  bool? get isHoliday => throw _privateConstructorUsedError;
  List<ScheduleModel>? get schedule => throw _privateConstructorUsedError;
  int? get quotaNonJkn => throw _privateConstructorUsedError;
  int? get quotaJkn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayModelCopyWith<DayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayModelCopyWith<$Res> {
  factory $DayModelCopyWith(DayModel value, $Res Function(DayModel) then) =
      _$DayModelCopyWithImpl<$Res, DayModel>;
  @useResult
  $Res call(
      {bool? isHoliday,
      List<ScheduleModel>? schedule,
      int? quotaNonJkn,
      int? quotaJkn});
}

/// @nodoc
class _$DayModelCopyWithImpl<$Res, $Val extends DayModel>
    implements $DayModelCopyWith<$Res> {
  _$DayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHoliday = freezed,
    Object? schedule = freezed,
    Object? quotaNonJkn = freezed,
    Object? quotaJkn = freezed,
  }) {
    return _then(_value.copyWith(
      isHoliday: freezed == isHoliday
          ? _value.isHoliday
          : isHoliday // ignore: cast_nullable_to_non_nullable
              as bool?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>?,
      quotaNonJkn: freezed == quotaNonJkn
          ? _value.quotaNonJkn
          : quotaNonJkn // ignore: cast_nullable_to_non_nullable
              as int?,
      quotaJkn: freezed == quotaJkn
          ? _value.quotaJkn
          : quotaJkn // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayModelImplCopyWith<$Res>
    implements $DayModelCopyWith<$Res> {
  factory _$$DayModelImplCopyWith(
          _$DayModelImpl value, $Res Function(_$DayModelImpl) then) =
      __$$DayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isHoliday,
      List<ScheduleModel>? schedule,
      int? quotaNonJkn,
      int? quotaJkn});
}

/// @nodoc
class __$$DayModelImplCopyWithImpl<$Res>
    extends _$DayModelCopyWithImpl<$Res, _$DayModelImpl>
    implements _$$DayModelImplCopyWith<$Res> {
  __$$DayModelImplCopyWithImpl(
      _$DayModelImpl _value, $Res Function(_$DayModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHoliday = freezed,
    Object? schedule = freezed,
    Object? quotaNonJkn = freezed,
    Object? quotaJkn = freezed,
  }) {
    return _then(_$DayModelImpl(
      isHoliday: freezed == isHoliday
          ? _value.isHoliday
          : isHoliday // ignore: cast_nullable_to_non_nullable
              as bool?,
      schedule: freezed == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>?,
      quotaNonJkn: freezed == quotaNonJkn
          ? _value.quotaNonJkn
          : quotaNonJkn // ignore: cast_nullable_to_non_nullable
              as int?,
      quotaJkn: freezed == quotaJkn
          ? _value.quotaJkn
          : quotaJkn // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DayModelImpl with DiagnosticableTreeMixin implements _DayModel {
  const _$DayModelImpl(
      {this.isHoliday,
      final List<ScheduleModel>? schedule,
      this.quotaNonJkn,
      this.quotaJkn})
      : _schedule = schedule;

  factory _$DayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayModelImplFromJson(json);

  @override
  final bool? isHoliday;
  final List<ScheduleModel>? _schedule;
  @override
  List<ScheduleModel>? get schedule {
    final value = _schedule;
    if (value == null) return null;
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? quotaNonJkn;
  @override
  final int? quotaJkn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DayModel(isHoliday: $isHoliday, schedule: $schedule, quotaNonJkn: $quotaNonJkn, quotaJkn: $quotaJkn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DayModel'))
      ..add(DiagnosticsProperty('isHoliday', isHoliday))
      ..add(DiagnosticsProperty('schedule', schedule))
      ..add(DiagnosticsProperty('quotaNonJkn', quotaNonJkn))
      ..add(DiagnosticsProperty('quotaJkn', quotaJkn));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayModelImpl &&
            (identical(other.isHoliday, isHoliday) ||
                other.isHoliday == isHoliday) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            (identical(other.quotaNonJkn, quotaNonJkn) ||
                other.quotaNonJkn == quotaNonJkn) &&
            (identical(other.quotaJkn, quotaJkn) ||
                other.quotaJkn == quotaJkn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isHoliday,
      const DeepCollectionEquality().hash(_schedule), quotaNonJkn, quotaJkn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayModelImplCopyWith<_$DayModelImpl> get copyWith =>
      __$$DayModelImplCopyWithImpl<_$DayModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayModelImplToJson(
      this,
    );
  }
}

abstract class _DayModel implements DayModel {
  const factory _DayModel(
      {final bool? isHoliday,
      final List<ScheduleModel>? schedule,
      final int? quotaNonJkn,
      final int? quotaJkn}) = _$DayModelImpl;

  factory _DayModel.fromJson(Map<String, dynamic> json) =
      _$DayModelImpl.fromJson;

  @override
  bool? get isHoliday;
  @override
  List<ScheduleModel>? get schedule;
  @override
  int? get quotaNonJkn;
  @override
  int? get quotaJkn;
  @override
  @JsonKey(ignore: true)
  _$$DayModelImplCopyWith<_$DayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
