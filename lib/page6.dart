import 'page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'page7.dart';

class Game extends StatefulWidget {
  static const routeName = '/extractArguments4';
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int leftDiceNumber = 1,
      rightDiceNumber = 2,
      p,
      score1 = 0,
      score2 = 0,
      wicket1 = 0,
      wicket2 = 0;
  int first = 0, wickets = 0, second = 0, count = 0, sec;
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

  void firstbat1() {
    if (leftDiceNumber != rightDiceNumber)
      score1 = score1 + leftDiceNumber;
    else if (leftDiceNumber == rightDiceNumber) wicket1 += 1;
  }

  void firstbat2() {
    if (leftDiceNumber != rightDiceNumber)
      score2 = score2 + rightDiceNumber;
    else if (leftDiceNumber == rightDiceNumber) wicket2 += 1;
  }

  void secondbat2() {
    if (leftDiceNumber != rightDiceNumber)
      score2 = score2 + rightDiceNumber;
    else if (leftDiceNumber == rightDiceNumber) wicket2 += 1;
  }

  void secondbat1() {
    if (leftDiceNumber != rightDiceNumber)
      score1 = score1 + leftDiceNumber;
    else if (leftDiceNumber == rightDiceNumber) wicket1 += 1;
  }

  void alertmessage({int player}) {
    p = player;
    _showDialog(
        content:
            'Player $p lost all the wickets, now player $p start rolling dice');
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments4 args = ModalRoute.of(context).settings.arguments;
    first = args.firstbatsman;
    wickets = args.wickets;
    if (first == 1)
      sec = 2;
    else
      sec = 1;

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Game starts here'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _showDialog(
                    content:
                        'Player $first is batting , so Player $sec start the game');
              },
              child: Text('Alert!!!'),
            ),
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
                    if (count == 0) {
                      if (first == 2) {
                        if (wicket2 == wickets) {
                          alertmessage(player: 2);
                          count++;
                        }
                      }
                    }
                    if (first == 1) {
                      if (wicket1 < wickets)
                        firstbat1();
                      else if (wicket1 == wickets) {
                        second = 2;
                      }
                    }
                    if (second == 1) {
                      if (wicket1 < wickets && score1 <= score2) {
                        secondbat1();
                      } else {
                        Navigator.pushNamed(
                          context,
                          Result.routeName,
                          arguments: ScreenArguments5(
                            score1,
                            score2,
                          ),
                        );
                      }
                    }
                  });
                },
                child: Image(
                  image: AssetImage('images/dice$leftDiceNumber.png'),
                ),
              ),
            ),
            Text(
              'Score :$score1/$wicket1',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
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
                    if (count == 0) {
                      if (first == 1) {
                        if (wicket1 == wickets) {
                          alertmessage(player: 1);
                          count++;
                        }
                      }
                    }
                    if (first == 2) {
                      if (wicket2 < wickets)
                        firstbat2();
                      else if (wicket2 == wickets) {
                        second = 1;
                      }
                    }
                    if (second == 2) {
                      if (wicket2 < wickets && score2 <= score1) {
                        secondbat2();
                      } else {
                        Navigator.pushNamed(
                          context,
                          Result.routeName,
                          arguments: ScreenArguments5(
                            score1,
                            score2,
                          ),
                        );
                      }
                    }
                  });
                },
                child: Image(
                  image: AssetImage('images/dice$rightDiceNumber.png'),
                ),
              ),
            ),
            Text(
              'Score :$score2/$wicket2',
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
          ],
        ),
      ),
    );
  }
}
