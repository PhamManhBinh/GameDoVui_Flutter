import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/screen/quiz.dart';

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
                      Spacer(),
                      Text(
                        'Đố Vui',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text('Nhập tên của bạn:'),
                      Spacer(),
                      TextField(
                        onChanged: (text) {
                          name = text;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.amber,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          hintText: 'Họ Tên',
                        ),
                      ),
                      Spacer(),
                      OutlinedButton(
                          onPressed: () =>
                              {Get.to(() => Quiz(), arguments: name)},
                          child: Text('OK')),
                      Spacer(),
                    ],
                  )))
        ],
      ),
    );
  }
}
