import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_stack/constant/colors.dart';
import 'package:task_stack/constant/constant.dart';
import 'package:task_stack/controller/detials_question.dart';
import 'package:task_stack/widgets/column_view_analytics.dart';
import 'package:task_stack/widgets/component_type_detials.dart';
import 'package:task_stack/widgets/row_detials.dart';
import 'package:task_stack/widgets/space.dart';
import 'package:task_stack/widgets/textdefult.dart';

class DetialsQuestionsScreen extends StatelessWidget {
  const DetialsQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetialsQuesionController controller = Get.put(DetialsQuesionController());
    return Scaffold(
      backgroundColor: ColorsApp.colorBlueOpacity,
      appBar: AppBar(
        title: const TextDefult(
          text: 'Detials Question',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(paddingHorizintal),
          decoration: BoxDecoration(
              color: ColorsApp.colorWhite,
              boxShadow: [shadownice(color: ColorsApp.colorGrey)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextDefult(
                text: '- ${controller.question.title!}',
                colortext: ColorsApp.colorBlue,
                fontWeight: FontWeight.bold,
                textOverflow: TextOverflow.visible,
              ),
              Row(
                children: [
                  const TextDefult(
                    text: 'Question from : ',
                    colortext: ColorsApp.colorBlack,
                    fontsize: 14.0,
                  ),
                  TextDefult(
                    text: controller.question.owner!.name!,
                    colortext: ColorsApp.colorBlack,
                    fontWeight: FontWeight.bold,
                    fontsize: 14.0,
                  )
                ],
              ),
              ComponentViewTypeDetials(type: controller.question.tags),
              const SpaceTop(),
              RowShowDetials(
                question: 'question id',
                icons: Icons.format_list_numbered,
                answer: controller.question.id.toString(),
              ),
              RowShowDetials(
                question: 'published in',
                icons: Icons.timelapse_rounded,
                time: controller.question.datecreated,
              ),
              RowShowDetials(
                question: 'last edit',
                icons: Icons.edit,
                time: controller.question.lastedit,
                answer: controller.question.lastedit == null ? 'No Edit' : null,
              ),
              RowShowDetials(
                question: 'last activity',
                icons: Icons.local_activity,
                time: controller.question.lastactivity,
              ),
              RowShowDetials(
                question: 'Accepted Answer Id',
                icons: Icons.star,
                answer: controller.question.acceptedAnswerId.toString(),
              ),
              const SpaceTop(),
              // analatics
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColumnViewAnalytics(
                    number: controller.question.viewcount,
                    title: 'View',
                    icons: Icons.remove_red_eye_outlined,
                  ),
                  ColumnViewAnalytics(
                    number: controller.question.answercount,
                    title: 'Comment',
                    icons: Icons.comment_outlined,
                  ),
                  ColumnViewAnalytics(
                    number: controller.question.score,
                    title: 'Score',
                    icons: Icons.arrow_circle_up_outlined,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(paddingHorizintal),
        decoration: BoxDecoration(
            color: ColorsApp.colorWhite,
            boxShadow: [shadownice(color: ColorsApp.colorOrange)]),
        child: ElevatedButton.icon(
            onPressed: () {
              // copy link
              controller.copylink(controller.question.link!);
            },
            icon: const Icon(
              Icons.copy,
              color: ColorsApp.colorWhite,
            ),
            label: const TextDefult(
              text: 'Copy Url',
              fontWeight: FontWeight.bold,
            ),
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorsApp.colorOrange))),
      ),
    );
  }
}
