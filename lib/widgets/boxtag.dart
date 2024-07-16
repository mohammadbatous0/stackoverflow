import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/constant.dart';
import 'textdefult.dart';

class BoxTagDefult extends StatelessWidget {
  final String titleTag;
  final double radius;
  final BoxBorder? border;
  final Color? bg;
  final Color colortext;
  const BoxTagDefult(
      {super.key,
      required this.titleTag,
      this.radius = 5.0,
      this.border,
      this.bg,
      this.colortext = ColorsApp.colorBlack});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingHorizintal),
      margin: const EdgeInsets.only(right: marginHorizintal, top: 5.0),
      decoration: BoxDecoration(
          color: bg ?? ColorsApp.colorGrey.withOpacity(opacity),
          borderRadius: BorderRadius.circular(radius),
          border: border),
      child: TextDefult(
        text: titleTag,
        colortext: colortext,
      ),
    );
  }
}
