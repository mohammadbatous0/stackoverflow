import 'package:get/get.dart';
import 'package:task_stack/view/detials_question.dart';
import 'package:task_stack/view/questions.dart';
import 'package:task_stack/view/splach.dart';

class AppRoute {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: '/', page: () => const SplachScreen()),
    GetPage(name: '/questions', page: () => const QuestionsScreen()),
    GetPage(name: '/detials', page: () => const DetialsQuestionsScreen()),
  ];
}
