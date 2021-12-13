import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Function answerCallback;
  final String answerText;

  Answer( this.answerText, this.answerCallback, {Key? key}) : super(key: key);

  // Answer({@required this.answerText, @required this.answerCallback);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      color: Colors.blue,
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      child: ElevatedButton(
        onPressed: () => answerCallback(),
        child: Text(answerText),
      ),
    );
  }
}
