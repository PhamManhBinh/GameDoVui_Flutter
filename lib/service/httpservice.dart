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

part 'httpservice.g.dart';

@RestApi(baseUrl: "https://xinloiduocchua.xyz/quizapp/")
abstract class HttpService {
  factory HttpService(Dio dio) = _HttpService;

  @GET("/question.php")
  Future<List<Question>> getQuestions();
}