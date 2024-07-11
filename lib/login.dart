import 'dart:async';

import 'package:blanc_f/base.dart';
import 'package:blanc_f/find_pwd1.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:blanc_f/global/global.dart';
import 'package:blanc_f/global/http_service.dart';
import 'package:blanc_f/global/local_service.dart';
import 'package:blanc_f/home.dart';
import 'package:blanc_f/join.dart';
import 'package:blanc_f/models/login_res_model.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:blanc_f/util/transition.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

/**
 * 로그인페이지
 */
class LoginPage extends BasePage {
  LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() {
    LoginPageState state = new LoginPageState();
    setState(state);
    return state;
  }
}

class LoginPageState extends BaseState<LoginPage> {
  bool _isLoading = false;

  TextEditingController tecEmail = TextEditingController(text: "blancbyme3@ydencare.com"); //이메일
  TextEditingController tecPwd = TextEditingController(text: "qmffkd88!@"); //패스워드


  String strEmail = "blancbyme3@ydencare.com";
  String strPass = "qmffkd88!@";
  final HttpService httpService = HttpService();

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
    Navigator.push(context, SlideRightTransRoute(builder: (context) => HomePage(), settings: RouteSettings()));
  }

  void goJoin() {
    Navigator.push(context, SlideRightTransRoute(builder: (context) => JoinPage(), settings: RouteSettings()));
  }

  void goFindPwd() {
    Navigator.push(context, SlideRightTransRoute(builder: (context) => FindPwd1Page(), settings: RouteSettings()));
  }

  // Network functions
  //////////////////////////////////
  void reqLogin() {
    if (strEmail == "") {
      showToast("이메일을 입력해주세요.");
      return;
    }

    if (!isValidEmailFormat(strEmail)) {
      showToast("이메일 형식이 올바르지 않습니다.");
      return;
    }

    if (strPass == "") {
      showToast("비밀번호를 입력하세요.");
      return;
    }

    setState(() {
      _isLoading = true;
    });
    Future<LoginResModel> loginInfo = httpService.login(strEmail, strPass);
    loginInfo.then((LoginResModel value) {
      setState(() {
        _isLoading = false;
      });
      if (value.jwt != "") {
        LocalService.setUserEmail(strEmail);
        LocalService.setUserPwd(strPass);

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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 64),
                                      ),
                                      Center(
                                        child: Image.asset(
                                          "assets/login_logo.png",
                                          width: 81,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 24),
                                      ),
                                      const Center(
                                        child: Text(
                                          "안녕하세요 :)\n블랑바이미(BLANCE BY ME) 입니다.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF212529),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 16),
                                      ),
                                      const Center(
                                        child: Text(
                                          "로그인 후 블랑바이미의 다양한 서비스를 이용해보세요.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF545454),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 64),
                                      ),
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
                                        width: MediaQuery.of(context).size.width - 32,
                                        height: 56,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1, //
                                              color: Color(0xFFDDDDDD),
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(8))),
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: TextField(
                                            keyboardType: TextInputType.emailAddress,
                                            style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                                            controller: tecEmail,
                                            decoration: InputDecoration(hintText: '이메일을 입력해주세요.', border: InputBorder.none, contentPadding: EdgeInsets.only(bottom: 5)),
                                            onChanged: (text) {
                                              strEmail = text;
                                            },
                                          ),
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
                                        width: MediaQuery.of(context).size.width - 32,
                                        height: 56,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1, //
                                              color: Color(0xFFDDDDDD),
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(8))),
                                        child: Container(
                                          padding: const EdgeInsets.only(left: 15, right: 15),
                                          child: TextField(
                                            keyboardType: TextInputType.emailAddress,
                                            style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                                            controller: tecPwd,
                                            obscureText: true,
                                            decoration: InputDecoration(hintText: '8~16자리 영문,숫자,특수문자 포함', border: InputBorder.none, contentPadding: EdgeInsets.only(bottom: 5)),
                                            onChanged: (text) {
                                              strPass = text;
                                            },
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          reqLogin();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 24),
                                          width: MediaQuery.of(context).size.width - 32,
                                          height: 56,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(color: Color(0xFF5BD2C4), borderRadius: BorderRadius.all(Radius.circular(8))),
                                          child: const Center(
                                            child: Text(
                                              "로그인",
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
                                      InkWell(
                                        onTap: () {
                                          goJoin();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          width: MediaQuery.of(context).size.width - 32,
                                          height: 56,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1, //
                                                color: Color(0xFF5BD2C4),
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(8))),
                                          child: const Center(
                                            child: Text(
                                              "회원가입",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: "Pretendard",
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF5BD2C4),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 16),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          goFindPwd();
                                        },
                                        child: const Center(
                                          child: Text(
                                            "비밀번호를 잊어버리셨나요? 비밀번호 재설정",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Pretendard",
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF545454),
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
