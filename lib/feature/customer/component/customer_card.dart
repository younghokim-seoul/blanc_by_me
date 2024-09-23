import 'package:blanc_f/global/colors.dart';
import 'package:blanc_f/global/network/dto/customer_dto.dart';
import 'package:blanc_f/util/commonutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CustomerCard extends ConsumerWidget {
  const CustomerCard({super.key, required this.attributesData});

  final AttributesData attributesData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Gap(24),
              CustomerMeta(
                title: "고객ID",
                description: attributesData.identifier,
              ),
              const Gap(4),
              CustomerMeta(
                title: "고객명",
                description: attributesData.name,
              ),
              const Gap(4),
              CustomerMeta(
                title: "생년월일",
                description: attributesData.createdAt != null ? formatDate(attributesData.createdAt!) : '',
              ),
              const Gap(16),
              TakePictureButton(onClickable: () {}),
              const Gap(24),
            ],
          ),
        ));
  }
}

class CustomerMeta extends ConsumerWidget {
  const CustomerMeta({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w400,
                color: textGrey,
              ),
            ),
          ),
          const Gap(24),
          Flexible(
            child: Text(
              description,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w400,
                color: textBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TakePictureButton extends ConsumerWidget {
  const TakePictureButton({super.key, required this.onClickable});

  final VoidCallback onClickable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => onClickable.call(),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              border: Border.all(
                width: 1, //
                color: const Color(0xFFDDDDDD),
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: const Center(
            child: Text(
              "촬영하기",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.bold,
                color: Color(0xFF212529),
              ),
            ),
          )),
    );
  }
}
