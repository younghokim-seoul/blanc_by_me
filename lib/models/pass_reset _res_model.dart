import 'package:blanc_f/models/login_res_model.dart';

/**
 * 비밀번호 재설정 이메일 보내기
 */
class PassResetResModel {
  bool? ok;

  PassResetResModel({this.ok});

  PassResetResModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    return data;
  }
}