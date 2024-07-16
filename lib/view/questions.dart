import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_stack/constant/colors.dart';
import 'package:task_stack/controller/question_controller.dart';
import 'package:task_stack/widgets/card_questions.dart';
import 'package:task_stack/widgets/handling_data.dart';
import 'package:task_stack/widgets/textdefult.dart';
import 'package:toast/toast.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // init toast
    ToastContext().init(context);
    QuestionController questionController = Get.put(QuestionController());

    return Scaffold(
      backgroundColor: ColorsApp.colorBlueOpacity,
      appBar: AppBar(
        title: const TextDefult(
          text: 'Questions',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await questionController.getquestions();
        },
        child: GetBuilder<QuestionController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.questions.length,
                  itemBuilder: (context, index) {
                    return CardQuestions(
                      question: controller.questions[index],
                    );
                  },
                ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () async {
            await questionController.showToasting();
          }),
    );
  }
}
