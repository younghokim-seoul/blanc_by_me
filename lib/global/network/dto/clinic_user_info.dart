import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinic_user_info.freezed.dart';
part 'clinic_user_info.g.dart';

@freezed
class ClinicUserInfo with _$ClinicUserInfo {
  const factory ClinicUserInfo({
    required int id,
    required String userName,
    required String email,
    required String provider,
    required String confirmed,
    required String blocked,
  }) = _ClinicUserInfo;

  factory ClinicUserInfo.fromJson(Map<String, dynamic> json) => _$ClinicUserInfoFromJson(json);
}
