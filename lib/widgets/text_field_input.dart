import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.01),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: Color(0xffe8ecf4)), //<-- SEE HERE
          ),
          filled: true,
          fillColor: const Color(0xfff7f8f9),
          hintStyle: const TextStyle(
            fontFamily: 'AvertaStdCY-Regular',
            color: Color(0xff616161),
          ),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: Colors.black38,
            ),
          ),
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Nhập $hintText của bạn';
          }
    
          return null;
        },
      ),
    );
  }
}
