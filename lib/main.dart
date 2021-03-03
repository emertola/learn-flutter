import 'package:flutter/material.dart';

import './question.dart';
import 'package:first_app/answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    // print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s the color of your eye?',
        'answers': ['Black', 'Brown', 'Blue', 'Green', 'Other']
      },
      {
        'questionText': 'What\s the color of your skin?',
        'answers': ['White', 'Brown', 'Black', 'Other']
      },
      {
        'questionText': 'What\'s the shape of your head?',
        'answers': ['Round', 'Oval', 'Square', 'Other']
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: questionIndex < questions.length
            ? Column(
                children: [
                  Question(questions[questionIndex]['questionText']),
                  ...(questions[questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('Sucess'),
              ),
      ),
    );
  }
}
