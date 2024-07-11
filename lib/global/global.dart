//Gloabl

import 'package:blanc_f/models/login_res_model.dart';
import 'package:camera/camera.dart';
String SERVER_URL = "https://api.blancbyme.com"; //real server
String API_TOKEN = "Bearer 3da1ac61828ed59821e307bcabb09372877ae0cfec1c0d96e7cdc4352a7f538c155264bb2da2cd3bf122f33f72e61d98fce65dfe2e17769dc42830f81cd6fa24f46489eb76f9f8f4153e4e1c55063a7b3285e69194fc257651a04c058e02e3b1425471bc02ddfd9f63e822771d606d87ad148e82c085328e7438664a108cc566";
String SERVICE_PAGE = "https://blancbyme.com/auth/login";
String TERMS_URL = "https://blancbyme.com/terms-polices?id=serviceTerms"; //이용약관
String POLICY_URL = "https://blancbyme.com/terms-polices?id=informationAgreement"; //개인정보 처리방침
String PHOTO_UPLOAD_PAGE = "https://www.blancbyme.com/ai-curation"; //사진업로드 페이지
String ADDRESS_SEARCH_PAGE = "https://blancbyme.com/assets/html/postcode.html"; //주소검색 페이지
String DANAL_PAGE = "https://blancbyme.com/assets/html/identityVerification.html"; //본인인증

bool isReview = false; //true : 심시가간
String reviewDate = "2024-05-21"; //심사날짜
List<CameraDescription> gCameras = [];
String gJwt = "";
UserDto? gMyInfo;