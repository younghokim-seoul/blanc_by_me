import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinic_onwer_dto.freezed.dart';
part 'clinic_onwer_dto.g.dart';

@freezed
class ClinicInfoData with _$ClinicInfoData {
  const factory ClinicInfoData({
    required int id,
    required String? name,
    required String? email,
    required String? provider,
    required bool confirmed,
    required bool blocked,
    required String? createdAt,
    required String? updatedAt,
    required String? deleted,
    @JsonKey(name: 'clinic_onwer')
    required ClinicOnwerData? clinicOwner,
  }) = _ClinicInfoData;

  factory ClinicInfoData.fromJson(Map<String, dynamic> json) => _$ClinicInfoDataFromJson(json);
}

@freezed
class ClinicOnwerData with _$ClinicOnwerData {
  const factory ClinicOnwerData({
    required int id,
    required String? memo,
    required String? createdAt,
    required String? updatedAt,
    @JsonKey(name: 'clinic')
    required ClinicData? clinicData,
  }) = _ClinicOnwerData;

  factory ClinicOnwerData.fromJson(Map<String, dynamic> json) => _$ClinicOnwerDataFromJson(json);
}


@freezed
class ClinicData with _$ClinicData {
  const factory ClinicData({
    required int id,
    required String? name,
    required String? businessNumber,
    required String? taxEmail,
    required String? licenseNumber,
    required String? officePhone,
    required String? address2,
    required String? lat,
    required String? lon,
    required String? createdAt,
    required String? updatedAt,
    required String? postcode,
    required String? address,
  }) = _ClinicData;

  factory ClinicData.fromJson(Map<String, dynamic> json) => _$ClinicDataFromJson(json);
}
