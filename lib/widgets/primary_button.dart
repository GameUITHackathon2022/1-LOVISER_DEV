import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:uit_hackathon/utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPress;
  const PrimaryButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          color: AppColors.primaryColor,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ))),
    );
  }
}
