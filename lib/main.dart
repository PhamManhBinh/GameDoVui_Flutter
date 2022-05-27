import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quizapp/screen/welcome.dart';
import 'package:quizapp/service/httpservice.dart';
import 'package:dio/dio.dart';
import 'package:quizapp/util/util.dart';
import 'controller/questionController.dart';
import 'model/question.dart';

void main() {
  //load data
  final dio = Dio();
  final client = HttpService(dio);
  client.getQuestions().then((data){
        Widget myApp = MyApp(data); //pass data to app
        runApp(myApp);
      });
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  const MyApp(List<Question> this.questions);

  final List<Question> questions;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final QuestionController _questionController = Get.put(QuestionController());
    _questionController.setQuestions(questions);
    return MainApp();
  }

  GetMaterialApp MainApp() {
    return GetMaterialApp(
      title: 'Đố Vui',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Welcome(),
    );
  }
}