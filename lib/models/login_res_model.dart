/**
 * 로그인 응답
 */
class LoginResModel {
  String? jwt;
  UserDto? user;

  LoginResModel({this.jwt, this.user});

  LoginResModel.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'] ?? "";
    user = json['user'] != null ? new UserDto.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this.jwt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserDto {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? createdAt;
  String? updatedAt;

  UserDto({this.id, this.username, this.email, this.provider, this.confirmed, this.blocked, this.createdAt, this.updatedAt});

  UserDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'] ?? "";
    email = json['email'] ?? "";
    provider = json['provider'] ?? "";
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['provider'] = this.provider;
    data['confirmed'] = this.confirmed;
    data['blocked'] = this.blocked;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
