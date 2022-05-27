import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizapp/screen/component/option.dart';

import '../../util/util.dart';
import '../../controller/questionController.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final QuestionController _questionController = Get.put(QuestionController());
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Util.confettiAnimation(),
          Obx(()=>Text(_questionController.questions[_questionController.currentQuestion.value].question, style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black))),
          Obx(()=>Option(text: _questionController.questions[_questionController.currentQuestion.value].options[0], index: 0,)),
          Obx(()=>Option(text: _questionController.questions[_questionController.currentQuestion.value].options[1], index: 1,)),
          Obx(()=>Option(text: _questionController.questions[_questionController.currentQuestion.value].options[2], index: 2,)),
          Obx(()=>Option(text: _questionController.questions[_questionController.currentQuestion.value].options[3], index: 3,)),
        ],
      ),
    );
  }
}