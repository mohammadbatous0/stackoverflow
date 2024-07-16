import 'package:flutter/material.dart';
import 'package:task_stack/constant/colors.dart';

class LineVerticalDefult extends StatelessWidget {
  final double height;
  final Color colorline;
  const LineVerticalDefult({super.key, required this.height,  this.colorline = ColorsApp.colorGrey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: colorline,
      width: 2,
    );
  }
}
