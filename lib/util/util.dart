import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Util {
  // declare confettiController;
  static ConfettiController _confettiStarsController =
      ConfettiController(duration: const Duration(seconds: 10));

  static ConfettiController _confettiController =
  ConfettiController(duration: const Duration(seconds: 2));

  //confetti util
  static Align ConfettiStarsAnimation() {
    _confettiStarsController.play();
    return Align(
      alignment:
          // confetti will pop from top-center
          Alignment.center,
      child: ConfettiWidget(
        confettiController: _confettiStarsController,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 10,
        minBlastForce: 1,
        emissionFrequency: 0.01,

        // 20 paticles will pop-up at a time
        numberOfParticles: 20,

        // particles will come down
        gravity: 1,

        // start again as soon as the
        // util is finished
        shouldLoop: true,

        // assign colors of any choice
        colors: const [
          Colors.green,
          Colors.yellow,
          Colors.pink,
          Colors.orange,
          Colors.blue,
          Colors.purpleAccent
        ],
        createParticlePath: drawStar, // define a custom shape/path.
      ),
    );
  }

  static Align confettiAnimation() {
    return // align the confetti on the screen
        Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              maxBlastForce: 5,
              minBlastForce: 1,
              emissionFrequency: 0.01,

              // 10 paticles will pop-up at a time
              numberOfParticles: 20,

              // particles will come down
              gravity: 1,

              // start again as soon as the
              // util is finished
              shouldLoop: true,

              // assign colors of any choice
              colors: const [
                Colors.green,
                Colors.yellow,
                Colors.pink,
                Colors.orange,
                Colors.blue
              ],
            ));
  }

  static void startAnimationWhenChooseTrueAnswer(){
    _confettiController.play();
    Future.delayed(Duration(seconds: 2),(){
      _confettiController.stop();
    });
  }

  /// A custom Path to paint stars.
  static Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  static void ShowToast(String text,Color bgColor,Color textColor) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: textColor,
        fontSize: 16.0
    );
  }
}
