import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  AnswerButton(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
