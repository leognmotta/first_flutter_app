import 'package:flutter/material.dart';

import '../widgets/quiz.dart';
import '../widgets/Result.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'value': 'Black', 'score': 10},
        {'value': 'Red', 'score': 5},
        {'value': 'Green', 'score': 3},
        {'value': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'value': 'Dog', 'score': 1},
        {'value': 'Cat', 'score': 5},
        {'value': 'Bird', 'score': 3},
        {'value': 'Shark', 'score': 10},
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'value': 'Max', 'score': 1},
        {'value': 'Max', 'score': 1},
        {'value': 'Max', 'score': 1},
        {'value': 'Max', 'score': 1},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first flutter app'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _questionIndex < _questions.length
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      questions: _questions,
                      questionIndex: _questionIndex,
                    )
                  : Result(
                      _totalScore,
                      _resetQuiz,
                    ),
            ],
          )),
    );
  }
}
