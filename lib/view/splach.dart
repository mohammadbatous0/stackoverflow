import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_stack/constant/colors.dart';
import 'package:task_stack/constant/constant.dart';
import 'package:task_stack/controller/splach.dart';
class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(SplachController());
    return Container(
        padding: const EdgeInsets.all(paddingHorizintal),
        color: ColorsApp.colorWhite,
        child: Center(
          child: Image.asset(
            'images/logo.png',
            width: imagewidth,
          ),
        ));
  }
}
