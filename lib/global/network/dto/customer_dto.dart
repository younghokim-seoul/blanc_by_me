import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_dto.freezed.dart';
part 'customer_dto.g.dart';

@freezed
class CustomerRootData with _$CustomerRootData {
  const factory CustomerRootData({
    required List<CustomerData> data,
    required MetaData meta,
  }) = _CustomerRootData;

  factory CustomerRootData.fromJson(Map<String, dynamic> json) => _$CustomerRootDataFromJson(json);
}

@freezed
class CustomerData with _$CustomerData {
  const factory CustomerData({
    required int id,
    required AttributesData attributes,
  }) = _CustomerData;

  factory CustomerData.fromJson(Map<String, dynamic> json) => _$CustomerDataFromJson(json);
}


@freezed
class AttributesData with _$AttributesData {
  const factory AttributesData({
    required String identifier,
    required String name,
    required String birthDay,
    required String? createdAt,
    required String? updatedAt,
  }) = _AttributesData;

  factory AttributesData.fromJson(Map<String, dynamic> json) => _$AttributesDataFromJson(json);
}


@freezed
class MetaData with _$MetaData {
  const factory MetaData({
    required PaginationData pagination,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, dynamic> json) => _$MetaDataFromJson(json);
}

@freezed
class PaginationData with _$PaginationData {
  const factory PaginationData({
    required int start,
    required int limit,
    required int total,
  }) = _PaginationData;

  factory PaginationData.fromJson(Map<String, dynamic> json) => _$PaginationDataFromJson(json);
}
