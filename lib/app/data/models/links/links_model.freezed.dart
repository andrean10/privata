// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'links_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LinksModel _$LinksModelFromJson(Map<String, dynamic> json) {
  return _LinksModel.fromJson(json);
}

/// @nodoc
mixin _$LinksModel {
  String? get accountId => throw _privateConstructorUsedError;
  String? get configId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get roleId => throw _privateConstructorUsedError;
  String? get occupation => throw _privateConstructorUsedError;
  String? get employeeNo => throw _privateConstructorUsedError;
  String? get accountToken => throw _privateConstructorUsedError;
  String? get hospitalId => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get createdId => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get assistPref => throw _privateConstructorUsedError;
  @JsonKey(name: 'RoleActions')
  RoleActionsModel? get roleActions => throw _privateConstructorUsedError;
  @JsonKey(name: 'Hospitals')
  HospitalModel? get hospitals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinksModelCopyWith<LinksModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksModelCopyWith<$Res> {
  factory $LinksModelCopyWith(
          LinksModel value, $Res Function(LinksModel) then) =
      _$LinksModelCopyWithImpl<$Res, LinksModel>;
  @useResult
  $Res call(
      {String? accountId,
      String? configId,
      String? name,
      bool? active,
      String? type,
      String? role,
      String? roleId,
      String? occupation,
      String? employeeNo,
      String? accountToken,
      String? hospitalId,
      String? createdAt,
      String? createdId,
      String? id,
      String? note,
      String? assistPref,
      @JsonKey(name: 'RoleActions') RoleActionsModel? roleActions,
      @JsonKey(name: 'Hospitals') HospitalModel? hospitals});

  $RoleActionsModelCopyWith<$Res>? get roleActions;
  $HospitalModelCopyWith<$Res>? get hospitals;
}

/// @nodoc
class _$LinksModelCopyWithImpl<$Res, $Val extends LinksModel>
    implements $LinksModelCopyWith<$Res> {
  _$LinksModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = freezed,
    Object? configId = freezed,
    Object? name = freezed,
    Object? active = freezed,
    Object? type = freezed,
    Object? role = freezed,
    Object? roleId = freezed,
    Object? occupation = freezed,
    Object? employeeNo = freezed,
    Object? accountToken = freezed,
    Object? hospitalId = freezed,
    Object? createdAt = freezed,
    Object? createdId = freezed,
    Object? id = freezed,
    Object? note = freezed,
    Object? assistPref = freezed,
    Object? roleActions = freezed,
    Object? hospitals = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      configId: freezed == configId
          ? _value.configId
          : configId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeNo: freezed == employeeNo
          ? _value.employeeNo
          : employeeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      accountToken: freezed == accountToken
          ? _value.accountToken
          : accountToken // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: freezed == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      assistPref: freezed == assistPref
          ? _value.assistPref
          : assistPref // ignore: cast_nullable_to_non_nullable
              as String?,
      roleActions: freezed == roleActions
          ? _value.roleActions
          : roleActions // ignore: cast_nullable_to_non_nullable
              as RoleActionsModel?,
      hospitals: freezed == hospitals
          ? _value.hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as HospitalModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleActionsModelCopyWith<$Res>? get roleActions {
    if (_value.roleActions == null) {
      return null;
    }

    return $RoleActionsModelCopyWith<$Res>(_value.roleActions!, (value) {
      return _then(_value.copyWith(roleActions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HospitalModelCopyWith<$Res>? get hospitals {
    if (_value.hospitals == null) {
      return null;
    }

    return $HospitalModelCopyWith<$Res>(_value.hospitals!, (value) {
      return _then(_value.copyWith(hospitals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LinksModelImplCopyWith<$Res>
    implements $LinksModelCopyWith<$Res> {
  factory _$$LinksModelImplCopyWith(
          _$LinksModelImpl value, $Res Function(_$LinksModelImpl) then) =
      __$$LinksModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? accountId,
      String? configId,
      String? name,
      bool? active,
      String? type,
      String? role,
      String? roleId,
      String? occupation,
      String? employeeNo,
      String? accountToken,
      String? hospitalId,
      String? createdAt,
      String? createdId,
      String? id,
      String? note,
      String? assistPref,
      @JsonKey(name: 'RoleActions') RoleActionsModel? roleActions,
      @JsonKey(name: 'Hospitals') HospitalModel? hospitals});

  @override
  $RoleActionsModelCopyWith<$Res>? get roleActions;
  @override
  $HospitalModelCopyWith<$Res>? get hospitals;
}

/// @nodoc
class __$$LinksModelImplCopyWithImpl<$Res>
    extends _$LinksModelCopyWithImpl<$Res, _$LinksModelImpl>
    implements _$$LinksModelImplCopyWith<$Res> {
  __$$LinksModelImplCopyWithImpl(
      _$LinksModelImpl _value, $Res Function(_$LinksModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = freezed,
    Object? configId = freezed,
    Object? name = freezed,
    Object? active = freezed,
    Object? type = freezed,
    Object? role = freezed,
    Object? roleId = freezed,
    Object? occupation = freezed,
    Object? employeeNo = freezed,
    Object? accountToken = freezed,
    Object? hospitalId = freezed,
    Object? createdAt = freezed,
    Object? createdId = freezed,
    Object? id = freezed,
    Object? note = freezed,
    Object? assistPref = freezed,
    Object? roleActions = freezed,
    Object? hospitals = freezed,
  }) {
    return _then(_$LinksModelImpl(
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      configId: freezed == configId
          ? _value.configId
          : configId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeNo: freezed == employeeNo
          ? _value.employeeNo
          : employeeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      accountToken: freezed == accountToken
          ? _value.accountToken
          : accountToken // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: freezed == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      assistPref: freezed == assistPref
          ? _value.assistPref
          : assistPref // ignore: cast_nullable_to_non_nullable
              as String?,
      roleActions: freezed == roleActions
          ? _value.roleActions
          : roleActions // ignore: cast_nullable_to_non_nullable
              as RoleActionsModel?,
      hospitals: freezed == hospitals
          ? _value.hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as HospitalModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinksModelImpl implements _LinksModel {
  const _$LinksModelImpl(
      {this.accountId,
      this.configId,
      this.name,
      this.active,
      this.type,
      this.role,
      this.roleId,
      this.occupation,
      this.employeeNo,
      this.accountToken,
      this.hospitalId,
      this.createdAt,
      this.createdId,
      this.id,
      this.note,
      this.assistPref,
      @JsonKey(name: 'RoleActions') this.roleActions,
      @JsonKey(name: 'Hospitals') this.hospitals});

  factory _$LinksModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinksModelImplFromJson(json);

  @override
  final String? accountId;
  @override
  final String? configId;
  @override
  final String? name;
  @override
  final bool? active;
  @override
  final String? type;
  @override
  final String? role;
  @override
  final String? roleId;
  @override
  final String? occupation;
  @override
  final String? employeeNo;
  @override
  final String? accountToken;
  @override
  final String? hospitalId;
  @override
  final String? createdAt;
  @override
  final String? createdId;
  @override
  final String? id;
  @override
  final String? note;
  @override
  final String? assistPref;
  @override
  @JsonKey(name: 'RoleActions')
  final RoleActionsModel? roleActions;
  @override
  @JsonKey(name: 'Hospitals')
  final HospitalModel? hospitals;

  @override
  String toString() {
    return 'LinksModel(accountId: $accountId, configId: $configId, name: $name, active: $active, type: $type, role: $role, roleId: $roleId, occupation: $occupation, employeeNo: $employeeNo, accountToken: $accountToken, hospitalId: $hospitalId, createdAt: $createdAt, createdId: $createdId, id: $id, note: $note, assistPref: $assistPref, roleActions: $roleActions, hospitals: $hospitals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinksModelImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.configId, configId) ||
                other.configId == configId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.employeeNo, employeeNo) ||
                other.employeeNo == employeeNo) &&
            (identical(other.accountToken, accountToken) ||
                other.accountToken == accountToken) &&
            (identical(other.hospitalId, hospitalId) ||
                other.hospitalId == hospitalId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdId, createdId) ||
                other.createdId == createdId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.assistPref, assistPref) ||
                other.assistPref == assistPref) &&
            (identical(other.roleActions, roleActions) ||
                other.roleActions == roleActions) &&
            (identical(other.hospitals, hospitals) ||
                other.hospitals == hospitals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountId,
      configId,
      name,
      active,
      type,
      role,
      roleId,
      occupation,
      employeeNo,
      accountToken,
      hospitalId,
      createdAt,
      createdId,
      id,
      note,
      assistPref,
      roleActions,
      hospitals);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinksModelImplCopyWith<_$LinksModelImpl> get copyWith =>
      __$$LinksModelImplCopyWithImpl<_$LinksModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinksModelImplToJson(
      this,
    );
  }
}

abstract class _LinksModel implements LinksModel {
  const factory _LinksModel(
          {final String? accountId,
          final String? configId,
          final String? name,
          final bool? active,
          final String? type,
          final String? role,
          final String? roleId,
          final String? occupation,
          final String? employeeNo,
          final String? accountToken,
          final String? hospitalId,
          final String? createdAt,
          final String? createdId,
          final String? id,
          final String? note,
          final String? assistPref,
          @JsonKey(name: 'RoleActions') final RoleActionsModel? roleActions,
          @JsonKey(name: 'Hospitals') final HospitalModel? hospitals}) =
      _$LinksModelImpl;

  factory _LinksModel.fromJson(Map<String, dynamic> json) =
      _$LinksModelImpl.fromJson;

  @override
  String? get accountId;
  @override
  String? get configId;
  @override
  String? get name;
  @override
  bool? get active;
  @override
  String? get type;
  @override
  String? get role;
  @override
  String? get roleId;
  @override
  String? get occupation;
  @override
  String? get employeeNo;
  @override
  String? get accountToken;
  @override
  String? get hospitalId;
  @override
  String? get createdAt;
  @override
  String? get createdId;
  @override
  String? get id;
  @override
  String? get note;
  @override
  String? get assistPref;
  @override
  @JsonKey(name: 'RoleActions')
  RoleActionsModel? get roleActions;
  @override
  @JsonKey(name: 'Hospitals')
  HospitalModel? get hospitals;
  @override
  @JsonKey(ignore: true)
  _$$LinksModelImplCopyWith<_$LinksModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
