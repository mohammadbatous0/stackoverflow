import 'package:flutter/material.dart';
import 'package:task_stack/constant/colors.dart';
import 'package:task_stack/constant/constant.dart';

import 'boxtag.dart';

class ComponentViewTypeDetials extends StatelessWidget {
  final List<dynamic>? type;
  const ComponentViewTypeDetials({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: type!.length,
        itemBuilder: (context, index) {
          return BoxTagDefult(
            titleTag: type![index],
            bg: Colors.transparent,
            border: Border.all(color: ColorsApp.colorGrey),
            radius: borderRadius,
            colortext: ColorsApp.colorGrey,
          );
        },
      ),
    );
  }
}
