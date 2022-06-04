// import 'dart:convert';
// import 'dart:math';
//
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart';
// import 'package:quizapp/model/question.dart';
//
// class HttpService {
//   static String url = "https://xinloiduocchua.xyz/quizapp/question.php";
//
//   // static List<Question> parseQuestions(String responseBody) {
//   //   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//   //
//   //   return parsed.map<Question>((json) => Question.fromJson(json)).toList();
//   // }
//   //
//   // static Future<List<Question>> getData(Client client) async {
//   //   final response = await client
//   //       .get(Uri.parse(url));
//   //
//   //   // Use the compute function to run parsePhotos in a separate isolate.
//   //   return compute(parseQuestions, response.body);
//   // }
//
//   //get data from web api
//   static Future<List<Question>> getData() async {
//     Response res = await get(Uri.parse(url));
//
//     if (res.statusCode == 200) {
//       List<dynamic> body = jsonDecode(res.body);
//
//       List<Question> question = body
//           .map(
//             (dynamic item) => Question.fromJson(item),
//       )
//           .toList();
//
//       return await question;
//     } else {
//       throw "Unable to retrieve questions.";
//     }
//   }
//
//   // static Future<List<Question>> getQuestions() async {
//   //   Response response = await get(Uri.parse(url));
//   //
//   //   if (response.statusCode == 200) {
//   //     return json.decode(response.body)
//   //         .map((data) => Question.fromJson(data))
//   //         .toList();
//   //   }
//   // }
// }

import 'package:json_annotation/json_annotation.dart';
import 'package:quizapp/model/question.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/score.dart';

part 'httpservice.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:3000/")
abstract class HttpService {
  factory HttpService(Dio dio) = _HttpService;

  @GET("/api/Question")
  Future<List<Question>> getQuestions();

  @GET("/api/Score")
  Future<List<Score>> getScores();

  @POST("/api/Score")
  @FormUrlEncoded()
  Future<List<Score>> newScore(@Field() String name,@Field() int score);

}

// @RestApi(baseUrl: "https://xinloiduocchua.xyz/quizapp/")
// abstract class HttpService {
//   factory HttpService(Dio dio) = _HttpService;
//
//   @GET("/question.php")
//   Future<List<Question>> getQuestions();
//
//   @GET("/score.php")
//   Future<List<Score>> getScores();
//
//   @POST("/score.php")
//   @FormUrlEncoded()
//   Future<List<Score>> newScore(@Field() String name,@Field() int score);
//
// }