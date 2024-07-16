import 'package:flutter/material.dart';
import 'package:task_stack/constant/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsApp.colorOrange,
        backgroundColor: ColorsApp.colorBlack,
      ),
    );
  }
}
