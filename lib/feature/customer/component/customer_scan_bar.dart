import 'package:blanc_f/feature/common/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CustomerScanBar extends ConsumerWidget {
  const CustomerScanBar({
    super.key,
    required this.onCancelTap,
    required this.onSearchTap,
    required this.onRegisterTap,
  });

  final VoidCallback onCancelTap;
  final Function(String) onSearchTap;
  final Function() onRegisterTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(15),
        InkWell(
          onTap: () => onCancelTap(),
          child: SizedBox.square(
            dimension: 40,
            child: Image.asset(
              'assets/ic_close.png',
              color: Colors.black,
            ),
          ),
        ),
        const Gap(9),
        Container(
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1, //
                color: Color(0xFFDDDDDD),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              controller: controller,
              decoration: const InputDecoration(hintText: '검색어를 입력해주세요.', border: InputBorder.none),
            ),
          ),
        ),
        const Gap(9),
        Row(
          children: [
            Expanded(
              child: CommonButton.primary(
                '검색',
                onPressed: () => onSearchTap(controller.text),
              ),
            ),
            Gap(8),
            Expanded(
              child: CommonButton.secondary(
                '등록',
                onPressed: () => onRegisterTap(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
