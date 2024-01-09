import 'dart:convert';

import 'package:flutter_application_2/model/article_model.dart';
import 'package:http/http.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=tesla&from=2023-12-09&sortBy=publishedAt&apiKey=4b2a8c177b524511a57a9bf40b62a610";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl as Uri);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("can't get the Articles");
    }
  }
}
