import 'dart:async';

import 'package:blanc_f/base.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:blanc_f/global/http_service.dart';
import 'package:blanc_f/models/pass_reset%20_res_model.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

/**
 * 비밀번호 재설정을 위한 이메일 보내기 결과
 */
class FindPwd2Page extends BasePage {
  FindPwd2Page({Key? key, required this.email}) : super(key: key);
  String email;

  @override
  FindPwd2PageState createState() {
    FindPwd2PageState state = new FindPwd2PageState();
    setState(state);
    return state;
  }
}

class FindPwd2PageState extends BaseState<FindPwd2Page> {
  bool _isLoading = false;

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
    Navigator.pop(context, "200");
    return true;
  }

  Future<void> resenEmail() async {
    setState(() {
      _isLoading = true;
    });
    Future<PassResetResModel> loginInfo = httpService.passReset(widget.email);
    loginInfo.then((PassResetResModel value) async {
      setState(() {
        _isLoading = false;
      });
      if (value.ok == true) {
        showToast("이메일 보냈습니다.");
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
                                  Image.asset(
                                    "assets/mail.png",
                                    width: 32,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 24),
                                  ),
                                  const Text(
                                    "비밀번호 재설정\n이메일을 보냈습니다.",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF212529),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 24),
                                    padding: const EdgeInsets.only(top: 20, left: 16),
                                    width: MediaQuery.of(context).size.width - 32,
                                    height: 98,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF9F9F9),
                                        border: Border.all(
                                          width: 1, //
                                          color: Color(0xFFDDDDDD),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(8))),
                                    child: const Text(
                                      "받은 편지함을 확인해 주세요.\n10분이 지나도 이메일이 오지 않는 경우,\n스팸 메일함을 확인해주시거나 다시 시도해주세요.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Pretendard",
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF545454),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  const Center(
                                    child: Text(
                                      "메일이 오지 않나요? 다시 시도하기를 눌러주세요.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Pretendard",
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF545454),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      resenEmail();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 16, bottom: 24),
                                      width: MediaQuery.of(context).size.width - 32,
                                      height: 56,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(color: Color(0xFF5BD2C4), borderRadius: BorderRadius.all(Radius.circular(8))),
                                      child: const Center(
                                        child: Text(
                                          "다시 시도하기",
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
    );
  }
}
