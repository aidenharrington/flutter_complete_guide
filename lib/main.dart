import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  // const is compile time constant
  // implicitly runtime constant as a result
  // you can also add const in front of value instead of variable
  final questions = const [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What\s your favourite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephand', 'Lion'],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': ['Joe', 'Smith', 'Bo Horvat', 'Bob'],
    },
  ];
  // questions = [] - does not work if questions is a const

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex < questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex % 3]['questionText']),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
