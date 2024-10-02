import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinic_user.freezed.dart';
part 'clinic_user.g.dart';

@freezed
class ClinicUser with _$ClinicUser {
  const factory ClinicUser({
    required String email,
    required String password,
    required String clinicName,
    required String phone,
    required String address,
    required String address2,
    required bool privacyPolicy,
    required String licenseNumber,
    required String businessNumber,
  }) = _ClinicUser;

  factory ClinicUser.fromJson(Map<String, dynamic> json) => _$ClinicUserFromJson(json);
}
