import 'package:diceecricket/actualgame.dart';

import 'screenarguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class Wicketpage extends StatelessWidget {
  static const routeName = '/extractArguments3';
  int a, no, sec;
  String b,c,d,e;
  bool player_1, player_2;

  void _showDialog({BuildContext context, String content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Alert!!!"),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text("OK!!!"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  RaisedButton buildKey({BuildContext context, int Number}) {
    no = Number;
    return RaisedButton(
      //backgroundColor: Colors.white,
      onPressed: () {
        Navigator.pushNamed(
          context,
          Game.routeName,
          arguments: ScreenArguments4(
            a,
            Number,
            b,
            c,

          ),
        );
        _showDialog(
            context: context,
            content: '$d is batting , so $e start the game');
      },
      child: Text(
        '$no',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments3 args = ModalRoute.of(context).settings.arguments;
    a = args.firstbatsman;
    b=args.player1name;
    c=args.player2name;
    if (a == 1) {
      d=b;
      e=c;
      sec = 2;
      player_1 = true;
      player_2 = false;
    } else {
      sec = 1;
      d=c;
      e=b;
      player_2 = true;
      player_1 = false;
    }
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Number of wickets'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Select the number of wickets',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildKey(context: context, Number: 1),
                buildKey(context: context, Number: 2),
                buildKey(context: context, Number: 3),
              ],
            ),
            SizedBox(
              height: 40.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildKey(context: context, Number: 4),
                buildKey(context: context, Number: 5),
                buildKey(context: context, Number: 6),
              ],
            ),
            SizedBox(
              height: 40.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildKey(context: context, Number: 7),
                buildKey(context: context, Number: 8),
                buildKey(context: context, Number: 9),
              ],
            ),
            SizedBox(
              height: 40.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildKey(context: context, Number: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
