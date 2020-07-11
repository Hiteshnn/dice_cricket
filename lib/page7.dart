import 'page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Result extends StatelessWidget {
  static const routeName = '/extractArguments5';
  String result;
  @override
  Widget build(BuildContext context) {
    final ScreenArguments5 args = ModalRoute.of(context).settings.arguments;
    if (args.player1score < args.player2score)
      result = 'Player 2 won the match';
    else if (args.player2score < args.player1score)
      result = 'Player 1 won the match';
    else if (args.player1score == args.player2score) result = 'Match is drawn';

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              result,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
            child: Divider(
              color: Colors.red,
            ),
          ),
          Center(
            child: Text(
              'Congratulations!!!',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
