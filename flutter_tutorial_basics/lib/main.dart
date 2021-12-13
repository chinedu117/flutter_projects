import 'package:flutter/material.dart';
import 'package:flutter_tutorial_basics/quiz.dart';
import 'package:flutter_tutorial_basics/result.dart';
import 'question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int questionIndex = 0;

  int totalScore = 0;

  final questions = [
    {
      "questionText": "What is your favorite color ",
      "answers": [
        {"answerText": "White", "score": 1},
        {"answerText": "Black", "score": 17},
        {"answerText": "Blue", "score": 4},
        {"answerText": "Orange", "score": 5}
      ]
    },
    {
      "questionText": "What is your favorite animal ",
      "answers": [
        {"answerText":"Cow", "score": 5},
        {"answerText":"Goat", "score": 10},
        {"answerText":"Chicken", "score": 2},
        {"answerText":"Fish", "score": 5}
      ]
    }
  ];

  void resetQuiz()
  {
     setState(() {
        totalScore = 0;
        questionIndex = 0;
     });
  }

  void answerQuestion(int score) {
    print("Printing the score");
    print(score);
    totalScore+=score;

    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Question and Answer"),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion:answerQuestion,
                questionIndex: questionIndex,
              )
            :  Result(
                resultScore: totalScore,
                resetQuiz: resetQuiz,
              ),
      ),
    );
  }
}
