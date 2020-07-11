import 'page2.dart';
import 'page5.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class ExtractArgumentsScreen2 extends StatelessWidget {
  static const routeName = '/extractArguments2';
  int player_no = 0;

  @override
  Widget build(BuildContext context) {
    final ScreenArguments2 args = ModalRoute.of(context).settings.arguments;
    player_no = args.tosswinner;
    return Scaffold(
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
              'Player $player_no won the toss',
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
              'Player $player_no choose bat or bowl',
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
                Navigator.pushNamed(
                  context,
                  Wicketpage.routeName,
                  arguments: ScreenArguments3(
                    1,
                  ),
                );
              else
                Navigator.pushNamed(
                  context,
                  Wicketpage.routeName,
                  arguments: ScreenArguments3(
                    2,
                  ),
                );
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
                Navigator.pushNamed(
                  context,
                  Wicketpage.routeName,
                  arguments: ScreenArguments3(
                    2,
                  ),
                );
              else
                Navigator.pushNamed(
                  context,
                  Wicketpage.routeName,
                  arguments: ScreenArguments3(
                    1,
                  ),
                );
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
    );
  }
}
