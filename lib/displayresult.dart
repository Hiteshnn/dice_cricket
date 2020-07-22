import 'screenarguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'playagain.dart';

class Result extends StatelessWidget {
  static const routeName = '/extractArguments5';
  String result, p1, p2;
  @override
  Widget build(BuildContext context) {
    final ScreenArguments5 args = ModalRoute.of(context).settings.arguments;
    p1 = args.player1name;
    p2 = args.player2name;
    if (args.player1score < args.player2score)
      result = '$p2 won the match';
    else if (args.player2score < args.player1score)
      result = '$p1 won the match';
    else if (args.player1score == args.player2score) result = 'Match is drawn';

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(
              context,
              Lastpage.routeName,
            );
          },
          child: Icon(
            Icons.navigate_next,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
