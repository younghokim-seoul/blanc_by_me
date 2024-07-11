import 'package:blanc_f/global/colors.dart';
import 'package:flutter/material.dart';

/**
 * 공통 팝업
 */
class CommonDialog {
  //버튼 두개를 가진 팝업
  Future<int> showTwoBtnPopup(BuildContext context, String msg, String btn1, String btn2) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
              content: Container(
                  width: 350,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0),
                        child: Text(
                          msg,
                          textAlign: TextAlign.center,
                          style: new TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: "Pretendard", color: Color(0xFF212529)),
                        ),
                      ),
                      Container(
                          height: 48,
                          margin: const EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0, bottom: 24.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context, 2);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1, //
                                          color: PrimaryColor,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(8))),
                                    child: Center(
                                      child: Text(
                                        btn2,
                                        style: new TextStyle(fontFamily: "Pretendard", fontSize: 16, color: PrimaryColor, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context, 1);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    margin: const EdgeInsets.only(left: 8.0),
                                    decoration: const BoxDecoration(
                                        color: PrimaryColor,
                                        borderRadius: BorderRadius.all(Radius.circular(8))),
                                    child: Center(
                                      child: Text(
                                        btn1,
                                        style: new TextStyle(fontFamily: "Pretendard", fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )));
        });
  }

  //버튼 한개를 가진 팝업
  Future<int> showOneBtnPopup(BuildContext context, String title, String msg, String btnTitle) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                content: Container(
                    width: (MediaQuery.of(context).size.width - 80),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 32.0),
                          child: Center(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                title,
                                style: new TextStyle(fontSize: 20, fontFamily: "Pretendard", color: Color(0xFF212529), fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24, top: 24, right: 24),
                          child: Text(
                            msg,
                            style: TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, color: Color(0xFF545454), fontSize: 14),
                          ),
                        ),
                        Container(
                          height: 48,
                          margin: EdgeInsets.only(top: 32, bottom: 24, left: 24, right: 24),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: const BoxDecoration(
                                  color: PrimaryColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  btnTitle,
                                  style: new TextStyle(fontFamily: "Pretendard", fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))),
          );
        });
  }
}
