import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/constant.dart';
import '../model/time.dart';
import 'image_defult.dart';
import 'textdefult.dart';

class CardDataOwner extends StatelessWidget {
  final String? image, name;
  final int? time;
  const CardDataOwner(
      {super.key, required this.image, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                padding: const EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorsApp.colorBlack)),
                child:
                    // handling view image
                    image == null
                        //? you can use status is offline or online
                        ? const ImageDefult()
                        : ClipOval(
                            child: Image.network(
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                // this not full handling

                                return child;
                              },
                              image!,
                              width: 45.0,
                              height: 45.0,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const ImageDefult();
                              },
                            ),
                          )),
            const SizedBox(
              width: marginHorizintal,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextDefult(
                  text: name!,
                  colortext: ColorsApp.colorBlack,
                  fontWeight: FontWeight.bold,
                ),
                TextDefult(
                  text: TimeAgo().calctimeago(time!),
                  colortext: ColorsApp.colorGrey,
                  fontsize: 14.0,
                )
              ],
            ),
          ],
        ),
        PopupMenuButton(
          surfaceTintColor: ColorsApp.colorWhite,
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 'report',
                child: TextDefult(
                  text: 'report',
                  colortext: ColorsApp.colorBlack,
                ),
              )
            ];
          },
          child: const Icon(
            Icons.more_horiz,
            color: ColorsApp.colorGrey,
          ),
        ),
      ],
    );
  }
}
