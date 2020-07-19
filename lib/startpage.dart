//import 'package:diceecricket/provider.dart';
//import 'package:provider/provider.dart';
import 'instructions.dart';
import 'page2.dart';
import 'page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class Startpage extends StatelessWidget {
  static const routeName = '/nextpage';
  String nameoftheplayer, player1, player2;
  int i = Random().nextInt(2) + 1;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Alert!!!"),
          content: Text(
              'Both the players click the dice once, $player1 followed by $player2'),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments6 args = ModalRoute.of(context).settings.arguments;
    if (i == 1)
      nameoftheplayer = args.player1name;
    else
      nameoftheplayer = args.player2name;
    player1 = args.player1name;
    player2 = args.player2name;

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Odd or Even'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              '$nameoftheplayer choose odd or even',
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
                  args.player1name,
                  args.player2name,
                ),
              );
              _showDialog(context);
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
                  args.player1name,
                  args.player2name,
                ),
              );
              _showDialog(context);
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
