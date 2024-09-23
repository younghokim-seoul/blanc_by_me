import 'dart:async';
import 'dart:convert';

import 'package:blanc_f/global/global.dart';
import 'package:blanc_f/global/network/dto/clinic_onwer_dto.dart';
import 'package:blanc_f/global/network/dto/customer_dto.dart';
import 'package:blanc_f/global/network/dto/customer_save_request.dart';
import 'package:blanc_f/models/app_update_model.dart';
import 'package:blanc_f/models/customers%20_res_model.dart';
import 'package:blanc_f/models/email_check_res_model.dart';
import 'package:blanc_f/models/login_res_model.dart';
import 'package:blanc_f/models/pass_reset%20_res_model.dart';
import 'package:blanc_f/models/user_res_model.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HttpService {
  //파일 업로드
  Future<String> fileUpload(XFile image) async {
    String _url = "$SERVER_URL/api/upload";

    final mimeTypeData = lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])?.split('/');
    Map<String, String> headers = {
      'Authorization': API_TOKEN,
    };

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String value = "app_tooth_images/AOS_$version";
    Map<String, String> data = {"path": value};

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(_url),
    );
    request.fields.addAll(data);
    request.headers.addAll(headers);
    var multipartFile = await http.MultipartFile.fromPath('files', image.path,
        contentType: MediaType(mimeTypeData![0], mimeTypeData[1]));
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return "success";
    } else {
      // If that call was not successful, throw an error.
      showToast("서버와의 연결이 원할하지 않습니다.");
      throw Exception('서버와의 연결이 원할하지 않습니다.');
    }
  }

  //앱 업데이트 확인
  Future<AppUpdateModel> checkAppUpdate() async {
    final localVersion = await PackageInfo.fromPlatform();
    final os = getDevType();

    print("checkAppUpdate localVersion : $localVersion" " os : $os");

    String _url = "$SERVER_URL/api/app-version?device=$os&version=${localVersion.version}";

    Map<String, String> headers = {
      'Authorization': API_TOKEN,
    };

    Uri uri = Uri.parse(_url);
    print("checkAppUpdate uri : $uri");
    final response = await http.get(uri, headers: headers);

    return AppUpdateModel.fromJson(json.decode(response.body));
  }

  //로그인
  Future<LoginResModel> login(String identifier, String password) async {
    String _url = "$SERVER_URL/api/auth/local";

    Map<String, String> headers = {
      'Authorization': API_TOKEN,
    };

    Map<String, String> body = {
      'identifier': identifier,
      'password': password,
    };
    Uri uri = Uri.parse(_url);
    final response = await http.post(uri, headers: headers, body: body);

    return LoginResModel.fromJson(json.decode(response.body));
  }

  //이메일 중복 확인
  Future<EmailCheckResModel> emailCheck() async {
    String _url = "$SERVER_URL/api/users";

    Map<String, String> headers = {
      'Authorization': API_TOKEN,
    };

    Uri uri = Uri.parse(_url);
    final response = await http.get(uri, headers: headers);

    return EmailCheckResModel.fromJson(json.decode(response.body));
  }

  //회원가입
  Future<UserResModel> user(String username, String email, String password) async {
    String _url = "$SERVER_URL/api/users";

    Map<String, String> headers = {
      'Authorization': API_TOKEN,
    };

    Map<String, String> body = {
      'username': username,
      'email': email,
      'password': password,
      'role': "1",
    };
    Uri uri = Uri.parse(_url);
    final response = await http.post(uri, headers: headers, body: body);

    return UserResModel.fromJson(json.decode(response.body));
  }

  //회원가입2
  Future<CustomersResModel> customers(String _id, String phone, String address, String address2, String gender,
      String birth, String postcode, String identityVerificationId) async {
    String _url = "$SERVER_URL/api/customers";

    Map<String, String> headers = {
      'Authorization': API_TOKEN,
      'Content-Type': "application/json",
    };

    Map<String, dynamic> basicInfo = {
      'phone': phone,
      'address': address,
      'address2': address2,
      'gender': gender,
      'privacyPolicy': true,
      'birth': birth,
      'postcode': postcode,
      'identityVerificationId': identityVerificationId,
    };

    Map<String, dynamic> body = {
      'basicInfo': basicInfo,
      'user': _id,
    };

    Map<String, dynamic> data = {
      'data': body,
    };
    Uri uri = Uri.parse(_url);
    final response = await http.post(uri, headers: headers, body: json.encode(data));

    return CustomersResModel.fromJson(json.decode(response.body));
  }

  //비밀번호 재설정 에미일 보내기
  Future<PassResetResModel> passReset(String email) async {
    String _url = "$SERVER_URL/api/auth/forgot-passowrd";

    Map<String, String> headers = {
      'Authorization': API_TOKEN,
    };

    Map<String, dynamic> body = {
      'email': email,
    };
    Uri uri = Uri.parse(_url);
    final response = await http.post(uri, headers: headers, body: body);

    return PassResetResModel.fromJson(json.decode(response.body));
  }

  Future<ClinicInfoData> fetchClinicData() async {
    String _url = "$SERVER_URL/api/users/me?populate[0]=clinic_onwer&populate[1]=clinic_onwer.clinic";
    Map<String, String> headers = {
      'Authorization': "Bearer $gJwt",
    };
    Uri uri = Uri.parse(_url);
    final response = await http.get(uri, headers: headers);

    return ClinicInfoData.fromJson(json.decode(response.body));
  }

  Future<CustomerRootData> fetchCustomerList({required int clinicId, required int offset}) async {
    String _url =
        "$SERVER_URL/api/clinic-customers?filters[clinic][id][\$clinicId]=$clinicId&filters[name][\$startsWith]=귀&pagination[start]=$offset&pagination[limit]=10";
    Map<String, String> headers = {
      'Authorization': "Bearer $gJwt",
    };
    Uri uri = Uri.parse(_url);
    final response = await http.get(uri, headers: headers);

    return CustomerRootData.fromJson(json.decode(response.body));
  }

  Future<bool> saveCustomer({required int clinicId, required String name, required String birthDay}) async {
    String url = "$SERVER_URL/api/clinic-customers";
    Map<String, String> headers = {
      'Authorization': "Bearer $gJwt",
    };
    Uri uri = Uri.parse(url);
    final response = await http.post(
      uri,
      headers: headers,
      body: CustomerSaveRequest(
        data: CustomerSaveData(
          name: name,
          birthDay: birthDay,
          clinic: clinicId.toString(),
        ),
      ).toJson(),
    );

    return response.statusCode == 200;
  }
}
