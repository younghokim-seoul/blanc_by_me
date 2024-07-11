import 'dart:async';
import 'dart:io';

import 'package:blanc_f/base.dart';
import 'package:blanc_f/dialog/dlg_a4_alert.dart';
import 'package:blanc_f/dialog/dlg_common.dart';
import 'package:blanc_f/dialog/dlg_method.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:blanc_f/global/global.dart';
import 'package:blanc_f/global/local_service.dart';
import 'package:blanc_f/guide.dart';
import 'package:blanc_f/login.dart';
import 'package:blanc_f/shooting.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:blanc_f/util/transition.dart';
import 'package:blanc_f/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomePage extends BasePage {
  HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() {
    HomePageState state = new HomePageState();
    setState(state);
    return state;
  }
}

class HomePageState extends BaseState<HomePage> with TickerProviderStateMixin {
  bool _isLoading = false;
  late TabController _controller;
  int pageIndex = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  BuildContext getContext() {
    return context;
  }

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      print("Selected Index: " + _controller.index.toString());
      changePage(_controller.index);
    });

    changePage(1);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _onBackPressed() async {
    CommonDialog().showTwoBtnPopup(context, "앱을 종료하시겠습니까?", "네", "아니요").then((val) {
      if (val.toString() == "1") {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
    });
    return true;
  }

  void changePage(int index) {
    pageIndex = index;
    _controller.animateTo((pageIndex));
    setState(() {});

    if (index == 0) {
    } else if (index == 1) {}
  }

  //A4 용지로 촬영
  Widget Tab1View() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: HOME_BACK,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: InkWell(
              onTap: () async {
                //촬영 페이지로 이동
                print('촬영 페이지로 이동');
                var result = await showDialog(context: context, builder: (_) => A4AlertDialog());
                if (result == "100") {
                  if (Platform.isAndroid) {
                    Navigator.push(context, SlideRightTransRoute(builder: (context) => ShootingPage(type: 1), settings: RouteSettings()));
                  } else {
                    const platformChannel = MethodChannel('blanc.flutter.methodchannel/iOS');
                    String res = await platformChannel.invokeMethod('lux', {"type": "1", "jwt": gJwt});
                    showToast(res);
                  }
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/Group 815312.png",
                    width: 92,
                    fit: BoxFit.fitWidth,
                  ),
                  const Text(
                    "사진 촬영하기",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212529),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                  ),
                  const Text(
                    "방법대로 촬영해주세요.",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF212529),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                  ),
                  const Text(
                    "블랑바이미 솔루션 구매 전\n고객님은 ‘A4 용지로 촬영’을 선택해주시면 됩니다.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFA9A9A9),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () async {
                //사진 촬영하는 방법 팝업 표시
                var result = await showDialog(context: context, builder: (_) => MethodDialog());
              },
              child: Container(
                width: 140,
                height: 40,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2, //
                      color: Color(0xFF212D4E),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/info_b.png",
                      width: 15,
                      fit: BoxFit.fitWidth,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                    ),
                    const Text(
                      "촬영 방법 안내",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212529),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //블랑바이미카드로 촬영
  Widget Tab2View() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: HOME_BACK,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: InkWell(
              onTap: () async {
                //촬영 페이지로 이동
                print('촬영 페이지로 이동');
                if (Platform.isAndroid) {
                  Navigator.push(context, SlideRightTransRoute(builder: (context) => ShootingPage(type: 2), settings: RouteSettings()));
                } else {
                  const platformChannel = MethodChannel('blanc.flutter.methodchannel/iOS');
                  String res = await platformChannel.invokeMethod('lux', {"type": "2", "jwt": gJwt});
                  showToast(res);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/Group 815312.png",
                    width: 92,
                    fit: BoxFit.fitWidth,
                  ),
                  const Text(
                    "사진 촬영하기",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212529),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                  ),
                  const Text(
                    "방법대로 촬영해주세요.",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF212529),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                  ),
                  const Text(
                    "블랑바이미 솔루션 구매 전\n고객님은 ‘A4 용지로 촬영’을 선택해주시면 됩니다.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFA9A9A9),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () async {
                //사진 촬영하는 방법 팝업 표시
                // var result = await showDialog(context: context, builder: (_) => MethodDialog());
                await Navigator.push(context, SlideRightTransRoute(builder: (context) => GuidePage(), settings: RouteSettings()));
              },
              child: Container(
                width: 140,
                height: 40,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2, //
                      color: Color(0xFF212D4E),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/info_b.png",
                      width: 15,
                      fit: BoxFit.fitWidth,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                    ),
                    const Text(
                      "촬영 방법 안내",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212529),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                key: _scaffoldKey,
                endDrawer: Drawer(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 50,
                          height: 44,
                          margin: const EdgeInsets.only(top: 40),
                          child: Row(
                            children: [
                              Expanded(child: Container()),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  "assets/btn_close.png",
                                  width: 32,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 24,
                          margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
                          child: Row(
                            children: [
                              Text(
                                "귀여운 ${gMyInfo!.username!}님, 안녕하세요!",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF212529),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8),
                              ),
                              Image.asset(
                                "assets/arrow_right.png",
                                width: 18,
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            CommonDialog().showTwoBtnPopup(context, "정말 로그아웃 하시겠습니까?", "네", "아니요").then((val) {
                              if (val.toString() == "1") {
                                LocalService.setUserEmail("");
                                LocalService.setUserPwd("");
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                              }
                            });
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.only(top: 26, left: 16),
                              width: 73,
                              height: 34,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1, //
                                    color: Color(0xFF5BD2C4),
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(4))),
                              child: const Center(
                                child: Text(
                                  "로그아웃",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF5BD2C4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            CommonDialog().showTwoBtnPopup(context, "정말 회원탈퇴 하시겠습니까?", "네", "아니요").then((val) {
                              if (val.toString() == "1") {
                                LocalService.setUserEmail("");
                                LocalService.setUserPwd("");
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                              }
                            });
                          },
                          child: Visibility(
                            visible: Platform.isIOS && isReview,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.only(top: 12, left: 16),
                                width: 73,
                                height: 34,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1, //
                                      color: Color(0xFF5BD2C4),
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(4))),
                                child: const Center(
                                  child: Text(
                                    "회원탈퇴",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF5BD2C4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 8,
                          margin: const EdgeInsets.only(top: 24),
                          color: Color(0xFFEFEFEF),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Container(
                  color: Colors.white,
                  child: SafeArea(
                    bottom: false,
                    child: ModalProgressHUD(
                      inAsyncCall: _isLoading,
                      child: Container(
                        color: Color(0xFFF4F4F4), //하단 포함된 백그라운드
                        child: SafeArea(
                          child: Container(
                            color: Colors.white, //기본 화면 백그라운드
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 44,
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 16),
                                      ),
                                      Image.asset(
                                        "assets/main_logo.png",
                                        width: 119,
                                        fit: BoxFit.fitWidth,
                                      ),
                                      Expanded(child: Container()),
                                      InkWell(
                                        onTap: () {
                                          _scaffoldKey.currentState!.openEndDrawer();
                                        },
                                        child: Image.asset(
                                          "assets/ic_menu.png",
                                          width: 32,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 48, left: 16),
                                  child: const Text(
                                    'AI 치아미백뷰티플랫폼',
                                    style: TextStyle(fontFamily: "Pretendard", color: PrimaryColor, fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
                                  child: const Text(
                                    '블랑바이미 전용 촬영앱입니다.',
                                    style: TextStyle(fontFamily: "Pretendard", color: MAIN_TEXT, fontSize: 24, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                                  child: const Text(
                                    '사진을 촬영하면 스마트폰 갤러리에 저장됩니다.\n저장된 사진을 블랑바이미 사이트에 업로드해주세요.',
                                    style: TextStyle(fontFamily: "Pretendard", color: Color(0xFF545454), fontSize: 12, fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  margin: const EdgeInsets.only(top: 26, left: 16, right: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            changePage(1);
                                          },
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context).size.height,
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    '블랑바이미카드로 촬영',
                                                    style: TextStyle(fontFamily: "Pretendard", color: pageIndex == 1 ? Color(0xFF212d4e) : Color(0xFF545454), fontSize: 16, fontWeight: pageIndex == 1 ? FontWeight.w700 : FontWeight.w400),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: pageIndex == 1,
                                                  child: Align(
                                                    alignment: Alignment.bottomCenter,
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      height: 2,
                                                      color: Color(0xFF212d4e),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            changePage(0);
                                          },
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context).size.height,
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    'A4 용지로 촬영',
                                                    style: TextStyle(fontFamily: "Pretendard", color: pageIndex == 0 ? Color(0xFF212d4e) : Color(0xFF545454), fontSize: 16, fontWeight: pageIndex == 0 ? FontWeight.w700 : FontWeight.w400),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: pageIndex == 0,
                                                  child: Align(
                                                    alignment: Alignment.bottomCenter,
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      height: 2,
                                                      color: Color(0xFF212d4e),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: DefaultTabController(
                                  length: 5,
                                  child: Scaffold(
                                    body: TabBarView(
                                      //physics: ClampingScrollPhysics(),
                                      physics: NeverScrollableScrollPhysics(),
                                      controller: _controller,
                                      children: [
                                        Tab1View(),
                                        Tab2View(),
                                      ],
                                    ),
                                  ),
                                )),
                                //bottom bar
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
