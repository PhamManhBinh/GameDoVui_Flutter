import 'package:flutter/material.dart';
import 'package:quizapp/model/score.dart';
import 'package:quizapp/service/httpservice.dart';
import 'package:dio/dio.dart';

class HighScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
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
                //Spacer(flex: 3),
                Text('Điểm cao'),
                //Spacer(),
                FutureBuilder<List<Score>>(
                  future: HttpService(Dio()).getScores(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(60),
                        itemCount: (data.length < 7 ) ? data.length + 1 : 7,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return ListTile(
                                title: Row(
                              children: [
                                Expanded(child: Text("Rank")),
                                Expanded(child: Text("Họ Tên")),
                                Expanded(child: Text("Điểm Số"))
                              ],
                            ));
                          }
                          index--;
                          return ListTile(
                              title: Row(
                            children: [
                              Expanded(child: Text((index + 1).toString())),
                              Expanded(child: Text(data[index].name)),
                              Expanded(
                                  child: Text(data[index].score.toString()))
                            ],
                          ));
                        },
                      );
                    } else {
                      return Text("Không có dữ liệu");
                    }
                  },
                )
              ],
            ))
          ],
        ));
  }
}
