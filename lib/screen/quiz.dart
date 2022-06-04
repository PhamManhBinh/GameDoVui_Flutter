import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizapp/screen/component/body.dart';

import '../controller/questionController.dart';

class Quiz extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final QuestionController _questionController =
    Get.put(QuestionController());
    _questionController.resetCounter();
    _questionController.name = Get.arguments;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
              onPressed: () {
                _questionController.nextQuestion();
              },
              child: Text(
                "NEXT",
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: Colors.black),
              ))
        ],
      ),
      body: Body(),
    );
  }
}
