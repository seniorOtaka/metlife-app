import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(
      {Key? key,
      required this.text,
      required this.color,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w500,})
      : super(key: key);
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: 0,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
