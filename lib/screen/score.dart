import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizapp/constants.dart';
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
                      .copyWith(color: Colors.brown, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "Họ và tên:",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.indigo),
                ),
                Text(
                  "${_qnController.name}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.indigo),
                ),
                Spacer(),
                Text(
                  "Điểm: ${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
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
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        primary: Colors.deepPurple,
                        backgroundColor: kSecondaryColor,
                        textStyle: const TextStyle(fontSize: 18)),
                    child: Text(
                      'Chơi Lại',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.black, fontSize: 16),
                    )),
                Spacer(),
                OutlinedButton(
                    onPressed: () => {
                      Get.to(() => HighScore()),
                    },
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        primary: Colors.deepPurple,
                        backgroundColor: kSecondaryColor,
                        textStyle: const TextStyle(fontSize: 18)),
                    child: Text(
                      'Bảng Xếp Hạng',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.black, fontSize: 16),
                    )),
                Spacer(flex: 3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
