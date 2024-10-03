import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_ai_request.freezed.dart';
part 'photo_ai_request.g.dart';

@freezed
class PhotoAiRequest with _$PhotoAiRequest {
  const factory PhotoAiRequest({
    required AiRequestData data,
  }) = _PhotoAiRequest;

  factory PhotoAiRequest.fromJson(Map<String, dynamic> json) =>
      _$PhotoAiRequestFromJson(json);
}

@freezed
class AiRequestData with _$AiRequestData {
  const factory AiRequestData({
    required int clinicCustomer,
    required String device,
    required int toothImage,
  }) = _AiRequestData;

  factory AiRequestData.fromJson(Map<String, dynamic> json) =>
      _$AiRequestDataFromJson(json);
}
