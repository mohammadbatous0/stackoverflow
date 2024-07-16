import 'package:flutter/material.dart';
import 'package:task_stack/constant/colors.dart';

/*
  ========================================

  CODING BY : MOHAMMAD MAHMOUD BATOUS
        ** FULLSTACK DEVELOPER ** 

  ========================================

*/
const double paddingHorizintal = 8.0;
const double paddingVertical = 12.0;
const double marginvertical = 5.0;
const double marginHorizintal = 6.0;
const double borderRadius = 30.0;
const double imagewidth = 300.0;
const double opacity = 0.25;

// void snackbarmodern({required String message, required IconData icons}) {
//   Get.showSnackbar(GetSnackBar(
//     duration: const Duration(seconds: 3),
//     margin: EdgeInsets.all(constantappdata['m-r']),
//     messageText: TextDefult(
//       text: message,
//       textOverflow: TextOverflow.visible,
//     ),
//     icon: Icon(
//       icons,
//       color: StyleIdelibRestaurants.colorWhite,
//     ),
//   ));
// }

BoxShadow shadownice({Color color = ColorsApp.colorOrange}) {
  return BoxShadow(
      color: color.withOpacity(opacity),
      spreadRadius: 1,
      blurRadius: 5,
      offset: const Offset(0, 3));
}
