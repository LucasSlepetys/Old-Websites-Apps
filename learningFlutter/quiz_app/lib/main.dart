// ignore: import_of_legacy_library_into_null_safe
import 'package:quiz_view/quiz_view.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(letterSpacing: 2.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              QuizView(
                  image: Container(
                      height: 150,
                      width: 140,
                      child: Image.asset(
                        "assets/image1.jpg",
                        fit: BoxFit.fill,
                      )),
                  showCorrect: true,
                  questionTag: 'Question 1',
                  questionColor: Colors.black,
                  tagColor: Colors.white,
                  tagBackgroundColor: Colors.red.shade300,
                  answerColor: Colors.yellow,
                  question: "Is Lilly the prettiest girl alive?",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  rightAnswer: "She is and always will be",
                  wrongAnswers: ['Maybe', 'A little', 'Sometimes'],
                  onRightAnswer: () {
                    print("Right!");
                  },
                  onWrongAnswer: () {
                    AlertDialog(title: Text("Wrong!"));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
