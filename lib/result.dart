import 'package:flutter/material.dart';



class Result extends StatelessWidget {

  final int resultScore;
  final VoidCallback restartQuiz;

  Result(this.resultScore, this.restartQuiz);

  String get resultPhrase{
    String resultText;
    if(resultScore<=8){
      resultText='You are awsome!';
    }
    if(resultScore<=12){
      resultText='You are nice!';
    }
    if(resultScore<=16){
      resultText='Nice choice!';
    }else{
      resultText='You are bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: restartQuiz, child: Text("Restart quiz!"), textColor: Colors.blue,)
        ],
      ),
    );
  }
}
