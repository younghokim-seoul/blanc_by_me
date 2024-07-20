import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg) {
  Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.black, textColor: Colors.white, fontSize: 14.0);
}

//숫자 포맷, 변환
String commaIntFormat(String value) {
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  mathFunc(Match match) => '${match[1]},';
  String result = value.replaceAllMapped(reg, mathFunc);
  return result;
}

String getDevType() {
  String target = "";
  if (Platform.isAndroid) {
    target = "aos";
  } else if(Platform.isIOS) {
    target = "ios";
  }
  return target;
}

bool isValidEmailFormat(String email) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

bool validPwd(String pwd) {
  String pattern = r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,20}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(pwd);
}
