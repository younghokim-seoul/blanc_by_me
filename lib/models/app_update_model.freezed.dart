// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUpdateModel _$AppUpdateModelFromJson(Map<String, dynamic> json) {
  return _AppUpdateModel.fromJson(json);
}

/// @nodoc
mixin _$AppUpdateModel {
  String get ios => throw _privateConstructorUsedError;
  String get aos => throw _privateConstructorUsedError;
  bool get shoudAppUpdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUpdateModelCopyWith<AppUpdateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUpdateModelCopyWith<$Res> {
  factory $AppUpdateModelCopyWith(
          AppUpdateModel value, $Res Function(AppUpdateModel) then) =
      _$AppUpdateModelCopyWithImpl<$Res, AppUpdateModel>;
  @useResult
  $Res call({String ios, String aos, bool shoudAppUpdate});
}

/// @nodoc
class _$AppUpdateModelCopyWithImpl<$Res, $Val extends AppUpdateModel>
    implements $AppUpdateModelCopyWith<$Res> {
  _$AppUpdateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ios = null,
    Object? aos = null,
    Object? shoudAppUpdate = null,
  }) {
    return _then(_value.copyWith(
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as String,
      aos: null == aos
          ? _value.aos
          : aos // ignore: cast_nullable_to_non_nullable
              as String,
      shoudAppUpdate: null == shoudAppUpdate
          ? _value.shoudAppUpdate
          : shoudAppUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUpdateModelImplCopyWith<$Res>
    implements $AppUpdateModelCopyWith<$Res> {
  factory _$$AppUpdateModelImplCopyWith(_$AppUpdateModelImpl value,
          $Res Function(_$AppUpdateModelImpl) then) =
      __$$AppUpdateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ios, String aos, bool shoudAppUpdate});
}

/// @nodoc
class __$$AppUpdateModelImplCopyWithImpl<$Res>
    extends _$AppUpdateModelCopyWithImpl<$Res, _$AppUpdateModelImpl>
    implements _$$AppUpdateModelImplCopyWith<$Res> {
  __$$AppUpdateModelImplCopyWithImpl(
      _$AppUpdateModelImpl _value, $Res Function(_$AppUpdateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ios = null,
    Object? aos = null,
    Object? shoudAppUpdate = null,
  }) {
    return _then(_$AppUpdateModelImpl(
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as String,
      aos: null == aos
          ? _value.aos
          : aos // ignore: cast_nullable_to_non_nullable
              as String,
      shoudAppUpdate: null == shoudAppUpdate
          ? _value.shoudAppUpdate
          : shoudAppUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUpdateModelImpl implements _AppUpdateModel {
  _$AppUpdateModelImpl(
      {required this.ios, required this.aos, required this.shoudAppUpdate});

  factory _$AppUpdateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUpdateModelImplFromJson(json);

  @override
  final String ios;
  @override
  final String aos;
  @override
  final bool shoudAppUpdate;

  @override
  String toString() {
    return 'AppUpdateModel(ios: $ios, aos: $aos, shoudAppUpdate: $shoudAppUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUpdateModelImpl &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.aos, aos) || other.aos == aos) &&
            (identical(other.shoudAppUpdate, shoudAppUpdate) ||
                other.shoudAppUpdate == shoudAppUpdate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ios, aos, shoudAppUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUpdateModelImplCopyWith<_$AppUpdateModelImpl> get copyWith =>
      __$$AppUpdateModelImplCopyWithImpl<_$AppUpdateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUpdateModelImplToJson(
      this,
    );
  }
}

abstract class _AppUpdateModel implements AppUpdateModel {
  factory _AppUpdateModel(
      {required final String ios,
      required final String aos,
      required final bool shoudAppUpdate}) = _$AppUpdateModelImpl;

  factory _AppUpdateModel.fromJson(Map<String, dynamic> json) =
      _$AppUpdateModelImpl.fromJson;

  @override
  String get ios;
  @override
  String get aos;
  @override
  bool get shoudAppUpdate;
  @override
  @JsonKey(ignore: true)
  _$$AppUpdateModelImplCopyWith<_$AppUpdateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
