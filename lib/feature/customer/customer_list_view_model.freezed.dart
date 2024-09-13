// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerListViewModelState {
  List<String> get list => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isEndOfList => throw _privateConstructorUsedError;
  bool get isClinicId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerListViewModelStateCopyWith<CustomerListViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerListViewModelStateCopyWith<$Res> {
  factory $CustomerListViewModelStateCopyWith(CustomerListViewModelState value,
          $Res Function(CustomerListViewModelState) then) =
      _$CustomerListViewModelStateCopyWithImpl<$Res,
          CustomerListViewModelState>;
  @useResult
  $Res call(
      {List<String> list, bool isLoading, bool isEndOfList, bool isClinicId});
}

/// @nodoc
class _$CustomerListViewModelStateCopyWithImpl<$Res,
        $Val extends CustomerListViewModelState>
    implements $CustomerListViewModelStateCopyWith<$Res> {
  _$CustomerListViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? isLoading = null,
    Object? isEndOfList = null,
    Object? isClinicId = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEndOfList: null == isEndOfList
          ? _value.isEndOfList
          : isEndOfList // ignore: cast_nullable_to_non_nullable
              as bool,
      isClinicId: null == isClinicId
          ? _value.isClinicId
          : isClinicId // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerListViewModelStateImplCopyWith<$Res>
    implements $CustomerListViewModelStateCopyWith<$Res> {
  factory _$$CustomerListViewModelStateImplCopyWith(
          _$CustomerListViewModelStateImpl value,
          $Res Function(_$CustomerListViewModelStateImpl) then) =
      __$$CustomerListViewModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> list, bool isLoading, bool isEndOfList, bool isClinicId});
}

/// @nodoc
class __$$CustomerListViewModelStateImplCopyWithImpl<$Res>
    extends _$CustomerListViewModelStateCopyWithImpl<$Res,
        _$CustomerListViewModelStateImpl>
    implements _$$CustomerListViewModelStateImplCopyWith<$Res> {
  __$$CustomerListViewModelStateImplCopyWithImpl(
      _$CustomerListViewModelStateImpl _value,
      $Res Function(_$CustomerListViewModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? isLoading = null,
    Object? isEndOfList = null,
    Object? isClinicId = null,
  }) {
    return _then(_$CustomerListViewModelStateImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEndOfList: null == isEndOfList
          ? _value.isEndOfList
          : isEndOfList // ignore: cast_nullable_to_non_nullable
              as bool,
      isClinicId: null == isClinicId
          ? _value.isClinicId
          : isClinicId // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CustomerListViewModelStateImpl implements _CustomerListViewModelState {
  _$CustomerListViewModelStateImpl(
      {required final List<String> list,
      required this.isLoading,
      required this.isEndOfList,
      required this.isClinicId})
      : _list = list;

  final List<String> _list;
  @override
  List<String> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final bool isLoading;
  @override
  final bool isEndOfList;
  @override
  final bool isClinicId;

  @override
  String toString() {
    return 'CustomerListViewModelState(list: $list, isLoading: $isLoading, isEndOfList: $isEndOfList, isClinicId: $isClinicId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerListViewModelStateImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isEndOfList, isEndOfList) ||
                other.isEndOfList == isEndOfList) &&
            (identical(other.isClinicId, isClinicId) ||
                other.isClinicId == isClinicId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      isLoading,
      isEndOfList,
      isClinicId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerListViewModelStateImplCopyWith<_$CustomerListViewModelStateImpl>
      get copyWith => __$$CustomerListViewModelStateImplCopyWithImpl<
          _$CustomerListViewModelStateImpl>(this, _$identity);
}

abstract class _CustomerListViewModelState
    implements CustomerListViewModelState {
  factory _CustomerListViewModelState(
      {required final List<String> list,
      required final bool isLoading,
      required final bool isEndOfList,
      required final bool isClinicId}) = _$CustomerListViewModelStateImpl;

  @override
  List<String> get list;
  @override
  bool get isLoading;
  @override
  bool get isEndOfList;
  @override
  bool get isClinicId;
  @override
  @JsonKey(ignore: true)
  _$$CustomerListViewModelStateImplCopyWith<_$CustomerListViewModelStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
