import 'package:diceecricket/page6.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';
import 'page7.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), routes: {
      ExtractArgumentsScreen1.routeName: (context) => ExtractArgumentsScreen1(),
      ExtractArgumentsScreen2.routeName: (context) => ExtractArgumentsScreen2(),
      Wicketpage.routeName: (context) => Wicketpage(),
      Game.routeName: (context) => Game(),
      Result.routeName: (context) => Result(),
    });
  }
}

class HomeScreen extends StatelessWidget {
  int i = Random().nextInt(2) + 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Center(child: Text('Dice Cricket')),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Player $i choose odd or even',
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
              Navigator.pushNamed(
                context,
                ExtractArgumentsScreen1.routeName,
                arguments: ScreenArguments1(
                  'Odd',
                  i,
                ),
              );
            },
            child: Text(
              'ODD',
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
              Navigator.pushNamed(
                context,
                ExtractArgumentsScreen1.routeName,
                arguments: ScreenArguments1(
                  'Even',
                  i,
                ),
              );
            },
            child: Text(
              'EVEN',
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
