import 'package:flutter/material.dart';
import 'package:task_stack/constant/colors.dart';

class TextDefult extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color colortext;
  final double fontsize;
  final FontWeight fontWeight;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  const TextDefult(
      {required this.text,
      this.textAlign = TextAlign.left,
      this.colortext = ColorsApp.colorWhite,
      this.fontsize = 16.0,
      this.fontWeight = FontWeight.normal,
      this.textDecoration,
      this.textOverflow = TextOverflow.ellipsis,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          overflow: textOverflow,
          color: colortext,
          fontSize: fontsize,
          decoration: textDecoration,
          fontWeight: fontWeight),
    );
  }
}
