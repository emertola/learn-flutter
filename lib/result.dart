import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 15) {
      resultText = 'Such a nice person';
    } else if (resultScore <= 25) {
      resultText = 'You\'re so beautiful';
    } else {
      resultText = 'Like an angel';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetHandler, child: Text('Reset Quiz'))
        ],
      ),
    );
  }
}
