// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BillingModel _$BillingModelFromJson(Map<String, dynamic> json) {
  return _BillingModel.fromJson(json);
}

/// @nodoc
mixin _$BillingModel {
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'redirect_url')
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillingModelCopyWith<BillingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillingModelCopyWith<$Res> {
  factory $BillingModelCopyWith(
          BillingModel value, $Res Function(BillingModel) then) =
      _$BillingModelCopyWithImpl<$Res, BillingModel>;
  @useResult
  $Res call({String? token, @JsonKey(name: 'redirect_url') String? url});
}

/// @nodoc
class _$BillingModelCopyWithImpl<$Res, $Val extends BillingModel>
    implements $BillingModelCopyWith<$Res> {
  _$BillingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillingModelImplCopyWith<$Res>
    implements $BillingModelCopyWith<$Res> {
  factory _$$BillingModelImplCopyWith(
          _$BillingModelImpl value, $Res Function(_$BillingModelImpl) then) =
      __$$BillingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token, @JsonKey(name: 'redirect_url') String? url});
}

/// @nodoc
class __$$BillingModelImplCopyWithImpl<$Res>
    extends _$BillingModelCopyWithImpl<$Res, _$BillingModelImpl>
    implements _$$BillingModelImplCopyWith<$Res> {
  __$$BillingModelImplCopyWithImpl(
      _$BillingModelImpl _value, $Res Function(_$BillingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? url = freezed,
  }) {
    return _then(_$BillingModelImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillingModelImpl with DiagnosticableTreeMixin implements _BillingModel {
  const _$BillingModelImpl(
      {required this.token, @JsonKey(name: 'redirect_url') required this.url});

  factory _$BillingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillingModelImplFromJson(json);

  @override
  final String? token;
  @override
  @JsonKey(name: 'redirect_url')
  final String? url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BillingModel(token: $token, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BillingModel'))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillingModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillingModelImplCopyWith<_$BillingModelImpl> get copyWith =>
      __$$BillingModelImplCopyWithImpl<_$BillingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillingModelImplToJson(
      this,
    );
  }
}

abstract class _BillingModel implements BillingModel {
  const factory _BillingModel(
          {required final String? token,
          @JsonKey(name: 'redirect_url') required final String? url}) =
      _$BillingModelImpl;

  factory _BillingModel.fromJson(Map<String, dynamic> json) =
      _$BillingModelImpl.fromJson;

  @override
  String? get token;
  @override
  @JsonKey(name: 'redirect_url')
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$BillingModelImplCopyWith<_$BillingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
