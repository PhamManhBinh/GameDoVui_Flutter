import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/controller/questionController.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3F4768), width: 3),
          borderRadius: BorderRadius.circular(50)),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                    builder: (context, constraints) => Container(
                      width: constraints.maxWidth * controller.animation.value, //50%
                      decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.circular(50)),
                    )),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('${20-(controller.animation.value * 20).round()} giây',
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 16)),
                )
              ],
            );
          }),
    );
  }
}
