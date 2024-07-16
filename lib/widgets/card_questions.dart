import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_stack/model/questions.dart';
import 'package:task_stack/widgets/card_owner.dart';
import 'package:task_stack/widgets/component_type.dart';
import 'package:task_stack/widgets/line_vertical.dart';
import '../constant/colors.dart';
import '../constant/constant.dart';
import 'row_icon.dart';
import 'textdefult.dart';

class CardQuestions extends StatelessWidget {
  final Question question;
  const CardQuestions({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/detials', arguments: {'quesion': question});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: marginvertical),
        decoration: BoxDecoration(
            color: ColorsApp.colorWhite,
            boxShadow: [shadownice(color: ColorsApp.colorGrey)]),
        child: Padding(
          padding: const EdgeInsets.all(paddingVertical),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CardDataOwner(image: question.owner!.image, name: question.owner!.name, time: question.datecreated),
              const Divider(
                color: ColorsApp.colorGrey,
                thickness: opacity,
              ),
              TextDefult(
                text: question.title!,
                colortext: ColorsApp.colorBlue,
                fontWeight: FontWeight.bold,
                textOverflow: TextOverflow.visible,
              ),
             ComponentViewType(type: question.tags),
              // Row(
              //   children: [
              // ...List.generate(question.tags!.length,
              //     (index) => BoxTagDefult(titleTag: question.tags![index]))
              //   ],
              // ),
              const Divider(
                color: ColorsApp.colorGrey,
                thickness: opacity,
              ),
              //? button details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RowIconDefult(
                      icons: Icons.remove_red_eye_outlined,
                      text: question.viewcount.toString()),
                  const LineVerticalDefult(height: 15),
                  RowIconDefult(
                      icons: Icons.comment_outlined,
                      text: question.answercount.toString()),
                  const LineVerticalDefult(height: 15),
                  RowIconDefult(
                      icons: Icons.arrow_circle_up_outlined,
                      text: question.score.toString()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
