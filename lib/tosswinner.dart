import 'screenarguments.dart';
import 'wicketpage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class ExtractArgumentsScreen2 extends StatelessWidget {
  static const routeName = '/extractArguments2';
  int player_no = 0;
  String a, b, c;
  void go_to_page4({BuildContext context, int number}) {
    Navigator.pushNamed(
      context,
      Wicketpage.routeName,
      arguments: ScreenArguments3(
        number,
        a,
        b,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments2 args = ModalRoute.of(context).settings.arguments;
    player_no = args.tosswinner;
    a = args.player1name;
    b = args.player2name;
    if (player_no == 1)
      c = a;
    else
      c = b;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Select your choice'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                '$c won the toss',
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
                '$c choose bat or bowl',
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
            FlatButton(
              onPressed: () {
                if (player_no == 1)
                  go_to_page4(context: context, number: 1);
                else
                  go_to_page4(context: context, number: 2);
              },
              child: Text(
                'BAT',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
            FlatButton(
              onPressed: () {
                if (player_no == 1)
                  go_to_page4(context: context, number: 2);
                else
                  go_to_page4(context: context, number: 1);
              },
              child: Text(
                'BOWL',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
