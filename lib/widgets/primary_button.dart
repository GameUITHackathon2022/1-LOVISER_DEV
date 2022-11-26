import 'package:flutter/material.dart';

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
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPress,
      child: Container(
          height: size.height * 0.06,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: color),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ))),
    );
  }
}
