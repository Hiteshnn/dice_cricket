import 'page2.dart';
import 'page4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:async';

class ExtractArgumentsScreen1 extends StatefulWidget {
  static const routeName = '/extractArguments1';
  @override
  _ExtractArgumentsScreen1State createState() =>
      _ExtractArgumentsScreen1State();
}

class _ExtractArgumentsScreen1State extends State<ExtractArgumentsScreen1> {
  int leftDiceNumber = 6, rightDiceNumber = 6, b;
  String c, d, e;
  bool toss1 = false;
  bool toss2 = true;
  String result;

  void go_to_page3(int tosswinner) {
    Timer(Duration(milliseconds: 500), () {
      Navigator.pushNamed(
        context,
        ExtractArgumentsScreen2.routeName,
        arguments: ScreenArguments2(
          tosswinner,
          d,
          e,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments1 args = ModalRoute.of(context).settings.arguments;
    b = args.player;
    c = args.choice;
    d = args.player1name;
    e = args.player2name;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Tosspage'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            /*RaisedButton(
              onPressed: () {
                _showDialog(
                    content:
                        'Both the players click the dice once, player 1 followed by player 2');
              },
              child: Text('Alert!!!'),
            ),*/
            Text(
              args.player1name,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: toss1
                    ? null
                    : () => setState(() {
                          leftDiceNumber = Random().nextInt(6) + 1;
                          toss1 = true;
                          toss2 = false;
                        }),
                child: Image(
                  image: AssetImage('images/dice$leftDiceNumber.png'),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
            Text(
              args.player2name,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: toss2
                    ? null
                    : () => setState(() {
                          rightDiceNumber = Random().nextInt(6) + 1;
                          if ((leftDiceNumber + rightDiceNumber) % 2 == 1)
                            result = 'Odd';
                          else
                            result = 'Even';
                          if (result == c)
                            go_to_page3(b);
                          else if (b == 1)
                            go_to_page3(2);
                          else
                            go_to_page3(1);
                        }),
                child: Image(
                  image: AssetImage('images/dice$rightDiceNumber.png'),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
