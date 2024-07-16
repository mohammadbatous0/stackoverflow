import 'package:flutter/material.dart';

import 'boxtag.dart';

class ComponentViewType extends StatelessWidget {
  final List<dynamic>? type;
  const ComponentViewType({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: type!.length,
        itemBuilder: (context, index) {
          return BoxTagDefult(titleTag: type![index],);
        },
      ),
    );
  }
}
