import 'package:flutter/material.dart';
import 'package:ucenje/result.dart';

import './quiz.dart';
import './result.dart';

/*
void main() {
  runApp(MyApp());
}
*/

//ovo je alternativa ako unutar main bloka ima samo jedan izraz za izvrsiti
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s your favourite football club?',
      'answers': [
        {'text': 'Cibalia', 'score': 1},
        {'text': 'Real Madrid', 'score': 7},
        {'text': 'Dinamo Zagreb', 'score': 6},
        {'text': 'Vukovar 1991', 'score': 5},
      ],
    },
  ];

  var _totalScore = 0;

  void _answerQuestion(int score) {

    _totalScore+=score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz(){
    setState((){
      _questionIndex=0;
      _totalScore=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // vrste lista u dartu objašnjenje -> https://www.bezkoder.com/dart-list/
    // growable list deklariramo ovako
    // var myList = List();
    // to je isto kao ovo samo šturo napisano
    // var myList = [];
    // što koristimo ispod

    //npr List<int> question = <int>[];

    //mapu radimo {key:value}
    //ispod radimo listu 3 mape



    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Aplikacija"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _answerQuestion, _questionIndex)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
