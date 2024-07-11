import 'package:blanc_f/global/colors.dart';
import 'package:flutter/material.dart';

/**
 *
 */
class A4AlertDialog extends StatefulWidget {
  @override
  _A4AlertDialogState createState() => _A4AlertDialogState();
}

class _A4AlertDialogState extends State<A4AlertDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Container(
            width: 328,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "블랑바이미 카드로 촬영해야 더 정확하게\n내 치아 컬러를 측정하실 수 있어요 :)",
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 14, fontFamily: "Pretendard", color: Color(0xFF212529), fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 14.0),
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "※‘A4용지로촬영’은 임시측정용으로만 활용해주세요.",
                        style: new TextStyle(fontSize: 12, fontFamily: "Pretendard", color: Color(0xFF545454), fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 48,
                  margin: EdgeInsets.only(top: 32, bottom: 24, left: 24, right: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, "100");
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          color: PrimaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          "확인",
                          style: new TextStyle(fontFamily: "Pretendard", fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
    ;
  }
}
