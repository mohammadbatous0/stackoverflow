import 'package:flutter/material.dart';
import '../constant/colors.dart';

class SpaceTop extends StatelessWidget {
  final double value;
  const SpaceTop({super.key, this.value = 0.5});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorsApp.colorGrey,
      thickness: value,
    );
  }
}
