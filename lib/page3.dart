import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page2.dart';
import 'page4.dart';

class ExtractArgumentsScreen1 extends StatefulWidget {
  static const routeName = '/extractArguments1';
  @override
  _ExtractArgumentsScreen1State createState() =>
      _ExtractArgumentsScreen1State();
}

class _ExtractArgumentsScreen1State extends State<ExtractArgumentsScreen1> {
  int leftDiceNumber = 6, rightDiceNumber = 6;
  String result;
  void go_to_page3(int tosswinner) {
    Navigator.pushNamed(
      context,
      ExtractArgumentsScreen2.routeName,
      arguments: ScreenArguments2(
        tosswinner,
      ),
    );
  }

  void _showDialog({String content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Alert!!!"),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text("Okay"),
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
  void initState() {
    super.initState();

    // Invokes the callback method on frame loading
    WidgetsBinding.instance.addPostFrameCallback((_) => _showDialog(
        content:
            'Both the players click the dice once, player 1 followed by player 2'));
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments1 args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Tosspage'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
//            RaisedButton(
//              onPressed: () {
//                _showDialog(
//                    content:
//                        'Both the players click the dice once, player 1 followed by player 2');
//              },
//              child: Text('Alert!!!'),
//            ),
            Text(
              'Player 1',
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
                onPressed: () {
                  setState(() {
                    leftDiceNumber = Random().nextInt(6) + 1;
                  });
                },
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
              'Player 2',
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
                onPressed: () {
                  setState(() {
                    rightDiceNumber = Random().nextInt(6) + 1;
                    if ((leftDiceNumber + rightDiceNumber) % 2 == 1)
                      result = 'Odd';
                    else
                      result = 'Even';
                    if (result == args.choice)
                      go_to_page3(args.player);
                    else if (args.player == 1)
                      go_to_page3(2);
                    else
                      go_to_page3(1);
                  });
                },
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
