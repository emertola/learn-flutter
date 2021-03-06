import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

// import './question.dart';
// import 'package:first_app/answer.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': 'What\'s the color of your eye?',
        'answers': [
          {'text': 'Black', 'score': 5},
          {'text': 'Brown', 'score': 8},
          {'text': 'Blue', 'score': 10},
          {'text': 'Green', 'score': 9},
          {'text': 'Other', 'score': 6}
        ]
      },
      {
        'questionText': 'What\s the color of your skin?',
        'answers': [
          {'text': 'White', 'score': 10},
          {'text': 'Brown', 'score': 6},
          {'text': 'Black', 'score': 2},
          {'text': 'Other', 'score': 5}
        ]
      },
      {
        'questionText': 'What\'s the shape of your head?',
        'answers': [
          {'text': 'Round', 'score': 8},
          {'text': 'Oval', 'score': 8},
          {'text': 'Square', 'score': 4},
          {'text': 'Other', 'score': 7}
        ]
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
