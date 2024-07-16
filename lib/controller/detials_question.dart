import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_stack/model/questions.dart';
import 'package:toast/toast.dart';

class DetialsQuesionController extends GetxController {
  late Question question;

  void copylink(String link) {
    Clipboard.setData(ClipboardData(text: link)).then((value) {
      Toast.show('copy sucssess');
    });
  }

  @override
  void onInit() {
    question = Get.arguments['quesion'];
    super.onInit();
  }
}
