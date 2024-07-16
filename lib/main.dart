import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_stack/constant/colors.dart';
import 'route.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'StackOverFlow',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        fontFamily: 'Arial',
        colorScheme: const ColorScheme.light(
          primary: ColorsApp.colorOrange,
        ),
        primaryColorLight: ColorsApp.colorBlack,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            surfaceTintColor: ColorsApp.colorBlack,
            centerTitle: true,
            backgroundColor: ColorsApp.colorBlack),
        useMaterial3: true),
    builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child!,
      );
    },
    getPages: AppRoute.routes,
  ));
}
