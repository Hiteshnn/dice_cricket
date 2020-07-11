import 'package:diceecricket/page6.dart';

import 'page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class Wicketpage extends StatelessWidget {
  static const routeName = '/extractArguments3';
  int a, no;

  @override
  Widget build(BuildContext context) {
    final ScreenArguments3 args = ModalRoute.of(context).settings.arguments;
    a = args.firstbatsman;
    return Scaffold(
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
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Game.routeName,
                    arguments: ScreenArguments4(
                      a,
                      1,
                    ),
                  );
                },
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Game.routeName,
                    arguments: ScreenArguments4(
                      a,
                      2,
                    ),
                  );
                },
                child: Text(
                  '2',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Game.routeName,
                    arguments: ScreenArguments4(
                      a,
                      3,
                    ),
                  );
                },
                child: Text(
                  '3',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Game.routeName,
                    arguments: ScreenArguments4(
                      a,
                      4,
                    ),
                  );
                },
                child: Text(
                  '4',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Game.routeName,
                    arguments: ScreenArguments4(
                      a,
                      5,
                    ),
                  );
                },
                child: Text(
                  '5',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Game.routeName,
                    arguments: ScreenArguments4(
                      a,
                      6,
                    ),
                  );
                },
                child: Text(
                  '6',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Game.routeName,
                    arguments: ScreenArguments4(
                      a,
                      7,
                    ),
                  );
                },
                child: Text(
                  '7',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Game.routeName,
                    arguments: ScreenArguments4(
                      a,
                      8,
                    ),
                  );
                },
                child: Text(
                  '8',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Game.routeName,
                    arguments: ScreenArguments4(
                      a,
                      9,
                    ),
                  );
                },
                child: Text(
                  '9',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Game.routeName,
                    arguments: ScreenArguments4(
                      a,
                      10,
                    ),
                  );
                },
                child: Text(
                  '10',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
