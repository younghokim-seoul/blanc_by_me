import 'package:blanc_f/models/login_res_model.dart';

/**
 * 회원가입
 */
class CustomersResModel {
  Data? data;

  CustomersResModel({this.data});

  CustomersResModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Attributes? attributes;

  Data({this.id, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? createdAt;
  String? updatedAt;
  bool? isBetaTester;

  Attributes({this.createdAt, this.updatedAt, this.isBetaTester});

  Attributes.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    isBetaTester = json['isBetaTester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isBetaTester'] = this.isBetaTester;
    return data;
  }
}
