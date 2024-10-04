// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clinic_user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClinicUserInfo _$ClinicUserInfoFromJson(Map<String, dynamic> json) {
  return _ClinicUserInfo.fromJson(json);
}

/// @nodoc
mixin _$ClinicUserInfo {
  int get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  String get confirmed => throw _privateConstructorUsedError;
  String get blocked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClinicUserInfoCopyWith<ClinicUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicUserInfoCopyWith<$Res> {
  factory $ClinicUserInfoCopyWith(
          ClinicUserInfo value, $Res Function(ClinicUserInfo) then) =
      _$ClinicUserInfoCopyWithImpl<$Res, ClinicUserInfo>;
  @useResult
  $Res call(
      {int id,
      String userName,
      String email,
      String provider,
      String confirmed,
      String blocked});
}

/// @nodoc
class _$ClinicUserInfoCopyWithImpl<$Res, $Val extends ClinicUserInfo>
    implements $ClinicUserInfoCopyWith<$Res> {
  _$ClinicUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? email = null,
    Object? provider = null,
    Object? confirmed = null,
    Object? blocked = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      confirmed: null == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as String,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClinicUserInfoImplCopyWith<$Res>
    implements $ClinicUserInfoCopyWith<$Res> {
  factory _$$ClinicUserInfoImplCopyWith(_$ClinicUserInfoImpl value,
          $Res Function(_$ClinicUserInfoImpl) then) =
      __$$ClinicUserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String userName,
      String email,
      String provider,
      String confirmed,
      String blocked});
}

/// @nodoc
class __$$ClinicUserInfoImplCopyWithImpl<$Res>
    extends _$ClinicUserInfoCopyWithImpl<$Res, _$ClinicUserInfoImpl>
    implements _$$ClinicUserInfoImplCopyWith<$Res> {
  __$$ClinicUserInfoImplCopyWithImpl(
      _$ClinicUserInfoImpl _value, $Res Function(_$ClinicUserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? email = null,
    Object? provider = null,
    Object? confirmed = null,
    Object? blocked = null,
  }) {
    return _then(_$ClinicUserInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      confirmed: null == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as String,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicUserInfoImpl implements _ClinicUserInfo {
  const _$ClinicUserInfoImpl(
      {required this.id,
      required this.userName,
      required this.email,
      required this.provider,
      required this.confirmed,
      required this.blocked});

  factory _$ClinicUserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicUserInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String userName;
  @override
  final String email;
  @override
  final String provider;
  @override
  final String confirmed;
  @override
  final String blocked;

  @override
  String toString() {
    return 'ClinicUserInfo(id: $id, userName: $userName, email: $email, provider: $provider, confirmed: $confirmed, blocked: $blocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicUserInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.confirmed, confirmed) ||
                other.confirmed == confirmed) &&
            (identical(other.blocked, blocked) || other.blocked == blocked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userName, email, provider, confirmed, blocked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicUserInfoImplCopyWith<_$ClinicUserInfoImpl> get copyWith =>
      __$$ClinicUserInfoImplCopyWithImpl<_$ClinicUserInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicUserInfoImplToJson(
      this,
    );
  }
}

abstract class _ClinicUserInfo implements ClinicUserInfo {
  const factory _ClinicUserInfo(
      {required final int id,
      required final String userName,
      required final String email,
      required final String provider,
      required final String confirmed,
      required final String blocked}) = _$ClinicUserInfoImpl;

  factory _ClinicUserInfo.fromJson(Map<String, dynamic> json) =
      _$ClinicUserInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get userName;
  @override
  String get email;
  @override
  String get provider;
  @override
  String get confirmed;
  @override
  String get blocked;
  @override
  @JsonKey(ignore: true)
  _$$ClinicUserInfoImplCopyWith<_$ClinicUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
