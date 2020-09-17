import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return _MyAppState();
  }

}
class _MyAppState extends State<MyApp>{
  final _questions = const [
    {'questionText':'What is your favorite colour',
      'answers':[
        {
          'text':'Black',
          'score': 10
        },
        {
          'text':'Red',
          'score': 5
        },
        {
          'text':'Green',
          'color': 4
        },
        {
          'text':'White',
          'color': 3
        }
      ],
    },
    {'questionText':'What is your favorite animal',
      'answers':[
        {
          'text':'Rabbit',
          'score': 5,
        },
        {
          'text':'Snake',
          'score': 10
        },
        {
          'text':'Elephant',
          'score': 4
        },
        {
          'text':'Lion',
          'score': 8
        }
      ],
    },
    {'questionText':'Who is your favorite instructor',
      'answers':[
        {
          'text':'Max',
          'score': 10
        },
        {
          'text':'Reuben',
          'score' : 0
        },
        {
          'text':'Jeff',
          'score': 9
        },
        {
          'text':'Saint',
          'score': 1
        }
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState((){
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    if(_questionIndex < _questions.length - 1){

    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: Scaffold(
       appBar: AppBar(
         title: Text('My First App'),
       ),
       body: _questionIndex < _questions.length ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions
            )
           : Result(_totalScore, _resetQuiz),
    ),);
  }

}