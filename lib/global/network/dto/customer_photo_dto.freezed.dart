// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_photo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerPhotoDto {
  List<PhotoData> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerPhotoDtoCopyWith<CustomerPhotoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPhotoDtoCopyWith<$Res> {
  factory $CustomerPhotoDtoCopyWith(
          CustomerPhotoDto value, $Res Function(CustomerPhotoDto) then) =
      _$CustomerPhotoDtoCopyWithImpl<$Res, CustomerPhotoDto>;
  @useResult
  $Res call({List<PhotoData> data});
}

/// @nodoc
class _$CustomerPhotoDtoCopyWithImpl<$Res, $Val extends CustomerPhotoDto>
    implements $CustomerPhotoDtoCopyWith<$Res> {
  _$CustomerPhotoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PhotoData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerPhotoDtoImplCopyWith<$Res>
    implements $CustomerPhotoDtoCopyWith<$Res> {
  factory _$$CustomerPhotoDtoImplCopyWith(_$CustomerPhotoDtoImpl value,
          $Res Function(_$CustomerPhotoDtoImpl) then) =
      __$$CustomerPhotoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PhotoData> data});
}

/// @nodoc
class __$$CustomerPhotoDtoImplCopyWithImpl<$Res>
    extends _$CustomerPhotoDtoCopyWithImpl<$Res, _$CustomerPhotoDtoImpl>
    implements _$$CustomerPhotoDtoImplCopyWith<$Res> {
  __$$CustomerPhotoDtoImplCopyWithImpl(_$CustomerPhotoDtoImpl _value,
      $Res Function(_$CustomerPhotoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CustomerPhotoDtoImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PhotoData>,
    ));
  }
}

/// @nodoc

class _$CustomerPhotoDtoImpl implements _CustomerPhotoDto {
  const _$CustomerPhotoDtoImpl({required final List<PhotoData> data})
      : _data = data;

  final List<PhotoData> _data;
  @override
  List<PhotoData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CustomerPhotoDto(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPhotoDtoImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPhotoDtoImplCopyWith<_$CustomerPhotoDtoImpl> get copyWith =>
      __$$CustomerPhotoDtoImplCopyWithImpl<_$CustomerPhotoDtoImpl>(
          this, _$identity);
}

abstract class _CustomerPhotoDto implements CustomerPhotoDto {
  const factory _CustomerPhotoDto({required final List<PhotoData> data}) =
      _$CustomerPhotoDtoImpl;

  @override
  List<PhotoData> get data;
  @override
  @JsonKey(ignore: true)
  _$$CustomerPhotoDtoImplCopyWith<_$CustomerPhotoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhotoData _$PhotoDataFromJson(Map<String, dynamic> json) {
  return _PhotoData.fromJson(json);
}

/// @nodoc
mixin _$PhotoData {
  int get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoDataCopyWith<PhotoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoDataCopyWith<$Res> {
  factory $PhotoDataCopyWith(PhotoData value, $Res Function(PhotoData) then) =
      _$PhotoDataCopyWithImpl<$Res, PhotoData>;
  @useResult
  $Res call(
      {int id,
      String url,
      int width,
      int height,
      double size,
      String provider});
}

/// @nodoc
class _$PhotoDataCopyWithImpl<$Res, $Val extends PhotoData>
    implements $PhotoDataCopyWith<$Res> {
  _$PhotoDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? width = null,
    Object? height = null,
    Object? size = null,
    Object? provider = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoDataImplCopyWith<$Res>
    implements $PhotoDataCopyWith<$Res> {
  factory _$$PhotoDataImplCopyWith(
          _$PhotoDataImpl value, $Res Function(_$PhotoDataImpl) then) =
      __$$PhotoDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String url,
      int width,
      int height,
      double size,
      String provider});
}

/// @nodoc
class __$$PhotoDataImplCopyWithImpl<$Res>
    extends _$PhotoDataCopyWithImpl<$Res, _$PhotoDataImpl>
    implements _$$PhotoDataImplCopyWith<$Res> {
  __$$PhotoDataImplCopyWithImpl(
      _$PhotoDataImpl _value, $Res Function(_$PhotoDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? width = null,
    Object? height = null,
    Object? size = null,
    Object? provider = null,
  }) {
    return _then(_$PhotoDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoDataImpl implements _PhotoData {
  const _$PhotoDataImpl(
      {required this.id,
      required this.url,
      required this.width,
      required this.height,
      required this.size,
      required this.provider});

  factory _$PhotoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoDataImplFromJson(json);

  @override
  final int id;
  @override
  final String url;
  @override
  final int width;
  @override
  final int height;
  @override
  final double size;
  @override
  final String provider;

  @override
  String toString() {
    return 'PhotoData(id: $id, url: $url, width: $width, height: $height, size: $size, provider: $provider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, url, width, height, size, provider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoDataImplCopyWith<_$PhotoDataImpl> get copyWith =>
      __$$PhotoDataImplCopyWithImpl<_$PhotoDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoDataImplToJson(
      this,
    );
  }
}

abstract class _PhotoData implements PhotoData {
  const factory _PhotoData(
      {required final int id,
      required final String url,
      required final int width,
      required final int height,
      required final double size,
      required final String provider}) = _$PhotoDataImpl;

  factory _PhotoData.fromJson(Map<String, dynamic> json) =
      _$PhotoDataImpl.fromJson;

  @override
  int get id;
  @override
  String get url;
  @override
  int get width;
  @override
  int get height;
  @override
  double get size;
  @override
  String get provider;
  @override
  @JsonKey(ignore: true)
  _$$PhotoDataImplCopyWith<_$PhotoDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
