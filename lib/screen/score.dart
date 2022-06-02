import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizapp/screen/highscore.dart';
import 'package:quizapp/screen/welcome.dart';
import 'package:quizapp/util/util.dart';

import '../controller/questionController.dart';

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/bg.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          SafeArea(
            child: Column(
              children: [
                Util.ConfettiStarsAnimation(),
                Spacer(flex: 3),
                Text(
                  "Kết Quả",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.black),
                ),
                Spacer(),
                Text(
                  "${_qnController.name}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.indigo),
                ),
                Spacer(),
                Text(
                  "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.red),
                ),
                Spacer(),
                OutlinedButton(
                    onPressed: () => {
                          Get.offAll(() => Welcome()),
                          _qnController.initDataController()
                        },
                    child: Text('Chơi Lại')),
                Spacer(),
                OutlinedButton(
                    onPressed: () => {
                          Get.to(() => HighScore()),
                        },
                    child: Text('Bảng Xếp Hạng')),
                Spacer(flex: 3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
