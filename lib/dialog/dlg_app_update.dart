import 'package:blanc_f/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppUpdateDialog extends StatelessWidget {
  const AppUpdateDialog({super.key, required this.onConfirm,required this.onCancel});

  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    onCancel.call();
                  },
                  child: Image.asset(
                    "assets/cross_b.png",
                    width: 24,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            const Gap(16),
            Image.asset(
              "assets/alert-circle.png",
              width: 44,
              fit: BoxFit.fitWidth,
            ),
            const Gap(16),
            const Text(
              "블랑바이미 업데이트 안내",
              style: TextStyle(
                  fontSize: 24, fontFamily: "Pretendard", color: Color(0xFF212529), fontWeight: FontWeight.w600),
            ),
            const Gap(24),
            const Text(
              "사진촬영 시 치아자동인식에 대한\n정확도를 높인 새로운 버전이 출시\n되었어요! 더욱 편리한 블랑바이미를\n경험해보세요 :)",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, fontFamily: "Pretendard", color: Color(0xFF212529), fontWeight: FontWeight.w400),
            ),
            const Gap(24),
            const Text(
              "업데이트를 위해 스토어로 이동합니다.",
              style: TextStyle(
                  fontSize: 16, fontFamily: "Pretendard", color: Color(0xFF545454), fontWeight: FontWeight.w400),
            ),
            const Gap(32),
            Container(
              height: 48,
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: GestureDetector(
                onTap: () {
                  onConfirm.call();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration:
                  const BoxDecoration(color: PrimaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      "앱 업데이트 하러가기",
                      style: TextStyle(
                          fontFamily: "Pretendard", fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
