import 'dart:async';

import 'package:blanc_f/base.dart';
import 'package:blanc_f/find_pwd2.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:blanc_f/global/http_service.dart';
import 'package:blanc_f/models/pass_reset%20_res_model.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:blanc_f/util/transition.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

/**
 * 비밀번호 재설정
 */
class FindPwd1Page extends BasePage {
  FindPwd1Page({Key? key}) : super(key: key);

  @override
  FindPwd1PageState createState() {
    FindPwd1PageState state = new FindPwd1PageState();
    setState(state);
    return state;
  }
}

class FindPwd1PageState extends BaseState<FindPwd1Page> {
  bool _isLoading = false;

  TextEditingController tecEmail = TextEditingController(); //이메일

  String strEmail = "";
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

  Future<void> goResult() async {
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
    Future<PassResetResModel> loginInfo = httpService.passReset(strEmail);
    loginInfo.then((PassResetResModel value) async {
      setState(() {
        _isLoading = false;
      });
      if (value.ok == true) {
        String result = await Navigator.push(context, SlideRightTransRoute(builder: (context) => FindPwd2Page(email: strEmail), settings: RouteSettings()));
        if (result == "200"){
          _onBackPressed();
        }
      } else {
        showToast("이메일 보내기 실패했습니다.");
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
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _onBackPressed();
                                      },
                                      child: SizedBox(
                                        height: 44,
                                        child: Image.asset(
                                          "assets/btn_back.png",
                                          width: 32,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 24),
                                    ),
                                    const Text(
                                      "비밀번호 재설정",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: "Pretendard",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF212529),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 16),
                                    ),
                                    const Text(
                                      "가입 시 입력한 이메일 주소를 입력해 주세요.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Pretendard",
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF545454),
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
                                    InkWell(
                                      onTap: () {
                                        goResult();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 24),
                                        width: MediaQuery.of(context).size.width - 32,
                                        height: 56,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(color: Color(0xFF5BD2C4), borderRadius: BorderRadius.all(Radius.circular(8))),
                                        child: const Center(
                                          child: Text(
                                            "비밀번호 재설정 이메일 보내기",
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
