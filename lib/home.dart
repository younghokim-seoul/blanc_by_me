import 'dart:async';
import 'dart:io';

import 'package:blanc_f/base.dart';
import 'package:blanc_f/common_web_page.dart';
import 'package:blanc_f/dialog/dlg_common.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:blanc_f/global/global.dart';
import 'package:blanc_f/global/local_service.dart';
import 'package:blanc_f/image_guide.dart';
import 'package:blanc_f/login.dart';
import 'package:blanc_f/shooting.dart';
import 'package:blanc_f/util/bounce.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:blanc_f/util/transition.dart';
import 'package:blanc_f/video_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
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
  int pageIndex = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  BuildContext getContext() {
    return context;
  }

  Future<bool> _onBackPressed() async {
    CommonDialog()
        .showTwoBtnPopup(context, "앱을 종료하시겠습니까?", "네", "아니요")
        .then((val) {
      if (val.toString() == "1") {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
    });
    return true;
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
                  Navigator.push(
                      context,
                      SlideRightTransRoute(
                          builder: (context) => ShootingPage(type: 2),
                          settings: RouteSettings()));
                } else {
                  const platformChannel =
                      MethodChannel('blanc.flutter.methodchannel/iOS');
                  String res = await platformChannel
                      .invokeMethod('lux', {"type": "2", "jwt": gJwt});
                  showToast(res);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Bounce(
                      duration: const Duration(milliseconds: 200),
                      child: Image.asset(
                        "assets/Group 815312.png",
                        width: 92,
                        fit: BoxFit.fitWidth,
                      )),
                  const Gap(24),
                  const Text(
                    "블랑바이미카드로 사진 촬영하기",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212529),
                    ),
                  ),
                  const Gap(8),
                  const Text(
                    "방법대로 촬영해주세요.",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF212529),
                    ),
                  ),
                  const Gap(24),
                  InkWell(
                    onTap: () async {
                      //사진 촬영하는 방법 팝업 표시
                      var result = await Navigator.push(
                          context,
                          SlideRightTransRoute(
                              builder: (context) => ImageGuide(),
                              settings: RouteSettings()));
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                      ]);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1, //
                            color: const Color(0xFFDDDDDD),
                          ),
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(999))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/info_b.png",
                            width: 14,
                            fit: BoxFit.fitWidth,
                          ),
                          const Gap(4),
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
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () async {
                //사진 촬영하는 방법 팝업 표시
                var result = await Navigator.push(
                    context,
                    SlideRightTransRoute(
                        builder: (context) => const VideoGuidePage(),
                        settings: RouteSettings()));
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                ]);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1, //
                      color: const Color(0xFFDDDDDD),
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(999))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon_play.png",
                      width: 12.83,
                      fit: BoxFit.fitWidth,
                    ),
                    const Gap(4),
                    const Text(
                      "촬영방법 동영상으로 보기",
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
                          margin: const EdgeInsets.only(
                              top: 24, left: 16, right: 16),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "귀여운 ${gMyInfo!.username!}님, 안녕하세요!",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF212529),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CommonWebPage(
                                          webUrl:
                                              "https://www.blancbyme.com/webview?redirect=/mypage"),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  "assets/arrow_right.png",
                                  width: 18,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            CommonDialog()
                                .showTwoBtnPopup(
                                    context, "정말 로그아웃 하시겠습니까?", "네", "아니요")
                                .then((val) {
                              if (val.toString() == "1") {
                                LocalService.setUserEmail("");
                                LocalService.setUserPwd("");
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
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
                            CommonDialog()
                                .showTwoBtnPopup(
                                    context, "정말 회원탈퇴 하시겠습니까?", "네", "아니요")
                                .then((val) {
                              if (val.toString() == "1") {
                                LocalService.setUserEmail("");
                                LocalService.setUserPwd("");
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }
                            });
                          },
                          child: Visibility(
                            visible: Platform.isIOS && isReview,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 12, left: 16),
                                width: 73,
                                height: 34,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1, //
                                      color: Color(0xFF5BD2C4),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
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
                                          _scaffoldKey.currentState!
                                              .openEndDrawer();
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
                                  margin:
                                      const EdgeInsets.only(top: 48, left: 16),
                                  child: const Text(
                                    'AI 치아미백뷰티플랫폼',
                                    style: TextStyle(
                                        fontFamily: "Pretendard",
                                        color: PrimaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const Gap(8),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: const Text(
                                    '블랑바이미\n전용 촬영앱입니다.',
                                    style: TextStyle(
                                        fontFamily: "Pretendard",
                                        color: MAIN_TEXT,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 16, left: 16, right: 16),
                                  child: const Text(
                                    '사진을 촬영하면 스마트폰 갤러리에 저장됩니다.\n저장된 사진을 블랑바이미 사이트에 업로드해주세요.',
                                    style: TextStyle(
                                        fontFamily: "Pretendard",
                                        color: Color(0xFF545454),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const Gap(32),
                                InkWell(
                                  onTap: () async {
                                    //촬영 페이지로 이동
                                    print('블랑바이미 구매하기 페이지로 이동');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CommonWebPage(
                                            webUrl:
                                            "https://www.blancbyme.com/webview?redirect=/solution/life-time"),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      width: double.infinity,
                                      color: const Color(0xFFD8EDEA),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            right: 29,
                                            bottom: 0,
                                            child: Image.asset(
                                              "assets/ic_buy_card.png",
                                              width: 46,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  '블랑바이미 카드 구매하러 가기',
                                                  style: TextStyle(
                                                      fontFamily: "Pretendard",
                                                      color: Color(0xFF545454),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                const Gap(4),
                                                Image.asset(
                                                  "assets/arrow_right.png",
                                                  width: 14,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                Expanded(child: Tab2View()),
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
