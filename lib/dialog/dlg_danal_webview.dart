import 'dart:convert';
import 'dart:io';

import 'package:blanc_f/global/global.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

/**
 * 본인인증
 */
class DanalWebviewDialog extends StatefulWidget {
  DanalWebviewDialog({Key? key, required this.name, required this.phone}) : super(key: key);

  final String name;
  final String phone;

  @override
  _DanalWebviewDialogState createState() => _DanalWebviewDialogState();
}

class _DanalWebviewDialogState extends State<DanalWebviewDialog> {
  String webUrl = "";
  String bridge = "blanc_bridge";
  String agent_flutter = "blancbyme_app";

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    webUrl = DANAL_PAGE + "?name=" + widget.name + "&phone=" + widget.phone;
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

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await FkUserAgent.init();
      await initUserAgentState();
      initWebView();
    });
  }

  void goFailBack() {
    Map obj = Map();
    obj["result"] = "fail";
    Navigator.pop(context, obj);
  }

  void goSuccessBack(String imp_uid, String merchant_uid) {
    //imp_uid : 포트원 인증 고유번호(이 값을 이용해 본인인증 결과등 조회)
    // merchant_uid : 고객사에서 생성/관리하는 고유 주문번호
    Map obj = Map();
    obj["result"] = "success";
    obj["imp_uid"] = imp_uid;
    obj["merchant_uid"] = merchant_uid;
    Navigator.pop(context, obj);
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

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
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
            // if (request.url.startsWith('https://www.youtube.com/')) {
            //   debugPrint('blocking navigation to ${request.url}');
            //   return NavigationDecision.prevent;
            // }
            // debugPrint('allowing navigation to ${request.url}');
            print('+++++++++++++++++++++++++++++++++ $request}');

            String url = request.url;
            bool isLaunch = false;
            if (Platform.isAndroid) {
              if (url.startsWith("intent://")) {
                //String result = await platform.invokeMethod('startAct', <String, Object>{'url': url});
                //isLaunch = (result == url);
                isLaunch = await launchURL(request.url);
              } else if (request.url.startsWith('https://play.google.com/store/apps/details?id=') || request.url.startsWith('market://details?id=')) {
                isLaunch = await launchURL(request.url);
              }
            } else if (Platform.isIOS) {
              // iOS 경우
              if (request.url.startsWith('https://itunes.apple.com/') || request.url.startsWith('https://apps.apple.com/')) {
                isLaunch = await launchURL(request.url);
              } else if (request.url.startsWith('niceipin2')) {
                isLaunch = await launchURL(request.url);
              }
            }

            if ((!request.url.startsWith('http') && !request.url.startsWith('https'))) {
              print('blocking navigation to $request}');
              if (!isAppLink(request.url)) {
                isLaunch = await launchURL(request.url);
              }
            }

            if (isLaunch) {
              return NavigationDecision.prevent;
            }

            if (request.url.contains("https://blancbyme.com/certification")) {
              String url = request.url.replaceAll("https://blancbyme.com/certification?", "");
              if (url.contains("success=true")) {
                List<String> arr = url.split("&");
                String imp_uid = "";
                String merchant_uid = "";
                for (int i = 0; i < arr.length - 1; i++) {
                  String temp = arr[i];
                  if (temp.contains("imp_uid=")) {
                    imp_uid = temp.replaceAll("imp_uid=", "");
                  }

                  if (temp.contains("merchant_uid=")) {
                    merchant_uid = temp.replaceAll("merchant_uid=", "");
                  }
                }
                goSuccessBack(imp_uid, merchant_uid);
              } else {
                goFailBack();
              }
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
          try {
            Map<String, dynamic> infos = jsonDecode(message.message);
            String funcName = infos['function_name'];
            if (funcName == 'onSelectAddress') {
              // goSuccessBack(infos['address'], infos['postcode']);
            } else if (funcName == 'onSelectAddressFail') {
              goFailBack();
            } else {
              goFailBack();
            }
          } on Exception catch (e) {
            showToast(message.message);
            goFailBack();
          }
          return;
        },
      )
      ..loadRequest(Uri.parse(webUrl));

    // #docregion platform_features
    if (_controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (_controller.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.only(left: 10.0, right: 10.0),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Container(
        width: 328,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20.0, left: 16, right: 16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF212529),
                        ),
                      ),
                    ),
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
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 14.0),
                height: 450,
                child: WebViewWidget(controller: _controller),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
