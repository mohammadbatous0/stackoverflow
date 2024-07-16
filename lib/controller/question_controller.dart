import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_stack/model/questions.dart';
import 'package:task_stack/servers/apidata.dart';
import 'package:task_stack/servers/connect.dart';
import 'package:task_stack/servers/crud.dart';
import 'package:task_stack/servers/sqflite.dart';
import 'package:task_stack/servers/status.dart';
import 'package:toast/toast.dart';

class QuestionController extends GetxController {
  List<Question> questions = [];
  //for status
  StatusRequest statusRequest = StatusRequest.intiliaze;
  //for pagination
  final ScrollController scrollController = ScrollController();
  final int limitquestion = 100;
  //initiliaze
  final int limitInitiliaze = 10;
  //max number page can you get
  final int maxnumberpage = 25;
  //current page you get
  int numberpagecurrent = 1;
  //status user get data again or no
  bool getismore = false;

  //! for plugin
  static const platform = MethodChannel('stack_exchange_plugin');
  Future<void> showToasting() async {
    try {
      final String result = await platform.invokeMethod('fetchQuestions');
      Toast.show(result);
    } on PlatformException catch (e) {
      Toast.show('Failed to fetch questions: ${e.message}');
    }
  }

  // start get data from api
  Future<void> getquestions() async {
    try {
      //check found connect internet
      bool checkinternet = await Connect().checkFoundInternet();
      if (checkinternet) {
        //initliaze
        if (!getismore) {
          statusRequest = StatusRequest.loading;
          update();
        }
        //start get data
        final Map data = await CrudData.getdatafromapi(
            urlapi:
                '${ApiData.questionsurl}&pagesize=$limitInitiliaze&page=$numberpagecurrent');
        if (data['items'] != null) {
          // print('==============data================');
          // print(data);
          // print('==============data end================');
          statusRequest = StatusRequest.complete;
          List dataconfig = data['items'];
          questions
              .addAll(dataconfig.map((element) => Question.formJson(element)));

          for (var elements in questions) {
            // int statusAdding =
            await SqfDataBase().insertData('questions', elements.toJson());
            // print(statusAdding);
          }
          Toast.show('success', duration: 3);
          /*
           ? you can use    
          Get.showSnackbar(GetSnackBar(message: 'here message',));
          */
        } else {
          statusRequest = StatusRequest.failure;
        }
        getismore = false;
        update();
      } else {
        List<Map<String, dynamic>> items =
            await SqfDataBase().readdata('questions');
        // print(items);
        questions.addAll(items.map((e) => Question.formJson(e)));

        statusRequest = StatusRequest.complete;
        Toast.show('success', duration: 3);

        if (questions.isEmpty) {
          //handle tp use show image if you no found data
          statusRequest = StatusRequest.offline;
          // print('no data');
        }
        update();
      }
    } catch (error) {
      //? handle error
    }
  }

  // scrollListener
  void _addlistener() {
    if (getismore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      //fetch data
      if (numberpagecurrent != maxnumberpage) {
        // print(numberpagecurrent);
        getismore = true;
        numberpagecurrent += 1;
        getquestions();
      }
    }
  }

  @override
  void onInit() {
    getquestions();
    scrollController.addListener(_addlistener);
    super.onInit();
  }
}
