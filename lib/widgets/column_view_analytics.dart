import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'textdefult.dart';

class ColumnViewAnalytics extends StatelessWidget {
  final String? title;
  final int? number;
  final IconData icons;

  const ColumnViewAnalytics(
      {super.key, this.title, this.number, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextDefult(
          text: number.toString(),
          colortext: ColorsApp.colorBlack,
        ),
        TextDefult(text: title!, colortext: ColorsApp.colorGrey),
        Icon(icons)
      ],
    );
  }
}
