// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_id_reange.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerIdReange {
  int get pageKey => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerIdReangeCopyWith<CustomerIdReange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerIdReangeCopyWith<$Res> {
  factory $CustomerIdReangeCopyWith(
          CustomerIdReange value, $Res Function(CustomerIdReange) then) =
      _$CustomerIdReangeCopyWithImpl<$Res, CustomerIdReange>;
  @useResult
  $Res call({int pageKey, int pageSize});
}

/// @nodoc
class _$CustomerIdReangeCopyWithImpl<$Res, $Val extends CustomerIdReange>
    implements $CustomerIdReangeCopyWith<$Res> {
  _$CustomerIdReangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageKey = null,
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      pageKey: null == pageKey
          ? _value.pageKey
          : pageKey // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerIdReangeImplCopyWith<$Res>
    implements $CustomerIdReangeCopyWith<$Res> {
  factory _$$CustomerIdReangeImplCopyWith(_$CustomerIdReangeImpl value,
          $Res Function(_$CustomerIdReangeImpl) then) =
      __$$CustomerIdReangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageKey, int pageSize});
}

/// @nodoc
class __$$CustomerIdReangeImplCopyWithImpl<$Res>
    extends _$CustomerIdReangeCopyWithImpl<$Res, _$CustomerIdReangeImpl>
    implements _$$CustomerIdReangeImplCopyWith<$Res> {
  __$$CustomerIdReangeImplCopyWithImpl(_$CustomerIdReangeImpl _value,
      $Res Function(_$CustomerIdReangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageKey = null,
    Object? pageSize = null,
  }) {
    return _then(_$CustomerIdReangeImpl(
      pageKey: null == pageKey
          ? _value.pageKey
          : pageKey // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CustomerIdReangeImpl implements _CustomerIdReange {
  const _$CustomerIdReangeImpl({required this.pageKey, required this.pageSize});

  @override
  final int pageKey;
  @override
  final int pageSize;

  @override
  String toString() {
    return 'CustomerIdReange(pageKey: $pageKey, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerIdReangeImpl &&
            (identical(other.pageKey, pageKey) || other.pageKey == pageKey) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageKey, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerIdReangeImplCopyWith<_$CustomerIdReangeImpl> get copyWith =>
      __$$CustomerIdReangeImplCopyWithImpl<_$CustomerIdReangeImpl>(
          this, _$identity);
}

abstract class _CustomerIdReange implements CustomerIdReange {
  const factory _CustomerIdReange(
      {required final int pageKey,
      required final int pageSize}) = _$CustomerIdReangeImpl;

  @override
  int get pageKey;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$CustomerIdReangeImplCopyWith<_$CustomerIdReangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
