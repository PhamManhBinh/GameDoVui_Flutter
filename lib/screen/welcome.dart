import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/screen/quiz.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/util/util.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = "";
    return Scaffold(
      body: Stack(
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
                  padding: EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      Spacer(flex: 2),
                      Text(
                        'Game Đố Vui',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: Color(0xFFC93838),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text('Vui lòng nhập tên của bạn:',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Color(0xFF3B3E10),
                                  fontWeight: FontWeight.bold)),
                      Spacer(),
                      TextField(
                        onChanged: (text) {
                          name = text;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 190, 202, 254),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          hintText: 'Họ và tên',
                        ),
                      ),
                      Spacer(),
                      OutlinedButton(
                          onPressed: () {
                            if (name == "") {
                              Util.ShowToast("Vui lòng nhập tên người chơi",
                                  Colors.grey, Colors.white);
                              return;
                            }
                            Get.to(() => Quiz(), arguments: name);
                          },
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(200, 50),
                              primary: Colors.deepPurple,
                              backgroundColor: kSecondaryColor,
                              textStyle: const TextStyle(fontSize: 18)),
                          child: Text(
                            'OK',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: Colors.black, fontSize: 16),
                          )),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}
