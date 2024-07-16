import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/constant.dart';
import 'textdefult.dart';

class RowIconDefult extends StatelessWidget {
  final IconData icons;
  final String text;
  const RowIconDefult({super.key, required this.icons, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons,
          color: ColorsApp.colorGrey,
        ),
        const SizedBox(
          width: marginHorizintal,
        ),
        TextDefult(
          text: text,
          colortext: ColorsApp.colorGrey,
        )
      ],
    );
  }
}
