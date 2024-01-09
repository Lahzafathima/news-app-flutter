import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/api_service.dart';

import 'model/article_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              // ignore: unused_local_variable
              List<Article>? articles = snapshot.data;
              return Center(
                child: Text("Succes !"),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
