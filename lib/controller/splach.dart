import 'package:get/get.dart';

class SplachController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2),(){
      Get.offNamedUntil('/questions', (route) => false);
    });
    super.onInit();
  }
}
