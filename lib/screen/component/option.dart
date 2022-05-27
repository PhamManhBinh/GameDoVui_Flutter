import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/questionController.dart';

class Option extends StatefulWidget {
  final String text;
  final int index;

  const Option({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  // @override
  // State<StatefulWidget> createState() {
  //   return OptionState(text: text, index: index)
  // }
  @override
  OptionState createState() => OptionState();
}

class OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (_questionController) {
          Color getColor() {
            if (_questionController.isAnswered) {
              if (widget.index == _questionController.correctAns) {
                return Colors.green;
              } else if (widget.index == _questionController.selectedAns &&
                  _questionController.selectedAns !=
                      _questionController.correctAns) {
                return Colors.red;
              }
            }
            return Colors.transparent;
          }

          IconData getIcon() {
            return getColor() == Colors.red ? Icons.close : Icons.done;
          }

          return GestureDetector(
            onTap: () {
              _questionController.checkAnswer(widget.index);
            },
            child: Container(
              margin: EdgeInsets.only(top: 18),
              padding: EdgeInsets.all(17),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                color: getColor(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "${(widget.index == 0) ? 'A' : (widget.index == 1) ? 'B' : (widget.index == 2) ? 'C' : 'D'}. ${widget.text}",
                      style: TextStyle(color: Colors.black45, fontSize: 16)
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black45)),
                    child: getColor() == Colors.transparent
                        ? null
                        : Icon(getIcon()),
                  )
                ],
              ),
            ),
          );
        });
  }
}
