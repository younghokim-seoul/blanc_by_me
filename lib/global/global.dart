//Gloabl

import 'package:blanc_f/models/login_res_model.dart';
import 'package:camera/camera.dart';
String SERVER_URL = "https://api.blancbyme.com"; //real server
String API_TOKEN = "Bearer ef5bbdaf841b4d976a9a810e06ab4625cb942b8f91391990f990210bc62b8f90344b9560f80cf1e4a5de66e0ef5b7fd5a4f2e51900dcd75167140bdc18150a05bd7a3b9a6c023fed1e0a83e71532f584fb017997065a96e441d90a84d648cc7ac8ae6804e0f681b95de45f1d63487305a1a4ad0ffc2cdd7872be429bc8feaa76";
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