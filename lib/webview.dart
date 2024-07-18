import 'dart:io';
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:blanc_f/base.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:blanc_f/global/global.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tosspayments_widget_sdk_flutter/model/tosspayments_url.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

/**
 * 웹뷰
 */
class Webview1Page extends BasePage {
  Webview1Page({Key? key}) : super(key: key);

  @override
  Webview1PageState createState() {
    Webview1PageState state = new Webview1PageState();
    setState(state);
    return state;
  }
}

class Webview1PageState extends BaseState<Webview1Page> {
  bool _isLoading = false;

  String webUrl = "";
  String bridge = "blanc_bridge";
  String agent_flutter = "blancbyme_app";

  late final WebViewController _controller;


  @override
  BuildContext getContext() {
    return context;
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // webUrl = "$PHOTO_UPLOAD_PAGE?auth=$gJwt";
    // webUrl = PHOTO_UPLOAD_PAGE;
    webUrl = "https://www.blancbyme.com/webview?redirect=%2Fai-curation";
    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    _controller = WebViewController.fromPlatformCreationParams(params);
    addFileSelectionListener();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await FkUserAgent.init();
      await initUserAgentState();
      initWebView();
    });
  }

  void addFileSelectionListener() async {
    if (Platform.isAndroid) {
      final androidController =
          _controller.platform as AndroidWebViewController;
      await androidController.setOnShowFileSelector(_androidFilePicker);
    }
  }

  /// Function for file selection from gallery
  Future<List<String>> _androidFilePicker(FileSelectorParams params) async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      return [file.uri.toString()];
    }
    return [];
  }

  Future<void> initUserAgentState() async {
    String userAgent, webViewUserAgent;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      userAgent = await FkUserAgent.getPropertyAsync('userAgent');
      await FkUserAgent.init();
      webViewUserAgent = FkUserAgent.webViewUserAgent!;
      print('''
applicationVersion => ${FkUserAgent.getProperty('applicationVersion')}
systemName         => ${FkUserAgent.getProperty('systemName')}
userAgent          => $userAgent
webViewUserAgent   => $webViewUserAgent
      ''');
    } on PlatformException {
      userAgent = webViewUserAgent = '<error>';
    }

    if (!mounted) return;

    setState(() {
      agent_flutter = webViewUserAgent + ' ' + agent_flutter;
    });
  }

  void initWebView() {
    // #enddocregion platform_features

    print("initWebView agent $agent_flutter");
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setUserAgent(agent_flutter)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) async {
            print('+++++++++++++++++++++++++++++++++ $request}');

            String url = request.url;


            bool isLaunch = false;
            if (Platform.isAndroid) {
              final appScheme = ConvertUrl(url);
              if (appScheme.isAppLink()) {
                // 앱 스킴 URL인지 확인
                appScheme.launchApp(mode: LaunchMode.externalApplication); // 앱 설치 상태에 따라 앱 실행 또는 마켓으로 이동
                return NavigationDecision.prevent;
              }
            } else if (Platform.isIOS) {
              // iOS 경우
              if (request.url.startsWith('https://itunes.apple.com/') || request.url.startsWith('https://apps.apple.com/')) {
                print("여긴가??");
                isLaunch = await launchURL(request.url);
              } else if (request.url.startsWith('niceipin2')) {
                isLaunch = await launchURL(request.url);
              }
              final appScheme = ConvertUrl(url);
              if (appScheme.isAppLink()) {
                // 앱 스킴 URL인지 확인
                appScheme.launchApp(
                    mode: LaunchMode
                        .externalApplication); // 앱 설치 상태에 따라 앱 실행 또는 마켓으로 이동
                return NavigationDecision.prevent;
              }
            }

            if (isLaunch) {
              return NavigationDecision.prevent;
            }

            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        bridge,
        onMessageReceived: (JavaScriptMessage message) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text(message.message)),
          // );
          print('++++++++++++++bridge+++++++++++++++++++ $message.message}');
          try {
            Map<String, dynamic> infos = jsonDecode(message.message);
            //String funcName = infos['function_name'];
            String funcName = infos['type'];
            if (funcName == 'get_token') {
              String callback_str = infos['callback'];
              Map<String, String> body = {
                'jwt': gJwt,
              };
              String str = json.encode(body);
              str = str.replaceAll("\"", "\\\"");
              String javaScript =
                  "window.bridgeCallbacks['$callback_str'].call(null, '$str');";
              _controller.runJavaScript(javaScript);
            } else {
              //
            }
          } on Exception catch (e) {
            showToast(message.message);
          }
          return;
        },
      )
      ..loadRequest(Uri.parse(webUrl));

    // #docregion platform_features
    if (_controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (_controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> launchURL(String url) async {
    Uri uri = Uri.parse(url.trim());

    if (await canLaunchUrl(uri)) {
      bool result = await launchUrl(uri, mode: LaunchMode.externalApplication);
      return result;
    } else {
      print('Could not launch $url');
      return false;
    }
  }

  bool isAppLink(String url) {
    String? scheme;
    try {
      scheme = Uri.parse(url).scheme;
    } catch (e) {
      List<String> splittedUrl = url.replaceFirst(RegExp(r'://'), ' ').split(' ');
      String appScheme = splittedUrl[0];
      scheme = appScheme;
    }
    return !['http', 'https', 'about', 'data', ''].contains(scheme);
  }

  Future<bool> onGoBack() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      Navigator.pop(context, "200");
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: WillPopScope(
        onWillPop: onGoBack,
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
                          Container(
                              height: 55,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      onGoBack();
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 45,
                                      child: Image.asset(
                                        "assets/btn_back.png",
                                        width: 32,
                                        height: 32,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                ],
                              )),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: WebViewWidget(controller: _controller),
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
