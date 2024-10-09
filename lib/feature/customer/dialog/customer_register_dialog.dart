import 'dart:math';

import 'package:blanc_f/feature/common/common_button.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final birthDayYearProvider = StateProvider.autoDispose<DateTime?>((ref) => null);

Future<void> showCustomerRegisterDialog(
  BuildContext context,
  Function(String, DateTime) onConfirm,
) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CustomerRegisterDialog(onConfirm: onConfirm);
    },
  );
}

class CustomerRegisterDialog extends HookConsumerWidget {
  const CustomerRegisterDialog({super.key, required this.onConfirm});

  final Function(String, DateTime) onConfirm;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userNameEditingController = useTextEditingController();


    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        width: (MediaQuery.of(context).size.width - 64),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {

                    Navigator.pop(context);
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
            const Text(
              "고객명",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w400,
                color: textBlack,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: MediaQuery.of(context).size.width - 32,
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1, //
                    color: Color(0xFFDDDDDD),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  controller: userNameEditingController,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            const Gap(24),
            const Text(
              "생년월일",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w400,
                color: textBlack,
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final strBirthdayYear = ref.watch(birthDayYearProvider);
                return InkWell(
                  onTap: () async {
                    late DateTime temp;
                    if (strBirthdayYear == null) {
                      temp = DateTime.now();
                    } else {
                      temp = strBirthdayYear;
                    }

                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: temp,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    ref.read(birthDayYearProvider.notifier).state = selectedDate;
                    print("selectedDate: $selectedDate");
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: MediaQuery.of(context).size.width - 32,
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1, //
                          color: const Color(0xFFDDDDDD),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                        ),
                        Expanded(
                          child: Text(
                            strBirthdayYear == null ? "" : formatDateTime(strBirthdayYear),
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF212529),
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/arrow_down.png",
                          width: 24,
                          fit: BoxFit.fitWidth,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const Gap(32),
            CommonButton.primary('등록', height: 48, onPressed: () {
              if (userNameEditingController.text.isEmpty || ref.read(birthDayYearProvider) == null) {
                return;
              }
              onConfirm.call(userNameEditingController.text, ref.read(birthDayYearProvider)!);
            }),
          ],
        ),
      ),
    );
  }
}
