import 'dart:async';
import 'dart:io';

import 'package:blanc_f/global/global.dart';
import 'package:blanc_f/global/http_service.dart';
import 'package:blanc_f/global/local_service.dart';
import 'package:blanc_f/home.dart';
import 'package:blanc_f/login.dart';
import 'package:blanc_f/models/login_res_model.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = NoCheckCertificateHttpOverrides(); // 생성된 HttpOverrides 객체 등록
  runApp(const MyApp());
}

class NoCheckCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ko', ''),
      ],
      title: 'oparking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  final HttpService httpService = HttpService();
  String loginEmail = "";
  String loginPwd = "";

  @override
  void initState() {
    super.initState();

    startApp();

    LocalService.getUserEmail().then((value) {
      loginEmail = value;
    });

    LocalService.getUserPwd().then((value) {
      loginPwd = value;
    });
  }

  Future<bool> isCanUpdate() async {
    try {
      final response = await httpService.checkAppUpdate();
      print("resposne... " + response.toString());
      return response.shoudAppUpdate;
    } catch (e) {
      return false;
    }
  }

  void startApp() async {
    gCameras = await availableCameras();

    Future.delayed(Duration(seconds: 1), () async {
      final newVersion = NewVersionPlus();
      getPermission();
      // final status = await newVersion.getVersionStatus();
      //
      // final appStoreLink = status?.appStoreLink;
      // final storeVersion = status?.storeVersion;
      // final canUpdate = await isCanUpdate();
      //
      // print('appStoreLink : $appStoreLink');
      // print('storeVersion : $storeVersion');
      // if (canUpdate == true) {
      //   if (!mounted) return;
      //   showDialog(
      //       context: context,
      //       barrierDismissible: false,
      //       builder: (_) => WillPopScope(
      //           child: AppUpdateDialog(
      //             onConfirm: () async {
      //               await launchUrlString(appStoreLink!);
      //             },
      //             onCancel: () {
      //               print("캔슬클릭");
      //               getPermission();
      //             },
      //           ),
      //           onWillPop: () async => false));
      // }else{
      //   getPermission();
      // }
    });
  }

  void getPermission() async {
    LocalService.getPermission().then((value) {
      if (value == "") {
        checkPermission();
      } else {
        goNext();
      }
    });
  }

  void checkPermission() async {
    Map<Permission, PermissionStatus> permissions = await [
      Permission.camera,
      Permission.photos,
      Permission.storage
    ].request();
    print('per1 : $permissions');

    savePermission();
  }

  Future<void> savePermission() async {
    LocalService.savePermission("agree");

    goNext();
  }

  void goHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void goLogin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void goNext() {
    DateTime dt1 = DateTime.parse(reviewDate);
    DateTime dt2 = DateTime.now();
    if (dt1.compareTo(dt2) == 0) {
      isReview = false;
    } else if (dt1.compareTo(dt2) < 0) {
      isReview = false;
    } else if (dt1.compareTo(dt2) > 0) {
      isReview = true;
    }

    if (loginEmail != "" && loginPwd != "") {
      reqLogin();
    } else {
      goLogin();
    }
  }

  // Network functions
  //////////////////////////////////
  void reqLogin() {
    setState(() {
      _isLoading = true;
    });
    Future<LoginResModel> loginInfo = httpService.login(loginEmail, loginPwd);
    loginInfo.then((LoginResModel value) {
      setState(() {
        _isLoading = false;
      });
      if (value.jwt != "") {
        gMyInfo = value.user;
        gJwt = value.jwt!;
        goHome();
      } else {
        goLogin();
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
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: ModalProgressHUD(
            inAsyncCall: _isLoading,
            child: Container(
              color: Colors.white,
              child: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Center(
                    child: Image.asset(
                      "assets/ic_intro.png",
                      width: 100,
                      fit: BoxFit.fitWidth,
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
