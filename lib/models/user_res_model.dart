import 'package:blanc_f/models/login_res_model.dart';

/**
 * 회원가입
 */
class UserResModel {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? createdAt;
  String? updatedAt;
  Role? role;

  UserResModel(
      {this.id,
        this.username,
        this.email,
        this.provider,
        this.confirmed,
        this.blocked,
        this.createdAt,
        this.updatedAt,
        this.role});

  UserResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'] ?? "";
    email = json['email'] ?? "";
    provider = json['provider'] ?? "";
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
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
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    return data;
  }
}

class Role {
  int? id;
  String? name;
  String? description;
  String? type;
  String? createdAt;
  String? updatedAt;

  Role(
      {this.id,
        this.name,
        this.description,
        this.type,
        this.createdAt,
        this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? "";
    description = json['description'] ?? "";
    type = json['type'] ?? "";
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
