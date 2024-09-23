import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_save_request.freezed.dart';
part 'customer_save_request.g.dart';

@freezed
class CustomerSaveRequest with _$CustomerSaveRequest {
  const factory CustomerSaveRequest({
    required CustomerSaveData data,
  }) = _CustomerSaveRequest;

  factory CustomerSaveRequest.fromJson(Map<String, dynamic> json) => _$CustomerSaveRequestFromJson(json);
}

@freezed
class CustomerSaveData with _$CustomerSaveData {
  const factory CustomerSaveData({
    required String name,
    required String birthDay,
    required String clinic,
  }) = _CustomerSaveData;

  factory CustomerSaveData.fromJson(Map<String, dynamic> json) => _$CustomerSaveDataFromJson(json);
}
