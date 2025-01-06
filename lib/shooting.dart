import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:blanc_f/base.dart';
import 'package:blanc_f/base/page_layout.dart';
import 'package:blanc_f/dialog/dlg_common.dart';
import 'package:blanc_f/dialog/dlg_method1.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:blanc_f/global/global.dart';
import 'package:blanc_f/global/http_service.dart';
import 'package:blanc_f/image_guide.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:blanc_f/util/transition.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:light/light.dart';
import 'package:sized_context/sized_context.dart';

/**
 * 촬영페이지
 */
class ShootingPage extends BasePage {
  ShootingPage({Key? key, required this.userId}) : super(key: key);

  final int userId; // 1 : A4 용지로 촬영,  2 : 블랑바이미카드로 촬영

  @override
  ShootingPageState createState() {
    ShootingPageState state = new ShootingPageState();
    setState(state);
    return state;
  }
}

class ShootingPageState extends BaseState<ShootingPage> {
  bool _isLoading = false;
  late CameraController controller;
  Light? _light;
  StreamSubscription? _subscription;

  // bool isReady = true; //준비상태인가, 촬영상태인가?
  bool isCheckPhoto = true; //하진을 촬영할 수 있는지 체크
  String alertMsg = ""; //오류메시지

  double deviceWidth = 0.0; // device width(cm)

  bool isCameraFront = true;

  //Test Mode
  bool IS_TEST = false;
  int mLuxValue = 0;

  @override
  BuildContext getContext() {
    return context;
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    super.initState();
    initCamera();
    startListen();

    Future.delayed(Duration(seconds: 1), () {
      double widthInInches = context.widthInches;
      print("================ widthInInches =======================");
      print(widthInInches * 2.54);
      deviceWidth = widthInInches * 2.54;
      setState(() {});
    });
  }

  void initCamera() {
    CameraLensDirection direction = isCameraFront ? CameraLensDirection.front : CameraLensDirection.back;
    final front = gCameras.firstWhere((camera) => camera.lensDirection == direction);
    controller = CameraController(front, ResolutionPreset.max, enableAudio: false);
    controller.initialize().then((_) {
      controller.setZoomLevel(2.000000);
      if (Platform.isAndroid) {
        controller.lockCaptureOrientation(DeviceOrientation.landscapeLeft);
      } else {
        controller.lockCaptureOrientation(DeviceOrientation.landscapeRight);
      }
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  Future<void> startListen() async {
    if (Platform.isAndroid) {
      startListening();
    } else {
      const platformChannel = MethodChannel('blanc.flutter.methodchannel/iOS');
      String res = await platformChannel.invokeMethod('lux');
      showToast(res);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    _subscription?.cancel();
    super.dispose();
  }

  Future<bool> _onBackPressed() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Navigator.of(context).pop();
    return true;
  }

  //lux callback
  void onData(int luxValue) async {
    // print("Lux value: $luxValue");

    if (luxValue < 250) {
      isCheckPhoto = false;
      if (alertMsg.isNotEmpty) {
        return;
      }
      alertMsg = "조금 더 밝은곳으로 이동해서 촬영해주세요";
    } else if (luxValue > 500) {
      isCheckPhoto = false;
      if (alertMsg.isNotEmpty) {
        return;
      }
      alertMsg = "조금 더 어두운곳으로 이동해서 촬영해주세요";
    } else {
      isCheckPhoto = true;
      alertMsg = "";
    }
    mLuxValue = luxValue;
    setState(() {});
  }

  // lux 초기화
  void startListening() {
    _light = Light();
    try {
      _subscription = _light?.lightSensorStream.listen(onData);
    } on LightException catch (exception) {
      print(exception);
    }
  }

  double getRulerWidth(int type) {
    double result = 0.0;

    if (deviceWidth == 0.0) {
      return result;
    }
    var mediaQuery = MediaQuery.of(context);
    final statusBarHeight = window.viewPadding.top;
    var physicalPixelWidth = statusBarHeight * mediaQuery.devicePixelRatio;
    double width = MediaQuery.of(context).size.width - statusBarHeight;
    if (type == 1) {
      result = (width * 4) / deviceWidth;
    } else if (type == 2) {
      result = (width * 3.6) / deviceWidth;
    } else if (type == 3) {
      if (Platform.isAndroid) {
        result = (width * 6) / deviceWidth;
      } else {
        result = ((width - 50) * 6) / deviceWidth;
      }
    }

    return result;
  }

  //A4 용지로 촬영
  Widget Tab1View() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            "assets/Exclude.png",
            width: double.infinity,
            height: double.infinity,
          ),

          //ready view
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 288,
                            height: 88,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              //Color(0xFF545454).withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: Image.asset(
                              "assets/Frame 816255.png",
                              width: getRulerWidth(1),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(0xFFefefef),
                    child: const Center(
                      child: Text(
                        "A4용지와 함께 촬영해주세요!",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF545454),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //촬영 방법 안내
          Positioned(
            left: 16.0,
            bottom: 24.0,
            child: InkWell(
              onTap: () async {
                //사진 촬영하는 방법 팝업 표시
                var result = await showDialog(context: context, builder: (_) => Method1Dialog());
              },
              child: Container(
                width: 140,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xFF212529).withOpacity(0.7), borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Icon (Stroke).png",
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
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //카메라 전환 버튼
          Positioned(
            right: 16.0,
            bottom: 24.0,
            child: InkWell(
              onTap: () {
                isCameraFront = !isCameraFront;
                initCamera();
              },
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Color(0xFF212529).withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(19)),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/refresh.png",
                    width: 16,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),

          //close
          Positioned(
            top: 8,
            right: 16,
            child: InkWell(
              onTap: () {
                _onBackPressed();
              },
              child: Image.asset(
                "assets/Frame 816256.png",
                width: 40,
                height: 40,
              ),
            ),
          ),

          //toast
          Positioned(
            top: 30,
            left: (MediaQuery.of(context).size.width - 350) / 2,
            child: Visibility(
              visible: alertMsg.isNotEmpty,
              child: Container(
                width: 350,
                height: 36,
                decoration: const BoxDecoration(
                  color: PrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                child: Center(
                  child: Text(
                    alertMsg,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          //show test value
          Visibility(
            visible: IS_TEST,
            child: Positioned(
              top: 100,
              left: 30,
              child: Text(
                mLuxValue.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            "assets/Exclude.png",
            width: double.infinity,
            height: double.infinity,
          ),

          //Ready view
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 97.0, bottom: Platform.isAndroid ? 97.0 : 87.0, right: 180.0, left: 180.0),
                    decoration: const BoxDecoration(
                      //color: Color(0xFF545454).withOpacity(0.2),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: Image.asset(
                          "assets/Frame 816258.png",
                          width: getRulerWidth(2),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: Platform.isAndroid ? -110.0 : -120.0,
                  left: Platform.isAndroid
                      ? (MediaQuery.of(context).size.width - getRulerWidth(3)) / 2
                      : (MediaQuery.of(context).size.width - 100 - getRulerWidth(3)) / 2,
                  child: SizedBox(
                    width: getRulerWidth(3),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/Frame 816255.png",
                            width: getRulerWidth(1),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                        ),
                        Image.asset(
                          "assets/Rectangle 4.png",
                          width: getRulerWidth(3),
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //촬영 방법 안내
          Positioned(
            left: 16.0,
            bottom: 24.0,
            child: InkWell(
              onTap: () async {
                //사진 촬영하는 방법 팝업 표시
                await Navigator.push(
                    context, SlideRightTransRoute(builder: (context) => const ImageGuide(), settings: RouteSettings()));
              },
              child: Container(
                width: 140,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF212529).withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Icon (Stroke).png",
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
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //카메라 전환 버튼
          Positioned(
            right: 16.0,
            bottom: 24.0,
            child: InkWell(
              onTap: () {
                isCameraFront = !isCameraFront;
                initCamera();
              },
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Color(0xFF212529).withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(19)),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/refresh.png",
                    width: 16,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),

          //close
          Positioned(
            top: 8,
            right: 16,
            child: InkWell(
              onTap: () {
                _onBackPressed();
              },
              child: Image.asset(
                "assets/Frame 816256.png",
                width: 40,
                height: 40,
              ),
            ),
          ),

          //toast
          Positioned(
            top: 30,
            left: (MediaQuery.of(context).size.width - 350) / 2,
            child: Visibility(
              visible: alertMsg.isNotEmpty,
              child: Container(
                width: 350,
                height: 36,
                decoration:
                    const BoxDecoration(color: PrimaryColor, borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Center(
                  child: Text(
                    alertMsg,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          //show test value
          Visibility(
            visible: IS_TEST,
            child: Positioned(
              top: 100,
              left: 30,
              child: Text(
                mLuxValue.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //갤러리에 이미지 저장
  void saveImageToGallery(String file) {
    GallerySaver.saveImage(file).then((value) => print('>>>> save value= $value')).catchError((err) {
      print('error :( $err');
    });
  }

  Future<void> takeImage() async {

    if (isCheckPhoto == false) {
      showToast("촬영조건이 만족되지 않습니다.");
      return;
    }

    if (EasyLoading.isShow) {
      return;
    }

    XFile file = await controller.takePicture();
    final rotateFile = await FlutterExifRotation.rotateAndSaveImage(path: file.path);

    saveImageToGallery(rotateFile.path);
    CommonDialog().showTwoBtnPopup(context, "AI 치아미백 분석하기", "확인", "다시 촬영하기").then((val) async {
      if (val.toString() == "1") {
        try {
          await EasyLoading.show();
          final HttpService httpService = HttpService();
          final photoData = await httpService.fileUpload(file);

          await httpService.fetchAiCuration(
            userId: widget.userId,
            toothId: photoData.data.first.id,
          );

          _dismissLoadingAndShowMessage(true);
        } catch (e) {
          print("AI Curation Error");
          _dismissLoadingAndShowMessage(false);
        }
      }
    });
  }

  void _dismissLoadingAndShowMessage(bool isCurationSuccess) {
    EasyLoading.dismiss();
    CommonDialog.showCurationResultPop(context, isCurationSuccess: isCurationSuccess, onConfirm: () {
      _onBackPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      onBack: _onBackPressed,
      isAvoidResize: false,
      child: InkWell(
        onTap: () {
          takeImage();
        },
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: controller.value.isInitialized
              ? CameraPreview(
                  controller,
                  child: Stack(
                    children: [
                      Tab2View(),
                    ],
                  ),
                )
              : Container(width: double.infinity, height: double.infinity, color: const Color(0xFF313131)),
        ),
      ),
    );
  }
}
