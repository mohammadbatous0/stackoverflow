import 'package:flutter/material.dart';
import 'package:task_stack/constant/colors.dart';
import 'package:task_stack/servers/status.dart';
import 'package:task_stack/widgets/loading.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget child;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.child});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        //handle loading
        ? const LoadingWidget()
        : statusRequest == StatusRequest.offline
            //handle offline
            ? Center(
                child: Image.asset(
                  'images/offline.png',
                  width: 250.0,
                  height: 250.0,
                ),
              )
            //handle error
            : statusRequest == StatusRequest.failure
                ? const Center(
                    child: Icon(
                    Icons.error,
                    color: ColorsApp.colorBlack,
                    size: 40,
                  ))
                : child;
  }
}
