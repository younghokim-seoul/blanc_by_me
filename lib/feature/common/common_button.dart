import 'package:blanc_f/global/colors.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton._({
    required this.title,
    required this.width,
    required this.height,
    required this.color,
    required this.onPressed,
  });

  final double height;
  final double width;
  final Color color;
  final String title;
  final void Function()? onPressed;

  factory CommonButton.primary(String title, {Function()? onPressed}) {
    return CommonButton._(
      height: 56,
      width: double.infinity,
      color: PrimaryColor,
      title: title,
      onPressed: onPressed,
    );
  }

  factory CommonButton.secondary(String title, {Function()? onPressed}) {
    return CommonButton._(
      height: 56,
      width: double.infinity,
      color: SecondaryColor,
      title: title,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed?.call(),
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(8))),
        child:  Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
