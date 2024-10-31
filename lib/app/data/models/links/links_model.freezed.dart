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
  @JsonKey(includeToJson: false)
  String? get accountId => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get configId => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get name => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get roleId => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get occupation => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get employeeNo => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get accountToken => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get hospitalId => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get createdId => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get assistPref => throw _privateConstructorUsedError;
  @JsonKey(name: 'RoleActions', includeToJson: false)
  RoleActionsModel? get roleActions => throw _privateConstructorUsedError;
  @JsonKey(name: 'Hospitals', includeToJson: false)
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
      {@JsonKey(includeToJson: false) String? accountId,
      @JsonKey(includeToJson: false) String? configId,
      @JsonKey(includeToJson: false) String? name,
      bool? active,
      String? type,
      String? role,
      @JsonKey(includeToJson: false) String? roleId,
      @JsonKey(includeToJson: false) String? occupation,
      @JsonKey(includeToJson: false) String? employeeNo,
      @JsonKey(includeToJson: false) String? accountToken,
      @JsonKey(includeToJson: false) String? hospitalId,
      @JsonKey(includeToJson: false) String? createdAt,
      @JsonKey(includeToJson: false) String? createdId,
      @JsonKey(includeToJson: false) String? id,
      @JsonKey(includeToJson: false) String? note,
      @JsonKey(includeToJson: false) String? assistPref,
      @JsonKey(name: 'RoleActions', includeToJson: false)
      RoleActionsModel? roleActions,
      @JsonKey(name: 'Hospitals', includeToJson: false)
      HospitalModel? hospitals});

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
      {@JsonKey(includeToJson: false) String? accountId,
      @JsonKey(includeToJson: false) String? configId,
      @JsonKey(includeToJson: false) String? name,
      bool? active,
      String? type,
      String? role,
      @JsonKey(includeToJson: false) String? roleId,
      @JsonKey(includeToJson: false) String? occupation,
      @JsonKey(includeToJson: false) String? employeeNo,
      @JsonKey(includeToJson: false) String? accountToken,
      @JsonKey(includeToJson: false) String? hospitalId,
      @JsonKey(includeToJson: false) String? createdAt,
      @JsonKey(includeToJson: false) String? createdId,
      @JsonKey(includeToJson: false) String? id,
      @JsonKey(includeToJson: false) String? note,
      @JsonKey(includeToJson: false) String? assistPref,
      @JsonKey(name: 'RoleActions', includeToJson: false)
      RoleActionsModel? roleActions,
      @JsonKey(name: 'Hospitals', includeToJson: false)
      HospitalModel? hospitals});

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
      {@JsonKey(includeToJson: false) this.accountId,
      @JsonKey(includeToJson: false) this.configId,
      @JsonKey(includeToJson: false) this.name,
      this.active,
      this.type,
      this.role,
      @JsonKey(includeToJson: false) this.roleId,
      @JsonKey(includeToJson: false) this.occupation,
      @JsonKey(includeToJson: false) this.employeeNo,
      @JsonKey(includeToJson: false) this.accountToken,
      @JsonKey(includeToJson: false) this.hospitalId,
      @JsonKey(includeToJson: false) this.createdAt,
      @JsonKey(includeToJson: false) this.createdId,
      @JsonKey(includeToJson: false) this.id,
      @JsonKey(includeToJson: false) this.note,
      @JsonKey(includeToJson: false) this.assistPref,
      @JsonKey(name: 'RoleActions', includeToJson: false) this.roleActions,
      @JsonKey(name: 'Hospitals', includeToJson: false) this.hospitals});

  factory _$LinksModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinksModelImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String? accountId;
  @override
  @JsonKey(includeToJson: false)
  final String? configId;
  @override
  @JsonKey(includeToJson: false)
  final String? name;
  @override
  final bool? active;
  @override
  final String? type;
  @override
  final String? role;
  @override
  @JsonKey(includeToJson: false)
  final String? roleId;
  @override
  @JsonKey(includeToJson: false)
  final String? occupation;
  @override
  @JsonKey(includeToJson: false)
  final String? employeeNo;
  @override
  @JsonKey(includeToJson: false)
  final String? accountToken;
  @override
  @JsonKey(includeToJson: false)
  final String? hospitalId;
  @override
  @JsonKey(includeToJson: false)
  final String? createdAt;
  @override
  @JsonKey(includeToJson: false)
  final String? createdId;
  @override
  @JsonKey(includeToJson: false)
  final String? id;
  @override
  @JsonKey(includeToJson: false)
  final String? note;
  @override
  @JsonKey(includeToJson: false)
  final String? assistPref;
  @override
  @JsonKey(name: 'RoleActions', includeToJson: false)
  final RoleActionsModel? roleActions;
  @override
  @JsonKey(name: 'Hospitals', includeToJson: false)
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
      {@JsonKey(includeToJson: false) final String? accountId,
      @JsonKey(includeToJson: false) final String? configId,
      @JsonKey(includeToJson: false) final String? name,
      final bool? active,
      final String? type,
      final String? role,
      @JsonKey(includeToJson: false) final String? roleId,
      @JsonKey(includeToJson: false) final String? occupation,
      @JsonKey(includeToJson: false) final String? employeeNo,
      @JsonKey(includeToJson: false) final String? accountToken,
      @JsonKey(includeToJson: false) final String? hospitalId,
      @JsonKey(includeToJson: false) final String? createdAt,
      @JsonKey(includeToJson: false) final String? createdId,
      @JsonKey(includeToJson: false) final String? id,
      @JsonKey(includeToJson: false) final String? note,
      @JsonKey(includeToJson: false) final String? assistPref,
      @JsonKey(name: 'RoleActions', includeToJson: false)
      final RoleActionsModel? roleActions,
      @JsonKey(name: 'Hospitals', includeToJson: false)
      final HospitalModel? hospitals}) = _$LinksModelImpl;

  factory _LinksModel.fromJson(Map<String, dynamic> json) =
      _$LinksModelImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String? get accountId;
  @override
  @JsonKey(includeToJson: false)
  String? get configId;
  @override
  @JsonKey(includeToJson: false)
  String? get name;
  @override
  bool? get active;
  @override
  String? get type;
  @override
  String? get role;
  @override
  @JsonKey(includeToJson: false)
  String? get roleId;
  @override
  @JsonKey(includeToJson: false)
  String? get occupation;
  @override
  @JsonKey(includeToJson: false)
  String? get employeeNo;
  @override
  @JsonKey(includeToJson: false)
  String? get accountToken;
  @override
  @JsonKey(includeToJson: false)
  String? get hospitalId;
  @override
  @JsonKey(includeToJson: false)
  String? get createdAt;
  @override
  @JsonKey(includeToJson: false)
  String? get createdId;
  @override
  @JsonKey(includeToJson: false)
  String? get id;
  @override
  @JsonKey(includeToJson: false)
  String? get note;
  @override
  @JsonKey(includeToJson: false)
  String? get assistPref;
  @override
  @JsonKey(name: 'RoleActions', includeToJson: false)
  RoleActionsModel? get roleActions;
  @override
  @JsonKey(name: 'Hospitals', includeToJson: false)
  HospitalModel? get hospitals;
  @override
  @JsonKey(ignore: true)
  _$$LinksModelImplCopyWith<_$LinksModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
