import 'package:flutter/material.dart';
import 'package:task_stack/constant/colors.dart';

class ImageDefult extends StatelessWidget {
  const ImageDefult({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/user.png',
      width: 45.0,
      height: 45.0,
      color: ColorsApp.colorBlack,
      fit: BoxFit.cover,
    );
  }
}
