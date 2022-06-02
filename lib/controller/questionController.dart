import 'dart:developer';
import 'package:confetti/confetti.dart';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:quizapp/util/util.dart';
import 'package:quizapp/screen/score.dart';
import 'package:dio/dio.dart';
import 'package:quizapp/service/httpservice.dart';

import '../model/question.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late String _name;

  String get name => this._name;

  set name(text) {
    _name = text;
  }

  late AnimationController _animationController;
  late Animation _animation;

  //getter
  Animation get animation => this._animation;

  //question data
  late List<Question> _questions = <Question>[];

  List<Question> get questions => this._questions;

  late bool _isAnswered;

  bool get isAnswered => this._isAnswered;

  late int _correctAns;

  int get correctAns => this._correctAns;

  late int _selectedAns;

  int get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  late RxInt _currentQuestion;

  RxInt get currentQuestion => this._currentQuestion;

  late RxInt _numOfCorrectAns;

  RxInt get numOfCorrectAns => this._numOfCorrectAns;

  ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 10));

  @override
  void onInit() async {
    //use retrofit to get data from Web API;
    // final dio = Dio();
    // final client = HttpService(dio);
    // client.getQuestions().then((data) => _questions = data);

    // TODO: implement onInit
    _animationController =
        AnimationController(duration: Duration(seconds: 20), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });
    //_animationController.forward().whenComplete(nextQuestion);
    initDataController();
    super.onInit();
  }

  // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
  }

  void initDataController() {
    _name = "";
    _isAnswered = false;
    _correctAns = 0;
    _selectedAns = 0;
    _currentQuestion = 0.obs;
    _numOfCorrectAns = 0.obs;
    resetCounter();
  }

  void checkAnswer(int selectAnswer) {
    if (_isAnswered == true) return;

    _isAnswered = true;
    _correctAns = _questions[_currentQuestion.value].true_answer;
    _selectedAns = selectAnswer;

    if (_correctAns == _selectedAns) {
      ;
      log("dung");
      _numOfCorrectAns++;
      Util.ShowToast(
          "Chúc mừng! Bạn đã chọn đáp án đúng !", Colors.red, Colors.white);
      Util.startAnimationWhenChooseTrueAnswer();
    } else {
      Util.ShowToast("Rất tiếc, câu trả lời chưa chính xác !", Colors.black12,
          Colors.white);
      log("sai");
    }

    _animationController.stop();
    update();

    //delay before go to next question
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_currentQuestion < questions.length - 1) {
      _isAnswered = false;
      _currentQuestion.value += 1;

      resetCounter();
    } else {
      EasyLoading.show(status: 'Loading...');
      HttpService(Dio())
          .newScore(name, _numOfCorrectAns.value * 10)
          .then((value) {
        EasyLoading.dismiss();
        Get.offAll(() => Score());
      });
    }
  }

  void resetCounter() {
    // Reset the counter
    _animationController.reset();

    // Then start it again
    // Once timer is finish go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
  }

  void setQuestions(List<Question> questions) {
    this._questions = questions;
  }
}
