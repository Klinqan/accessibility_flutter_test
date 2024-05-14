import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.ontap,
    required this.title,
    this.textColor = Colors.white,
  });

  final void Function() ontap;
  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: ontap,
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.black),
        padding: const EdgeInsets.all(8),
        child: Text(
          title,
          style: const TextStyle(fontSize: 24).copyWith(color: textColor),
        ),
      ),
    );
  }
}
