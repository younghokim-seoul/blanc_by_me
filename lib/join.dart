import 'dart:async';

import 'package:blanc_f/base.dart';
import 'package:blanc_f/dialog/dlg_find_addr.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:blanc_f/global/global.dart';
import 'package:blanc_f/global/http_service.dart';
import 'package:blanc_f/global/local_service.dart';
import 'package:blanc_f/global/network/dto/clinic_user.dart';
import 'package:blanc_f/global/network/dto/clinic_user_info.dart';
import 'package:blanc_f/home.dart';
import 'package:blanc_f/models/customers%20_res_model.dart';
import 'package:blanc_f/models/email_check_res_model.dart';
import 'package:blanc_f/models/login_res_model.dart';
import 'package:blanc_f/models/user_res_model.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:blanc_f/util/transition.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher.dart';

/**
 * 회원가입페이지
 */
class JoinPage extends BasePage {
  JoinPage({Key? key}) : super(key: key);

  @override
  JoinPageState createState() {
    JoinPageState state = new JoinPageState();
    setState(state);
    return state;
  }
}

class JoinPageState extends BaseState<JoinPage> {
  bool _isLoading = false;
  final HttpService httpService = HttpService();

  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPwd1 = TextEditingController();
  TextEditingController tecPwd2 = TextEditingController();
  TextEditingController tecName = TextEditingController();
  TextEditingController tecPhone1 = TextEditingController();
  TextEditingController tecPhone2 = TextEditingController();
  TextEditingController tecPhone3 = TextEditingController();
  TextEditingController businessNumber = TextEditingController();
  TextEditingController tecAddress = TextEditingController();
  TextEditingController tecAddressDetail = TextEditingController();
  TextEditingController healthcareFacilityNumber = TextEditingController();

  String strEmail = "";
  String strTempEmail = "";
  bool isCheckEmail = false; //중복여부
  String strPass1 = "";
  String strPass2 = "";
  String strName = "";
  String strPhone1 = "";
  String strPhone2 = "";
  String strPhone3 = "";
  String strHealthcareFacilityNumber = "";
  bool isCertificate = false;

  // String strCode = "";
  String strAddress = "";
  String strAddressDetail = "";
  String strPostCode = "";
  bool isAllSelect = false;
  bool isTerm1 = false;
  bool isTerm2 = false;
  bool isTerm3 = false;
  String impUid = "";

  @override
  BuildContext getContext() {
    return context;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _onBackPressed() async {
    Navigator.of(context).pop();
    return true;
  }

  void goHome() {
    Navigator.pushReplacement(
        context,
        SlideRightTransRoute(
            builder: (context) => HomePage(), settings: RouteSettings()));
  }

  Future<void> _launchUrl(String type) async {
    var _url = Uri.parse(type == "1" ? TERMS_URL : POLICY_URL);
    // if (!await launchUrl(_url)) {
    //   throw Exception('Could not launch $_url');
    // }
    launchUrl(_url);
  }

  void reqJoin() {

    if (strEmail == "") {
      showToast("이메일을 입력해주세요.");
      return;
    }

    if (!isValidEmailFormat(strEmail)) {
      showToast("이메일 형식이 올바르지 않습니다.");
      return;
    }

    if (!isCheckEmail || (isCheckEmail && strEmail != strTempEmail)) {
      showToast("이메일 중복확인 해주세요.");
      return;
    }

    if (strPass1 == "") {
      showToast("비밀번호를 입력해주세요.");
      return;
    }

    if (strPass1.length < 8 || strPass1.length > 16 || !validPwd(strPass1)) {
      showToast("비밀번호는 8~16자리 영문,숫자,특수문자 포함되어야 합니다.");
      return;
    }

    if (strPass1 != strPass2) {
      showToast("비밀번호가 일치하지 않습니다.");
      return;
    }

    if (strName == "") {
      showToast("이름을 입력해주세요.");
      return;
    }

    if (strPhone1 == "" || strPhone2 == "" || strPhone3 == "") {
      showToast("연락처를 입력해주세요.");
      return;
    }

    String phone = strPhone1 + strPhone2 + strPhone3;
    if (phone.length < 11) {
      showToast("연락처는 11자리 이어야 합니다.");
      return;
    }

    if (!isCertificate) {
      showToast("사업자 번호 인증해주세요.");
      return;
    }

    if (strAddress == "" || strAddressDetail == "") {
      showToast("주소를 입력해주세요.");
      return;
    }

    if (isAllSelect == false) {
      showToast("약관에 동의 해주세요.");
      return;
    }
    reqPostUser();
  }

  void getUsers() {
    if (strEmail == "") {
      showToast("이메일을 입력해주세요.");
      return;
    }

    if (!isValidEmailFormat(strEmail)) {
      showToast("이메일 형식이 올바르지 않습니다.");
      return;
    }
    setState(() {
      _isLoading = true;
    });
    Future<EmailCheckResModel> loginInfo = httpService.emailCheck();
    loginInfo.then((EmailCheckResModel value) {
      setState(() {
        _isLoading = false;
      });
      if (value.data!.isNotEmpty) {
        bool isCheck = false;
        for (var i = 0; i < value.data!.length; i++) {
          UserDto dic = value.data!.elementAt(i);
          if (strEmail == dic.email) {
            isCheck = true;
            break;
          }
        }
        if (isCheck) {
          showToast("이미 사용중인 이메일 입니다.");
          isCheckEmail = false;
          strTempEmail = "";
        } else {
          showToast("사용가능한 이메일 입니다.");
          isCheckEmail = true;
          strTempEmail = strEmail;
        }
        setState(() {});
      } else {
        showToast("사용가능한 이메일 입니다.");
        isCheckEmail = true;
        strTempEmail = strEmail;
        setState(() {});
      }
    }).catchError((onError) {
      setState(() {
        _isLoading = false;
      });
      showToast(onError);
    });
  }

  void reqPostUser() {
    setState(() {
      _isLoading = true;
    });

    final clinicUser = ClinicUser(
        email: strEmail,
        password: strPass1,
        clinicName: strName,
        phone: strPhone1 + strPhone2 + strPhone3,
        address: strAddress,
        address2: strAddressDetail,
        privacyPolicy: true,
        licenseNumber: strHealthcareFacilityNumber,
        businessNumber: businessNumber.text);

    Future<ClinicUserInfo> info = httpService.joinClinic(clinicUser);

    info.then((ClinicUserInfo value) {
      setState(() {
        _isLoading = false;
      });

      if(value.id > 0){
        showToast("회원가입 완료되었습니다.");
        reqLogin();
      }else{
        showToast("회원가입에 실패하였습니다.");
      }


    }).catchError((onError) {
      setState(() {
        _isLoading = false;
      });
      showToast(onError);
    });
  }

  void reqPostCustomers(int _id) {
    setState(() {
      _isLoading = true;
    });
    String phone = strPhone1 + strPhone2 + strPhone3;
    // Future<CustomersResModel> info = httpService.customers(_id.toString(), phone, strAddress, strAddressDetail, strPostCode, impUid);
    // info.then((CustomersResModel value) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   if (value.data!.id! > 0) {
    //     showToast("회원가입 완료되었습니다.");
    //     // _onBackPressed();
    //     reqLogin();
    //   } else {
    //     showToast("회원가입 실패했습니다.");
    //   }
    // }).catchError((onError) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   showToast(onError);
    // });
  }

  void reqLogin() {
    setState(() {
      _isLoading = true;
    });
    Future<LoginResModel> loginInfo = httpService.login(strEmail, strPass1);
    loginInfo.then((LoginResModel value) {
      setState(() {
        _isLoading = false;
      });
      if (value.jwt != "") {
        LocalService.setUserEmail(strEmail);
        LocalService.setUserPwd(strPass1);

        gMyInfo = value.user;
        gJwt = value.jwt!;
        goHome();
      } else {
        showToast("로그인 실패했습니다.");
      }
    }).catchError((onError) {
      setState(() {
        _isLoading = false;
      });
      showToast(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Container(
          color: PrimaryColor,
          child: Scaffold(
            body: SafeArea(
              bottom: false,
              child: ModalProgressHUD(
                inAsyncCall: _isLoading,
                child: Container(
                  color: Colors.white, //하단된 포함된 백그라운드
                  child: InkWell(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: SafeArea(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white, //기본 화면 백그라운드
                        //높이 50 헤더 - PrimaryColor
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                _onBackPressed();
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: SizedBox(
                                  height: 44,
                                  child: Image.asset(
                                    "assets/btn_back.png",
                                    width: 32,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 24),
                                      ),
                                      const Text(
                                        "회원가입",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF212529),
                                        ),
                                      ),
                                      const Gap(40),
                                      const Text(
                                        "이메일",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF212529),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        height: 56,
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1, //
                                                      color: Color(0xFFDDDDDD),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: TextField(
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    style: new TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    controller: tecEmail,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            '이메일을 입력해주세요.',
                                                        border:
                                                            InputBorder.none,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                bottom: 5)),
                                                    onChanged: (text) {
                                                      strEmail = text;
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                getUsers();
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 8),
                                                width: 111,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: isValidEmailFormat(
                                                            strEmail)
                                                        ? Color(0xFF5BD2C4)
                                                        : Color(0xFFEFEFEF),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Center(
                                                  child: Text(
                                                    "중복확인",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: "Pretendard",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: isValidEmailFormat(
                                                              strEmail)
                                                          ? Colors.white
                                                          : Color(0xFFA9A9A9),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 24),
                                      ),
                                      const Text(
                                        "비밀번호",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF212529),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        height: 56,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1, //
                                              color: Color(0xFFDDDDDD),
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: new TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400),
                                            controller: tecPwd1,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                hintText:
                                                    '8~16자리 영문,숫자,특수문자 포함',
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 5)),
                                            onChanged: (text) {
                                              strPass1 = text;
                                            },
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 24),
                                      ),
                                      const Text(
                                        "비밀번호 확인",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF212529),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        height: 56,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1, //
                                              color: Color(0xFFDDDDDD),
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: new TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400),
                                            controller: tecPwd2,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                hintText: '비밀번호를 다시 입력해주세요',
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 5)),
                                            onChanged: (text) {
                                              strPass2 = text;
                                            },
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 24),
                                      ),
                                      const Text(
                                        "치과명",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF212529),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        height: 56,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 1, //
                                              color: Color(0xFFDDDDDD),
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: TextField(
                                            style: new TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400),
                                            controller: tecName,
                                            decoration: InputDecoration(
                                                hintText: '치과명을 입력해주세요',
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 5)),
                                            onChanged: (text) {
                                              strName = text;
                                            },
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 24),
                                      ),
                                      const Text(
                                        "연락처",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF212529),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        height: 56,
                                        margin: const EdgeInsets.only(top: 8),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 8),
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      32 -
                                                      46) /
                                                  3,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    width: 1, //
                                                    color: Color(0xFFDDDDDD),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8))),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: TextField(
                                                  style: new TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  controller: tecPhone1,
                                                  maxLength: 3,
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                      hintText: '010',
                                                      border: InputBorder.none,
                                                      counterText: "",
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              bottom: 5)),
                                                  onChanged: (text) {
                                                    strPhone1 = text;
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 23,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: const Center(
                                                child: Text(
                                                  "-",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "Pretendard",
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF212529),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 8),
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      32 -
                                                      46) /
                                                  3,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    width: 1, //
                                                    color: Color(0xFFDDDDDD),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8))),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: TextField(
                                                  style: new TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  controller: tecPhone2,
                                                  maxLength: 4,
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                      hintText: '0000',
                                                      border: InputBorder.none,
                                                      counterText: "",
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              bottom: 5)),
                                                  onChanged: (text) {
                                                    strPhone2 = text;
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 23,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              child: const Center(
                                                child: Text(
                                                  "-",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "Pretendard",
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF212529),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 8),
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      32 -
                                                      46) /
                                                  3,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    width: 1, //
                                                    color: Color(0xFFDDDDDD),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8))),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: TextField(
                                                  style: new TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  controller: tecPhone3,
                                                  maxLength: 4,
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                      hintText: '0000',
                                                      border: InputBorder.none,
                                                      counterText: "",
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              bottom: 5)),
                                                  onChanged: (text) {
                                                    strPhone3 = text;
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 24),
                                      ),
                                      const Text(
                                        "주소",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF212529),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        height: 56,
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1, //
                                                      color: Color(0xFFDDDDDD),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: TextField(
                                                    style: new TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    controller: tecAddress,
                                                    enabled: false,
                                                    decoration: InputDecoration(
                                                        hintText: '.',
                                                        border:
                                                            InputBorder.none,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                bottom: 5)),
                                                    onChanged: (text) {
                                                      //
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                var result = await showDialog(
                                                    context: context,
                                                    builder: (_) =>
                                                        FindAddrDialog());
                                                if (result != null) {
                                                  Map myData = result;
                                                  String status =
                                                      myData["result"];
                                                  if (status == "success") {
                                                    strAddress =
                                                        myData["address"];
                                                    strPostCode =
                                                        myData["postcode"];
                                                    tecAddress.text =
                                                        strAddress;
                                                    setState(() {});
                                                  }
                                                }
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 8),
                                                width: 111,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFF5BD2C4),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: const Center(
                                                  child: Text(
                                                    "주소검색",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: "Pretendard",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        height: 56,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1, //
                                              color: Color(0xFFDDDDDD),
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: TextField(
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400),
                                            controller: tecAddressDetail,
                                            decoration: const InputDecoration(
                                                hintText: '상세주소를 입력해주세요',
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 5)),
                                            onChanged: (text) {
                                              strAddressDetail = text;
                                            },
                                          ),
                                        ),
                                      ),

                                      const Gap(24),

                                      //사업자 번호
                                      const Text(
                                        "사업자 번호",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF212529),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        height: 56,
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1, //
                                                      color: Color(0xFFDDDDDD),
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: TextField(
                                                    style: const TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    controller: businessNumber,
                                                    enabled: !isCertificate,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration:
                                                        const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    bottom: 5)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {

                                                if (this.isCertificate) {
                                                  return;
                                                }

                                                if (businessNumber
                                                    .text.isEmpty) {
                                                  showToast("사업자번호를 입력해주세요.");
                                                  return;
                                                }
                                                final isCertificate =
                                                    await httpService
                                                        .checkBusinessNumber(
                                                            businessNumber
                                                                .text);

                                                showToast(isCertificate
                                                    ? "사업자번호 인증에 성공하였습니다."
                                                    : "사업자번호 인증에 실패하였습니다.");
                                                setState(() {
                                                  this.isCertificate =
                                                      isCertificate;
                                                });
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 8),
                                                width: 111,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFF5BD2C4),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: const Center(
                                                  child: Text(
                                                    "인증하기",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: "Pretendard",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Gap(8),
                                      const Text(
                                        "*숫자만 입력해주세요.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFC4C4C4),
                                        ),
                                      ),
                                      const Gap(24),
                                      const Text(
                                        "요양기관번호",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF212529),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        height: 56,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1, //
                                              color: Color(0xFFDDDDDD),
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: TextField(
                                            style: new TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400),
                                            controller: healthcareFacilityNumber,
                                            decoration: InputDecoration(
                                                hintText: '요양기관번호를 입력해주세요.',
                                                border: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 5)),
                                            onChanged: (text) {
                                              strHealthcareFacilityNumber =
                                                  text;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                      const Gap(64),
                                      const Text(
                                        "약관동의",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF212529),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          isAllSelect = !isAllSelect;
                                          if (isAllSelect) {
                                            isTerm1 = true;
                                            isTerm2 = true;
                                            isTerm3 = true;
                                          } else {
                                            isTerm1 = false;
                                            isTerm2 = false;
                                            isTerm3 = false;
                                          }
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 40),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              32,
                                          height: 50,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1, //
                                                color: Color(0xFFDDDDDD),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 16),
                                              ),
                                              Image.asset(
                                                isAllSelect
                                                    ? "assets/ic_check_on.png"
                                                    : "assets/ic_check_off.png",
                                                width: 16,
                                                fit: BoxFit.fitWidth,
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8),
                                              ),
                                              const Text(
                                                "전체 동의",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Pretendard",
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF212529),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        height: 48,
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                isTerm1 = !isTerm1;
                                                if (isTerm1 &&
                                                    isTerm2 &&
                                                    isTerm3) {
                                                  isAllSelect = true;
                                                } else {
                                                  isAllSelect = false;
                                                }
                                                setState(() {});
                                              },
                                              child: Image.asset(
                                                isTerm1
                                                    ? "assets/ic_check_on.png"
                                                    : "assets/ic_check_off.png",
                                                width: 16,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(left: 8),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _launchUrl("1");
                                              },
                                              child: const Text(
                                                "블랑바이미 이용약관 동의 ",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "Pretendard",
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF212529),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _launchUrl("1");
                                              },
                                              child: const Text(
                                                "(필수)",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "Pretendard",
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFA9A9A9),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        height: 48,
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                isTerm2 = !isTerm2;
                                                if (isTerm1 &&
                                                    isTerm2 &&
                                                    isTerm3) {
                                                  isAllSelect = true;
                                                } else {
                                                  isAllSelect = false;
                                                }
                                                setState(() {});
                                              },
                                              child: Image.asset(
                                                isTerm2
                                                    ? "assets/ic_check_on.png"
                                                    : "assets/ic_check_off.png",
                                                width: 16,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(left: 8),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _launchUrl("2");
                                              },
                                              child: const Text(
                                                "개인정보 수집 및 이용 동의 ",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "Pretendard",
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF212529),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _launchUrl("2");
                                              },
                                              child: const Text(
                                                "(필수)",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "Pretendard",
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFA9A9A9),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          isTerm3 = !isTerm3;
                                          if (isTerm1 && isTerm2 && isTerm3) {
                                            isAllSelect = true;
                                          } else {
                                            isAllSelect = false;
                                          }
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              32,
                                          height: 48,
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 16),
                                              ),
                                              Image.asset(
                                                isTerm3
                                                    ? "assets/ic_check_on.png"
                                                    : "assets/ic_check_off.png",
                                                width: 16,
                                                fit: BoxFit.fitWidth,
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8),
                                              ),
                                              const Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "만 14세 이상 확인 ",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              "Pretendard",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xFF212529),
                                                        ),
                                                      ),
                                                      Text(
                                                        "(필수)",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              "Pretendard",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xFFA9A9A9),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "만 14세 미만 회원의 가입은 불가합니다.",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Pretendard",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFFF45B5B),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          reqJoin();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              top: 40, bottom: 50),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              32,
                                          height: 56,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                              color: Color(0xFF212D4E),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: const Center(
                                            child: Text(
                                              "블랑바이미 시작하기",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: "Pretendard",
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
