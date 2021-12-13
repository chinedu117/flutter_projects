import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result({Key? key, required this.resultScore, required this.resetQuiz}) : super(key: key);
  
  String get resultText {

    String text;
    if(resultScore < 10){
        text = "You are a nice person";

    }else if (resultScore < 15){
        text = "You are average. Not so bad";

    }else {
        text = "You can improve on your personality";
    }
     
     return text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),

        ElevatedButton(onPressed: () => resetQuiz(), child: const Text("Reset Quiz"))
      ],
    );
  }
}
