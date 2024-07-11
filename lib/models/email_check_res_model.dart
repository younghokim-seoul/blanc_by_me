import 'package:blanc_f/models/login_res_model.dart';

/**
 * 이메일 중복체크
 */
class EmailCheckResModel {
  List<UserDto>? data;

  EmailCheckResModel(
      {this.data});

  EmailCheckResModel.fromJson(List<dynamic> json) {
    data = <UserDto>[];
    if (json.isNotEmpty) {
      for (var v in json) {
        data!.add(UserDto.fromJson(v));
      }
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data[''] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
