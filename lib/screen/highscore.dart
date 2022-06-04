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
                // Spacer(flex: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 35),
                    Text(
                      'BẢNG XẾP HẠNG',
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color: Color(0xFF0054CD),
                            fontSize: 33,
                          ),
                    ),
                  ],
                ),
                // Spacer(),
                buildFutureBuilder()
              ],
            ))
          ],
        ));
  }

  FutureBuilder<List<Score>> buildFutureBuilder() {
    return FutureBuilder<List<Score>>(
      future: HttpService(Dio()).getScores(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          return buildListView(data);
        } else {
          return Text("Không có dữ liệu");
        }
      },
    );
  }

  ListView buildListView(List<Score> data) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: (data.length < 7) ? data.length + 1 : 7,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
              title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Text(
                "Rank",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
              Expanded(
                  child: Text(
                "Họ Và Tên",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
              Expanded(
                  child: Text(
                "Điểm Số",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
            ],
          ));
        }
        index--;
        return ListTile(
            title: Row(
          children: [
            Expanded(
                child: Text(
              "#${(index + 1).toString()}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: (index == 0 || index == 1 || index == 2)
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: (index == 0)
                      ? Colors.red[700]
                      : (index == 1)
                          ? Colors.yellow
                          : (index == 2)
                              ? Colors.green[800]
                              : Colors.black54),
            )),
            Expanded(
                child: Text(
              data[index].name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: (index == 0 || index == 1 || index == 2)
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: (index == 0)
                      ? Colors.red[700]
                      : (index == 1)
                          ? Colors.yellow
                          : (index == 2)
                              ? Colors.green[800]
                              : Colors.black54),
            )),
            Expanded(
                child: Text(
              data[index].score.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: (index == 0 || index == 1 || index == 2)
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: (index == 0)
                      ? Colors.red[700]
                      : (index == 1)
                          ? Colors.yellow
                          : (index == 2)
                              ? Colors.green[800]
                              : Colors.black54),
            ))
          ],
        ));
      },
    );
  }
}
