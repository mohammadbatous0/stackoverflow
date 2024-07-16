import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/constant.dart';
import '../model/time.dart';
import 'textdefult.dart';

class RowShowDetials extends StatelessWidget {
  final String? question, answer;
  final int? time;
  final IconData icons;
  const RowShowDetials(
      {super.key,
      required this.question,
      this.answer,
      required this.icons,
      this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorsApp.colorOrange)),
          child: Icon(
            icons,
            color: ColorsApp.colorOrange,
          ),
        ),
        const SizedBox(
          width: marginHorizintal,
        ),
        TextDefult(
          text: '$question : ',
          colortext: ColorsApp.colorBlack,
        ),
        TextDefult(
          text: time == null
              ? (answer == 'null' ? 'Not Found' : answer!)
              : TimeAgo().calctimeago(time!).toString(),
          colortext: ColorsApp.colorBlack,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
