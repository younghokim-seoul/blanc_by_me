import 'package:blanc_f/global/colors.dart';
import 'package:flutter/material.dart';

/**
 * 사진 촬영하는 방법
 */
class MethodDialog extends StatefulWidget {
  @override
  _MethodDialogState createState() => _MethodDialogState();
}

class _MethodDialogState extends State<MethodDialog> {
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
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 32.0),
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "사진 촬영하는 방법",
                        style: new TextStyle(fontSize: 20, fontFamily: "Pretendard", color: Color(0xFF212529), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, top: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                            color: Color(0xFFA9A9A9),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: const Text(
                            "블랑바이미 솔루션 구매 전이라면, ‘A4 용지로 촬영’을 클릭해주세요.",
                            style: TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, color: Color(0xFF545454), fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, top: 18, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                            color: Color(0xFFA9A9A9),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: const Text(
                            "‘사진촬영하기' 버튼을 클릭해주세요.",
                            style: TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, color: Color(0xFF545454), fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, top: 18, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                            color: Color(0xFFA9A9A9),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: const Text(
                            "‘촬영 방법' 버튼을 클릭해주세요.",
                            style: TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, color: Color(0xFF545454), fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, top: 18, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                            color: Color(0xFFA9A9A9),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Text(
                            "4",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: const Text(
                            "핸드폰을 가로로 돌려주시고, 사각형 안에 앞니 6개가 보이도록 해주세요.",
                            style: TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, color: Color(0xFF545454), fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, top: 18, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                            color: Color(0xFFA9A9A9),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Center(
                          child: Text(
                            "5",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: const Text(
                            "아무곳이나 클릭하여 촬영하면 완료!",
                            style: TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, color: Color(0xFF545454), fontSize: 14),
                          ),
                        ),
                      ),
                    ],
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
