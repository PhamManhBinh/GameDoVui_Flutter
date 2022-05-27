import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/util/util.dart';
import 'package:quizapp/controller/questionController.dart';
import 'package:quizapp/screen/component/progressbar.dart';
import 'package:quizapp/screen/component/questioncard.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        Image.asset(
          "assets/bg.png",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressBar(),
                SizedBox(height: 10),
                Obx(()=>Text.rich(
                    TextSpan(text: 'Câu hỏi ${_questionController.currentQuestion.value+1}/${_questionController.questions.length}'),
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),
                  ),
                ),
                Divider(thickness: 2.0),
                QuestionCard(),
                Obx(() =>
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                      'Điểm của bạn: ${_questionController.numOfCorrectAns * 10}',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.brown)),
                    )
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}




