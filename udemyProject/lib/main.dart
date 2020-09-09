import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
} // moze se stavit => runApp(MyApp()); koristi se samo kad se samo 1 funkicaja koristi

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final questions = const [
    {
      'questionText': 'What\s your favourite color?',
      'answer': [
        {'text': 'Blue', 'score': 2},
        {'text': 'Black', 'score': 6},
        {'text': 'Pink', 'score': 9},
        {'text': 'Yellow', 'score': 4}
      ]
    },
    {
      'questionText': 'What\s your favourite animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Lion', 'score': 5},
        {'text': 'Cat', 'score': 1},
        {'text': 'Dog', 'score': 2}
      ]
    },
    {
      'questionText': 'Who\s your favourite instructor?',
      'answer': [
        {'text': 'John', 'score': 3},
        {'text': 'Mike', 'score': 3},
        {'text': 'Max', 'score': 4},
        {'text': 'Felix', 'score': 10}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print('We have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first App"),
        ),
        body: _questionIndex < questions.length
            ? Center(
                child: Quiz(
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
                questions: questions,
              ))
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
