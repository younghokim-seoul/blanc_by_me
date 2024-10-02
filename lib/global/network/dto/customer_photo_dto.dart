import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_photo_dto.freezed.dart';
part 'customer_photo_dto.g.dart';

@freezed
class CustomerPhotoDto with _$CustomerPhotoDto {
  const factory CustomerPhotoDto({
    required List<PhotoData> data,
  }) = _CustomerPhotoDto;

  factory CustomerPhotoDto.fromJson(List<dynamic> json) {
    List<PhotoData> dataList = json.map((item) => PhotoData.fromJson(item as Map<String, dynamic>)).toList();
    return CustomerPhotoDto(data: dataList);
  }
}


@freezed
class PhotoData with _$PhotoData {
  const factory PhotoData({
    required int id,
    required String url,
    required int width,
    required int height,
    required double size,
    required String provider,
  }) = _PhotoData;

  factory PhotoData.fromJson(Map<String, dynamic> json) => _$PhotoDataFromJson(json);
}